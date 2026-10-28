import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/domain/pulse_enums.dart';
import '../domain/achievement_progress.dart';
import '../domain/personal_record.dart';
import '../domain/progress_repository.dart';

part 'drift_progress_repository.g.dart';

@Riverpod(keepAlive: true)
ProgressRepository progressRepository(Ref ref) => DriftProgressRepository(ref.watch(appDatabaseProvider));

class DriftProgressRepository implements ProgressRepository {
  DriftProgressRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<PersonalRecord>> watchRecords({String? exerciseId}) =>
      _db.progressDao.watchRecords(exerciseId: exerciseId).map((rows) => rows.map(_record).toList());

  @override
  Future<PersonalRecord?> best(String exerciseId, RecordType type) async {
    final row = await _db.progressDao.best(exerciseId, type);
    return row == null ? null : _record(row);
  }

  @override
  Future<void> addRecord(PersonalRecord r) => _db.progressDao.addRecord(
        PersonalRecordsCompanion.insert(
          id: Value(r.id),
          exerciseId: r.exerciseId,
          type: r.type,
          value: r.value,
          reps: Value(r.reps),
          achievedAt: r.achievedAt.toUtc(),
          sessionId: Value(r.sessionId),
        ),
      );

  @override
  Stream<List<AchievementProgress>> watchAchievements() => _db.progressDao.watchAchievements().map((rows) => [
        for (final r in rows) AchievementProgress(key: r.achievementKey, progress: r.progress, unlockedAt: r.unlockedAt),
      ]);

  @override
  Future<void> saveAchievement(AchievementProgress a) => _db.progressDao.upsertAchievement(
        AchievementsCompanion.insert(
          achievementKey: a.key,
          progress: Value(a.progress),
          unlockedAt: Value(a.unlockedAt?.toUtc()),
        ),
      );

  static PersonalRecord _record(PersonalRecordRow r) => PersonalRecord(
        id: r.id,
        exerciseId: r.exerciseId,
        type: r.type,
        value: r.value,
        reps: r.reps,
        achievedAt: r.achievedAt,
        sessionId: r.sessionId,
      );
}
