// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_dao.dart';

// ignore_for_file: type=lint
mixin _$NutritionDaoMixin on DatabaseAccessor<AppDatabase> {
  $WaterLogsTable get waterLogs => attachedDatabase.waterLogs;
  $NutritionLogsTable get nutritionLogs => attachedDatabase.nutritionLogs;
  NutritionDaoManager get managers => NutritionDaoManager(this);
}

class NutritionDaoManager {
  final _$NutritionDaoMixin _db;
  NutritionDaoManager(this._db);
  $$WaterLogsTableTableManager get waterLogs =>
      $$WaterLogsTableTableManager(_db.attachedDatabase, _db.waterLogs);
  $$NutritionLogsTableTableManager get nutritionLogs =>
      $$NutritionLogsTableTableManager(_db.attachedDatabase, _db.nutritionLogs);
}
