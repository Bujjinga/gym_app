// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dao.dart';

// ignore_for_file: type=lint
mixin _$ProfileDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersProfileTable get usersProfile => attachedDatabase.usersProfile;
  ProfileDaoManager get managers => ProfileDaoManager(this);
}

class ProfileDaoManager {
  final _$ProfileDaoMixin _db;
  ProfileDaoManager(this._db);
  $$UsersProfileTableTableManager get usersProfile =>
      $$UsersProfileTableTableManager(_db.attachedDatabase, _db.usersProfile);
}
