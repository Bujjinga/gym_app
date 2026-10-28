// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_dao.dart';

// ignore_for_file: type=lint
mixin _$ProgressDaoMixin on DatabaseAccessor<AppDatabase> {
  $PersonalRecordsTable get personalRecords => attachedDatabase.personalRecords;
  $AchievementsTable get achievements => attachedDatabase.achievements;
  ProgressDaoManager get managers => ProgressDaoManager(this);
}

class ProgressDaoManager {
  final _$ProgressDaoMixin _db;
  ProgressDaoManager(this._db);
  $$PersonalRecordsTableTableManager get personalRecords =>
      $$PersonalRecordsTableTableManager(
        _db.attachedDatabase,
        _db.personalRecords,
      );
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db.attachedDatabase, _db.achievements);
}
