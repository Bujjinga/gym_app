// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_dao.dart';

// ignore_for_file: type=lint
mixin _$PlanDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlansTable get plans => attachedDatabase.plans;
  $PlanDaysTable get planDays => attachedDatabase.planDays;
  PlanDaoManager get managers => PlanDaoManager(this);
}

class PlanDaoManager {
  final _$PlanDaoMixin _db;
  PlanDaoManager(this._db);
  $$PlansTableTableManager get plans =>
      $$PlansTableTableManager(_db.attachedDatabase, _db.plans);
  $$PlanDaysTableTableManager get planDays =>
      $$PlanDaysTableTableManager(_db.attachedDatabase, _db.planDays);
}
