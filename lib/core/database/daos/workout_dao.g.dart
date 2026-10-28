// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_dao.dart';

// ignore_for_file: type=lint
mixin _$WorkoutDaoMixin on DatabaseAccessor<AppDatabase> {
  $WorkoutTemplatesTable get workoutTemplates =>
      attachedDatabase.workoutTemplates;
  $WorkoutSessionsTable get workoutSessions => attachedDatabase.workoutSessions;
  $ExerciseEntriesTable get exerciseEntries => attachedDatabase.exerciseEntries;
  $SetEntriesTable get setEntries => attachedDatabase.setEntries;
  WorkoutDaoManager get managers => WorkoutDaoManager(this);
}

class WorkoutDaoManager {
  final _$WorkoutDaoMixin _db;
  WorkoutDaoManager(this._db);
  $$WorkoutTemplatesTableTableManager get workoutTemplates =>
      $$WorkoutTemplatesTableTableManager(
        _db.attachedDatabase,
        _db.workoutTemplates,
      );
  $$WorkoutSessionsTableTableManager get workoutSessions =>
      $$WorkoutSessionsTableTableManager(
        _db.attachedDatabase,
        _db.workoutSessions,
      );
  $$ExerciseEntriesTableTableManager get exerciseEntries =>
      $$ExerciseEntriesTableTableManager(
        _db.attachedDatabase,
        _db.exerciseEntries,
      );
  $$SetEntriesTableTableManager get setEntries =>
      $$SetEntriesTableTableManager(_db.attachedDatabase, _db.setEntries);
}
