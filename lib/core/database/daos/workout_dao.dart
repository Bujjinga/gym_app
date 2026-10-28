import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../app_database.dart';
import '../sync_columns.dart';
import '../tables/workout_tables.dart';

part 'workout_dao.g.dart';

@DriftAccessor(tables: [WorkoutTemplates, WorkoutSessions, ExerciseEntries, SetEntries])
class WorkoutDao extends DatabaseAccessor<AppDatabase> with _$WorkoutDaoMixin {
  WorkoutDao(super.attachedDatabase);

  static const _pending = Value(SyncStatus.pending);

  // ---- Templates -----------------------------------------------------------

  Stream<List<WorkoutTemplateRow>> watchTemplates() => (select(workoutTemplates)
        ..where((t) => t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.name)]))
      .watch();

  Future<void> upsertTemplate(WorkoutTemplatesCompanion row) =>
      into(workoutTemplates).insertOnConflictUpdate(row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending));

  Future<void> deleteTemplate(String id) => attachedDatabase.softDelete(workoutTemplates, id);

  // ---- Sessions ------------------------------------------------------------

  Stream<List<WorkoutSessionRow>> watchSessions({DateTime? from, DateTime? to}) {
    final q = select(workoutSessions)..where((t) => t.deleted.equals(false));
    if (from != null) q.where((t) => t.startedAt.isBiggerOrEqualValue(from.toUtc()));
    if (to != null) q.where((t) => t.startedAt.isSmallerThanValue(to.toUtc()));
    q.orderBy([(t) => OrderingTerm.desc(t.startedAt)]);
    return q.watch();
  }

  Future<WorkoutSessionRow?> getSession(String id) =>
      (select(workoutSessions)..where((t) => t.id.equals(id) & t.deleted.equals(false))).getSingleOrNull();

  Future<List<ExerciseEntryRow>> entriesFor(String sessionId) => (select(exerciseEntries)
        ..where((t) => t.sessionId.equals(sessionId) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.position)]))
      .get();

  Future<List<SetEntryRow>> setsFor(Iterable<String> entryIds) => (select(setEntries)
        ..where((t) => t.exerciseEntryId.isIn(entryIds) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.position)]))
      .get();

  /// Saves a whole session atomically. Entries/sets that existed before but
  /// are missing from the new lists are soft-deleted.
  Future<void> saveSessionGraph(
    WorkoutSessionsCompanion session,
    List<ExerciseEntriesCompanion> entries,
    List<SetEntriesCompanion> sets,
  ) {
    final now = Value(utcNow());
    return transaction(() async {
      final sessionId = session.id.value;
      await into(workoutSessions).insertOnConflictUpdate(session.copyWith(updatedAt: now, syncStatus: _pending));

      final oldEntries = await entriesFor(sessionId);
      final keepEntries = entries.map((e) => e.id.value).toSet();
      for (final e in oldEntries.where((e) => !keepEntries.contains(e.id))) {
        await attachedDatabase.softDelete(exerciseEntries, e.id);
      }
      final oldSets = await setsFor(oldEntries.map((e) => e.id));
      final keepSets = sets.map((s) => s.id.value).toSet();
      for (final s in oldSets.where((s) => !keepSets.contains(s.id))) {
        await attachedDatabase.softDelete(setEntries, s.id);
      }

      for (final e in entries) {
        await into(exerciseEntries).insertOnConflictUpdate(e.copyWith(updatedAt: now, syncStatus: _pending));
      }
      for (final s in sets) {
        await into(setEntries).insertOnConflictUpdate(s.copyWith(updatedAt: now, syncStatus: _pending));
      }
    });
  }

  Future<void> deleteSession(String id) => transaction(() async {
        final entries = await entriesFor(id);
        for (final s in await setsFor(entries.map((e) => e.id))) {
          await attachedDatabase.softDelete(setEntries, s.id);
        }
        for (final e in entries) {
          await attachedDatabase.softDelete(exerciseEntries, e.id);
        }
        await attachedDatabase.softDelete(workoutSessions, id);
      });

  /// A live session that was never finished (app killed mid-workout).
  Future<WorkoutSessionRow?> unfinishedLiveSession() => (select(workoutSessions)
        ..where((t) => t.endedAt.isNull() & t.source.equalsValue(WorkoutSource.live) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.desc(t.startedAt)])
        ..limit(1))
      .getSingleOrNull();

  /// Finished sessions containing [exerciseId] with their sets, oldest first.
  Future<List<(DateTime, List<SetEntryRow>)>> historyForExercise(String exerciseId) async {
    final query = select(exerciseEntries).join([
      innerJoin(workoutSessions, workoutSessions.id.equalsExp(exerciseEntries.sessionId)),
    ])
      ..where(exerciseEntries.exerciseId.equals(exerciseId) &
          exerciseEntries.deleted.equals(false) &
          workoutSessions.deleted.equals(false) &
          workoutSessions.endedAt.isNotNull())
      ..orderBy([OrderingTerm.asc(workoutSessions.startedAt)]);
    final rows = await query.get();
    final startedByEntry = {for (final r in rows) r.readTable(exerciseEntries).id: r.readTable(workoutSessions).startedAt};
    final sets = await setsFor(startedByEntry.keys);
    return [
      for (final MapEntry(key: entryId, value: started) in startedByEntry.entries)
        (started, sets.where((s) => s.exerciseEntryId == entryId).toList()),
    ];
  }

  /// Number of finished sessions started from any of [planDayIds].
  Stream<int> watchFinishedCountForPlanDays(List<String> planDayIds) {
    final count = workoutSessions.id.count();
    return (selectOnly(workoutSessions)
          ..addColumns([count])
          ..where(workoutSessions.planDayId.isIn(planDayIds) &
              workoutSessions.endedAt.isNotNull() &
              workoutSessions.deleted.equals(false)))
        .map((r) => r.read(count) ?? 0)
        .watchSingle();
  }

  /// Sets from the most recent session (other than [excludeSessionId]) that
  /// included [exerciseId] — powers "last time: 60 kg × 8".
  Future<List<SetEntryRow>> lastSetsForExercise(String exerciseId, {String? excludeSessionId}) async {
    final query = select(exerciseEntries).join([
      innerJoin(workoutSessions, workoutSessions.id.equalsExp(exerciseEntries.sessionId)),
    ])
      ..where(exerciseEntries.exerciseId.equals(exerciseId) &
          exerciseEntries.deleted.equals(false) &
          workoutSessions.deleted.equals(false) &
          (excludeSessionId == null
              ? const Constant(true)
              : workoutSessions.id.equals(excludeSessionId).not()))
      ..orderBy([OrderingTerm.desc(workoutSessions.startedAt)])
      ..limit(1);
    final row = await query.getSingleOrNull();
    if (row == null) return [];
    return setsFor([row.readTable(exerciseEntries).id]);
  }
}
