// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_dao.dart';

// ignore_for_file: type=lint
mixin _$ExerciseDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExercisesTable get exercises => attachedDatabase.exercises;
  ExerciseDaoManager get managers => ExerciseDaoManager(this);
}

class ExerciseDaoManager {
  final _$ExerciseDaoMixin _db;
  ExerciseDaoManager(this._db);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db.attachedDatabase, _db.exercises);
}
