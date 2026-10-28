import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/strength_calculations.dart';
import '../domain/exercise_entry.dart';
import '../domain/planned_exercise.dart';
import '../domain/set_entry.dart';
import '../domain/workout_repository.dart';
import '../domain/workout_session.dart';
import '../domain/workout_template.dart';

part 'drift_workout_repository.g.dart';

@Riverpod(keepAlive: true)
WorkoutRepository workoutRepository(Ref ref) => DriftWorkoutRepository(ref.watch(appDatabaseProvider));

class DriftWorkoutRepository implements WorkoutRepository {
  DriftWorkoutRepository(this._db);

  final AppDatabase _db;

  // ---- Templates -----------------------------------------------------------

  @override
  Stream<List<WorkoutTemplate>> watchTemplates() => _db.workoutDao.watchTemplates().map((rows) => [
        for (final r in rows)
          WorkoutTemplate(id: r.id, name: r.name, notes: r.notes, exercises: decodePlanned(r.exercises)),
      ]);

  @override
  Future<void> saveTemplate(WorkoutTemplate t) => _db.workoutDao.upsertTemplate(
        WorkoutTemplatesCompanion.insert(
          id: Value(t.id),
          name: t.name,
          notes: Value(t.notes),
          exercises: Value(encodePlanned(t.exercises)),
        ),
      );

  @override
  Future<void> deleteTemplate(String id) => _db.workoutDao.deleteTemplate(id);

  // ---- Sessions ------------------------------------------------------------

  @override
  Stream<List<WorkoutSession>> watchSessions({DateTime? from, DateTime? to}) =>
      _db.workoutDao.watchSessions(from: from, to: to).map((rows) => rows.map(_header).toList());

  @override
  Future<WorkoutSession?> getSession(String id) async {
    final row = await _db.workoutDao.getSession(id);
    if (row == null) return null;
    final entries = await _db.workoutDao.entriesFor(id);
    final sets = await _db.workoutDao.setsFor(entries.map((e) => e.id));
    return _header(row).copyWith(
      entries: [
        for (final e in entries)
          ExerciseEntry(
            id: e.id,
            exerciseId: e.exerciseId,
            supersetGroup: e.supersetGroup,
            restSeconds: e.restSeconds,
            notes: e.notes,
            sets: [for (final s in sets.where((s) => s.exerciseEntryId == e.id)) _set(s)],
          ),
      ],
    );
  }

  @override
  Future<void> saveSession(WorkoutSession s) {
    final volume = Strength.totalVolume([
      for (final e in s.entries)
        for (final set in e.sets)
          (weightKg: set.weightKg, reps: set.reps, type: set.type, completed: set.isCompleted),
    ]);
    return _db.workoutDao.saveSessionGraph(
      WorkoutSessionsCompanion.insert(
        id: Value(s.id),
        name: s.name,
        templateId: Value(s.templateId),
        planDayId: Value(s.planDayId),
        startedAt: s.startedAt.toUtc(),
        endedAt: Value(s.endedAt?.toUtc()),
        notes: Value(s.notes),
        totalVolumeKg: Value(volume),
        caloriesKcal: Value(s.caloriesKcal),
        source: Value(s.source),
        healthSynced: Value(s.healthSynced),
      ),
      [
        for (final (i, e) in s.entries.indexed)
          ExerciseEntriesCompanion.insert(
            id: Value(e.id),
            sessionId: s.id,
            exerciseId: e.exerciseId,
            position: i,
            supersetGroup: Value(e.supersetGroup),
            restSeconds: Value(e.restSeconds),
            notes: Value(e.notes),
          ),
      ],
      [
        for (final e in s.entries)
          for (final (i, set) in e.sets.indexed)
            SetEntriesCompanion.insert(
              id: Value(set.id),
              exerciseEntryId: e.id,
              position: i,
              setType: Value(set.type),
              weightKg: Value(set.weightKg),
              reps: Value(set.reps),
              rpe: Value(set.rpe),
              durationSec: Value(set.durationSec),
              distanceM: Value(set.distanceM),
              completedAt: Value(set.completedAt?.toUtc()),
            ),
      ],
    );
  }

  @override
  Future<void> deleteSession(String id) => _db.workoutDao.deleteSession(id);

  @override
  Future<WorkoutSession?> unfinishedSession() async {
    final row = await _db.workoutDao.unfinishedLiveSession();
    return row == null ? null : getSession(row.id);
  }

  @override
  Future<List<ExerciseHistoryPoint>> history(String exerciseId) async => [
        for (final (date, sets) in await _db.workoutDao.historyForExercise(exerciseId))
          if (sets.where(_counts).isNotEmpty)
            () {
              final working = sets.where(_counts).toList();
              final top = working.reduce((a, b) => (b.weightKg ?? 0) > (a.weightKg ?? 0) ? b : a);
              return (
                date: date,
                bestOneRepMax: working
                    .map((s) => Strength.estimatedOneRepMax(s.weightKg ?? 0, s.reps ?? 0))
                    .reduce((a, b) => a > b ? a : b),
                topWeightKg: top.weightKg ?? 0,
                topReps: top.reps ?? 0,
              );
            }(),
      ];

  static bool _counts(SetEntryRow s) => s.completedAt != null && s.setType != SetType.warmup && (s.reps ?? 0) > 0;

  @override
  Stream<int> watchCompletedForPlanDays(List<String> planDayIds) =>
      _db.workoutDao.watchFinishedCountForPlanDays(planDayIds);

  @override
  Future<List<SetEntry>> lastPerformance(String exerciseId, {String? excludeSessionId}) async =>
      (await _db.workoutDao.lastSetsForExercise(exerciseId, excludeSessionId: excludeSessionId))
          .map(_set)
          .toList();

  // ---- Mapping -------------------------------------------------------------

  static WorkoutSession _header(WorkoutSessionRow r) => WorkoutSession(
        id: r.id,
        name: r.name,
        startedAt: r.startedAt,
        endedAt: r.endedAt,
        templateId: r.templateId,
        planDayId: r.planDayId,
        notes: r.notes,
        totalVolumeKg: r.totalVolumeKg,
        caloriesKcal: r.caloriesKcal,
        source: r.source,
        healthSynced: r.healthSynced,
      );

  static SetEntry _set(SetEntryRow r) => SetEntry(
        id: r.id,
        type: r.setType,
        weightKg: r.weightKg,
        reps: r.reps,
        rpe: r.rpe,
        durationSec: r.durationSec,
        distanceM: r.distanceM,
        completedAt: r.completedAt,
      );

  /// Shared with plans: planned-exercise lists are stored as JSON text.
  static List<PlannedExercise> decodePlanned(String json) => [
        for (final m in jsonDecode(json) as List) PlannedExercise.fromJson(m as Map<String, dynamic>),
      ];

  static String encodePlanned(List<PlannedExercise> list) => jsonEncode([for (final p in list) p.toJson()]);
}
