import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../app_database.dart';
import '../sync_columns.dart';
import '../tables/progress_tables.dart';

part 'progress_dao.g.dart';

@DriftAccessor(tables: [PersonalRecords, Achievements])
class ProgressDao extends DatabaseAccessor<AppDatabase> with _$ProgressDaoMixin {
  ProgressDao(super.attachedDatabase);

  static const _pending = Value(SyncStatus.pending);

  Stream<List<PersonalRecordRow>> watchRecords({String? exerciseId}) {
    final q = select(personalRecords)..where((t) => t.deleted.equals(false));
    if (exerciseId != null) q.where((t) => t.exerciseId.equals(exerciseId));
    q.orderBy([(t) => OrderingTerm.desc(t.achievedAt)]);
    return q.watch();
  }

  /// Current best for an exercise and record type, if any.
  Future<PersonalRecordRow?> best(String exerciseId, RecordType type) => (select(personalRecords)
        ..where((t) => t.exerciseId.equals(exerciseId) & t.type.equalsValue(type) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.desc(t.value)])
        ..limit(1))
      .getSingleOrNull();

  Future<void> addRecord(PersonalRecordsCompanion row) =>
      into(personalRecords).insertOnConflictUpdate(row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending));

  Stream<List<AchievementRow>> watchAchievements() =>
      (select(achievements)..where((t) => t.deleted.equals(false))).watch();

  /// Insert or update by [AchievementsCompanion.achievementKey].
  Future<void> upsertAchievement(AchievementsCompanion row) {
    final stamped = row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending);
    return into(achievements).insert(
      stamped,
      onConflict: DoUpdate((_) => stamped.copyWith(id: const Value.absent()), target: [achievements.achievementKey]),
    );
  }
}
