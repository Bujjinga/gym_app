// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_dao.dart';

// ignore_for_file: type=lint
mixin _$ActivityDaoMixin on DatabaseAccessor<AppDatabase> {
  $CardioSessionsTable get cardioSessions => attachedDatabase.cardioSessions;
  $RoutePointsTable get routePoints => attachedDatabase.routePoints;
  $DailyActivityTable get dailyActivity => attachedDatabase.dailyActivity;
  ActivityDaoManager get managers => ActivityDaoManager(this);
}

class ActivityDaoManager {
  final _$ActivityDaoMixin _db;
  ActivityDaoManager(this._db);
  $$CardioSessionsTableTableManager get cardioSessions =>
      $$CardioSessionsTableTableManager(
        _db.attachedDatabase,
        _db.cardioSessions,
      );
  $$RoutePointsTableTableManager get routePoints =>
      $$RoutePointsTableTableManager(_db.attachedDatabase, _db.routePoints);
  $$DailyActivityTableTableManager get dailyActivity =>
      $$DailyActivityTableTableManager(_db.attachedDatabase, _db.dailyActivity);
}
