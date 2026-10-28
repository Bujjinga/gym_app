import 'package:drift/drift.dart';

import '../app_database.dart';
import '../sync_columns.dart';
import '../tables/nutrition_tables.dart';

part 'nutrition_dao.g.dart';

@DriftAccessor(tables: [WaterLogs, NutritionLogs])
class NutritionDao extends DatabaseAccessor<AppDatabase> with _$NutritionDaoMixin {
  NutritionDao(super.attachedDatabase);

  static const _pending = Value(SyncStatus.pending);

  Stream<List<WaterLogRow>> watchWater(DateTime from, DateTime to) => (select(waterLogs)
        ..where((t) =>
            t.loggedAt.isBiggerOrEqualValue(from.toUtc()) &
            t.loggedAt.isSmallerThanValue(to.toUtc()) &
            t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.loggedAt)]))
      .watch();

  Future<void> addWater(WaterLogsCompanion row) =>
      into(waterLogs).insertOnConflictUpdate(row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending));

  Future<void> deleteWater(String id) => attachedDatabase.softDelete(waterLogs, id);

  Stream<List<NutritionLogRow>> watchMeals(DateTime from, DateTime to) => (select(nutritionLogs)
        ..where((t) =>
            t.loggedAt.isBiggerOrEqualValue(from.toUtc()) &
            t.loggedAt.isSmallerThanValue(to.toUtc()) &
            t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.loggedAt)]))
      .watch();

  Future<void> upsertMeal(NutritionLogsCompanion row) =>
      into(nutritionLogs).insertOnConflictUpdate(row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending));

  Future<void> deleteMeal(String id) => attachedDatabase.softDelete(nutritionLogs, id);
}
