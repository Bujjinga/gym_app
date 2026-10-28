import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/haptics.dart';
import '../../../core/utils/ids.dart';
import '../../achievements/application/achievement_engine.dart';
import '../../achievements/data/drift_progress_repository.dart';
import '../../achievements/domain/achievement_catalog.dart';
import '../../achievements/domain/personal_record.dart';
import '../../exercises/data/drift_exercise_repository.dart';
import '../../health/data/health_sync_service.dart';
import '../../plans/domain/plan_day.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../data/drift_workout_repository.dart';
import '../domain/exercise_entry.dart';
import '../domain/planned_exercise.dart';
import '../domain/pr_detector.dart';
import '../domain/set_entry.dart';
import '../domain/workout_session.dart';
import '../domain/workout_template.dart';
import 'active_workout_state.dart';

part 'active_workout_controller.g.dart';

/// Result of finishing a workout, for the summary screen.
typedef FinishResult = ({String sessionId, List<PersonalRecord> records, List<String> achievements});

/// The workout in progress (null when none). Live sessions are saved to the
/// database continuously, so they survive backgrounding and app restarts.
@Riverpod(keepAlive: true)
class ActiveWorkout extends _$ActiveWorkout {
  Timer? _debounce;
  AppLifecycleListener? _lifecycle;
  bool _starting = false;

  /// MET for general resistance training (Compendium code 02054).
  static const _strengthMet = 5.0;

  @override
  Future<ActiveWorkoutState?> build() async {
    _lifecycle = AppLifecycleListener(onHide: _flush, onPause: _flush);
    ref.onDispose(() {
      _debounce?.cancel();
      _lifecycle?.dispose();
    });
    final unfinished = await ref.read(workoutRepositoryProvider).unfinishedSession();
    if (unfinished == null) return null;
    return _hydrate(ActiveWorkoutState(session: unfinished));
  }

  ActiveWorkoutState? get _current => state.value;

  // ---- Starting ------------------------------------------------------------

  Future<void> startEmpty({required String name, bool manual = false}) => _guardStart(() => _start(
        WorkoutSession(
          id: newId(),
          name: name,
          startedAt: manual ? DateTime.now().subtract(const Duration(hours: 1)) : DateTime.now(),
          source: manual ? WorkoutSource.manual : WorkoutSource.live,
        ),
        manual: manual,
      ));

  /// Ignores a start while a workout is running or already starting (double taps).
  Future<void> _guardStart(Future<void> Function() start) async {
    if (_starting || _current != null) return;
    _starting = true;
    try {
      await start();
    } finally {
      _starting = false;
    }
  }

  Future<void> startFromPlanDay(PlanDay day, {bool manual = false}) =>
      _guardStart(() => _startPlanned(day.name, day.exercises, planDayId: day.id, manual: manual));

  Future<void> startFromTemplate(WorkoutTemplate template, {bool manual = false}) =>
      _guardStart(() => _startPlanned(template.name, template.exercises, templateId: template.id, manual: manual));

  Future<void> _startPlanned(
    String name,
    List<PlannedExercise> planned, {
    String? planDayId,
    String? templateId,
    bool manual = false,
  }) async {
    final repo = ref.read(workoutRepositoryProvider);
    final entries = <ExerciseEntry>[];
    for (final p in planned) {
      final last = await repo.lastPerformance(p.exerciseId);
      final working = last.where((s) => s.type != SetType.warmup).toList();
      entries.add(ExerciseEntry(
        id: newId(),
        exerciseId: p.exerciseId,
        supersetGroup: p.supersetGroup,
        restSeconds: p.restSeconds,
        notes: p.notes,
        sets: [
          for (var i = 0; i < p.sets; i++)
            SetEntry(
              id: newId(),
              // Pre-fill from last time when available, else the plan's rep target.
              weightKg: i < working.length ? working[i].weightKg : working.lastOrNull?.weightKg,
              reps: i < working.length ? working[i].reps : p.reps,
            ),
        ],
      ));
    }
    await _start(
      WorkoutSession(
        id: newId(),
        name: name,
        startedAt: manual ? DateTime.now().subtract(const Duration(hours: 1)) : DateTime.now(),
        planDayId: planDayId,
        templateId: templateId,
        source: manual ? WorkoutSource.manual : WorkoutSource.live,
        entries: entries,
      ),
      manual: manual,
    );
  }

  Future<void> _start(WorkoutSession session, {required bool manual}) async {
    state = AsyncData(await _hydrate(ActiveWorkoutState(session: session, manual: manual)));
    await _flush();
  }

  /// Loads exercise details and previous performance for every entry.
  Future<ActiveWorkoutState> _hydrate(ActiveWorkoutState s) async {
    final ids = s.session.entries.map((e) => e.exerciseId).toSet();
    final exercises = await ref.read(exerciseRepositoryProvider).getByIds(ids);
    final repo = ref.read(workoutRepositoryProvider);
    final last = <String, List<SetEntry>>{
      for (final id in ids) id: await repo.lastPerformance(id, excludeSessionId: s.session.id),
    };
    return s.copyWith(exercises: {for (final e in exercises) e.id: e}, lastTime: last);
  }

  // ---- Editing -------------------------------------------------------------

  void _set(ActiveWorkoutState next, {bool persistNow = false}) {
    state = AsyncData(next);
    if (next.manual) return; // manual logs are saved once, on finish
    _debounce?.cancel();
    if (persistNow) {
      _flush();
    } else {
      _debounce = Timer(const Duration(milliseconds: 600), _flush);
    }
  }

  void _editSession(WorkoutSession Function(WorkoutSession s) change, {bool persistNow = false}) {
    final s = _current;
    if (s != null) _set(s.copyWith(session: change(s.session)), persistNow: persistNow);
  }

  void _editEntry(String entryId, ExerciseEntry Function(ExerciseEntry e) change, {bool persistNow = false}) =>
      _editSession(
        (s) => s.copyWith(entries: [for (final e in s.entries) e.id == entryId ? change(e) : e]),
        persistNow: persistNow,
      );

  Future<void> addExercises(List<String> exerciseIds) async {
    final s = _current;
    if (s == null || exerciseIds.isEmpty) return;
    final added = [
      for (final id in exerciseIds)
        ExerciseEntry(
          id: newId(),
          exerciseId: id,
          sets: [SetEntry(id: newId())],
        ),
    ];
    final next = await _hydrate(s.copyWith(session: s.session.copyWith(entries: [...s.session.entries, ...added])));
    // Pre-fill from last time's working sets; keep the one empty set if there were none.
    List<SetEntry> working(String exerciseId) =>
        (next.lastTime[exerciseId] ?? const <SetEntry>[]).where((x) => x.type != SetType.warmup).toList();
    _set(next.copyWith(
      session: next.session.copyWith(entries: [
        for (final e in next.session.entries)
          if (added.any((a) => a.id == e.id) && working(e.exerciseId).isNotEmpty)
            e.copyWith(sets: [
              for (final last in working(e.exerciseId)) SetEntry(id: newId(), weightKg: last.weightKg, reps: last.reps),
            ])
          else
            e,
      ]),
    ), persistNow: true);
  }

  void removeEntry(String entryId) =>
      _editSession((s) => s.copyWith(entries: s.entries.where((e) => e.id != entryId).toList()), persistNow: true);

  /// [newIndex] is the final position (already adjusted for the removal).
  void moveEntry(int oldIndex, int newIndex) => _editSession((s) {
        final list = [...s.entries];
        final item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
        return s.copyWith(entries: list);
      }, persistNow: true);

  /// Links an entry with the next one into a superset, or unlinks it.
  void toggleSupersetWithNext(String entryId) => _editSession((s) {
        final entries = [...s.entries];
        final i = entries.indexWhere((e) => e.id == entryId);
        if (i < 0 || i >= entries.length - 1) return s;
        final current = entries[i];
        final next = entries[i + 1];
        if (current.supersetGroup != null && current.supersetGroup == next.supersetGroup) {
          entries[i] = current.copyWith(supersetGroup: null);
        } else {
          final group = current.supersetGroup ??
              next.supersetGroup ??
              (entries.map((e) => e.supersetGroup ?? 0).fold(0, (a, b) => a > b ? a : b) + 1);
          entries[i] = current.copyWith(supersetGroup: group);
          entries[i + 1] = next.copyWith(supersetGroup: group);
        }
        return s.copyWith(entries: entries);
      }, persistNow: true);

  void addSet(String entryId) => _editEntry(entryId, (e) {
        final last = e.sets.lastOrNull;
        return e.copyWith(sets: [
          ...e.sets,
          SetEntry(id: newId(), type: last?.type == SetType.warmup ? SetType.working : (last?.type ?? SetType.working),
              weightKg: last?.weightKg, reps: last?.reps),
        ]);
      }, persistNow: true);

  void removeSet(String entryId, String setId) =>
      _editEntry(entryId, (e) => e.copyWith(sets: e.sets.where((s) => s.id != setId).toList()), persistNow: true);

  void updateSet(String entryId, String setId, SetEntry Function(SetEntry s) change) =>
      _editEntry(entryId, (e) => e.copyWith(sets: [for (final s in e.sets) s.id == setId ? change(s) : s]));

  /// Toggles completion. Completing starts the rest timer (live workouts),
  /// except between exercises of the same superset.
  void toggleSetComplete(String entryId, String setId) {
    final s = _current;
    if (s == null) return;
    final entries = s.session.entries;
    final entry = entries.firstWhere((e) => e.id == entryId);
    final set = entry.sets.firstWhere((x) => x.id == setId);
    final completing = !set.isCompleted;
    _editEntry(
      entryId,
      (e) => e.copyWith(sets: [
        for (final x in e.sets)
          if (x.id == setId) x.copyWith(completedAt: completing ? DateTime.now() : null) else x,
      ]),
      persistNow: true,
    );
    if (!completing) return;
    Haptics.success();
    if (s.manual) return;
    final i = entries.indexOf(entry);
    final nextInSameSuperset = entry.supersetGroup != null &&
        i < entries.length - 1 &&
        entries[i + 1].supersetGroup == entry.supersetGroup;
    if (!nextInSameSuperset) startRest(Duration(seconds: entry.restSeconds));
  }

  /// Completes the first uncompleted set (keyboard: Space). Returns false if
  /// every set is already done.
  bool completeNextSet() {
    final s = _current;
    if (s == null) return false;
    for (final e in s.session.entries) {
      for (final set in e.sets) {
        if (!set.isCompleted) {
          toggleSetComplete(e.id, set.id);
          return true;
        }
      }
    }
    return false;
  }

  void setEntryRest(String entryId, int seconds) => _editEntry(entryId, (e) => e.copyWith(restSeconds: seconds));

  void setEntryNotes(String entryId, String notes) =>
      _editEntry(entryId, (e) => e.copyWith(notes: notes.trim().isEmpty ? null : notes));

  void setSessionNotes(String notes) =>
      _editSession((s) => s.copyWith(notes: notes.trim().isEmpty ? null : notes));

  void rename(String name) {
    if (name.trim().isNotEmpty) _editSession((s) => s.copyWith(name: name.trim()));
  }

  void setManualTimes({DateTime? start, Duration? duration}) {
    final s = _current;
    if (s == null) return;
    _set(s.copyWith(
      session: start == null ? s.session : s.session.copyWith(startedAt: start),
      manualDuration: duration ?? s.manualDuration,
    ));
  }

  // ---- Rest timer ------------------------------------------------------------

  void startRest(Duration duration) {
    final s = _current;
    if (s != null) state = AsyncData(s.copyWith(restEndsAt: DateTime.now().add(duration), restTotal: duration));
  }

  void addRest(Duration extra) {
    final s = _current;
    if (s?.restEndsAt == null) return;
    final base = s!.restEndsAt!.isAfter(DateTime.now()) ? s.restEndsAt! : DateTime.now();
    final ends = base.add(extra);
    state = AsyncData(s.copyWith(restEndsAt: ends, restTotal: ends.difference(DateTime.now())));
  }

  void skipRest() {
    final s = _current;
    if (s != null) state = AsyncData(s.copyWith(restEndsAt: null, restTotal: Duration.zero));
  }

  Future<void> setKeepAwake(bool on) async {
    final s = _current;
    if (s == null) return;
    state = AsyncData(s.copyWith(keepAwake: on));
    await WakelockPlus.toggle(enable: on);
  }

  // ---- Finishing -------------------------------------------------------------

  /// Saves the session (dropping sets that were never completed), records
  /// new PRs and clears the active workout.
  Future<FinishResult?> finish() async {
    final s = _current;
    if (s == null) return null;
    _debounce?.cancel();
    final end = s.manual ? s.session.startedAt.add(s.manualDuration) : DateTime.now();
    final profile = await ref.read(profileRepositoryProvider).get();
    final session = s.session.copyWith(
      endedAt: end,
      caloriesKcal: _strengthMet * (profile.weightKg ?? 70) * end.difference(s.session.startedAt).inSeconds / 3600,
      entries: [
        for (final e in s.session.entries)
          e.copyWith(sets: [
            for (final set in e.sets)
              // Manual logs: every filled-in set counts as done.
              if (s.manual && (set.reps ?? 0) > 0)
                set.copyWith(completedAt: set.completedAt ?? end)
              else if (set.isCompleted)
                set,
          ]),
      ].where((e) => e.sets.isNotEmpty).toList(),
    );

    final progress = ref.read(progressRepositoryProvider);
    final bests = <(String, RecordType), double?>{};
    for (final id in session.entries.map((e) => e.exerciseId).toSet()) {
      for (final type in RecordType.values) {
        bests[(id, type)] = (await progress.best(id, type))?.value;
      }
    }
    final records = detectRecords(session, previousBest: (id, type) => bests[(id, type)], newId: newId);

    await ref.read(workoutRepositoryProvider).saveSession(session);
    unawaited(_saveToHealth(session));
    for (final r in records) {
      await progress.addRecord(r);
    }
    final saved = await ref.read(workoutRepositoryProvider).getSession(session.id);
    final achievements = await ref
        .read(achievementEngineProvider)
        .award(xp: XpRewards.workout(volumeKg: saved?.totalVolumeKg ?? 0, records: records.length));
    await _clear();
    return (sessionId: session.id, records: records, achievements: achievements);
  }

  /// Mirrors the workout into Apple Health / Health Connect (phones only).
  Future<void> _saveToHealth(WorkoutSession session) async {
    final ok = await ref.read(healthSyncProvider).saveWorkout(
          cardioType: null,
          start: session.startedAt,
          end: session.endedAt!,
          kcal: session.caloriesKcal,
        );
    if (ok) await ref.read(workoutRepositoryProvider).saveSession(session.copyWith(healthSynced: true));
  }

  Future<void> discard() async {
    final s = _current;
    _debounce?.cancel();
    if (s != null && !s.manual) await ref.read(workoutRepositoryProvider).deleteSession(s.session.id);
    await _clear();
  }

  Future<void> _clear() async {
    if (_current?.keepAwake ?? false) await WakelockPlus.disable();
    state = const AsyncData(null);
  }

  Future<void> _flush() async {
    _debounce?.cancel();
    final s = _current;
    if (s == null || s.manual) return;
    await ref.read(workoutRepositoryProvider).saveSession(s.session);
  }
}
