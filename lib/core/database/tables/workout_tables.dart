import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../sync_columns.dart';

/// Reusable workout blueprint. Exercises are stored as a JSON list of
/// planned exercises so a template syncs as one row.
@DataClassName('WorkoutTemplateRow')
class WorkoutTemplates extends Table with SyncColumns {
  TextColumn get name => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get exercises => text().withDefault(const Constant('[]'))();
}

/// One performed workout (live on the phone, or logged after on desktop).
@DataClassName('WorkoutSessionRow')
class WorkoutSessions extends Table with SyncColumns {
  TextColumn get name => text()();
  TextColumn get templateId => text().nullable()();
  TextColumn get planDayId => text().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  RealColumn get totalVolumeKg => real().withDefault(const Constant(0))();
  RealColumn get caloriesKcal => real().nullable()();
  TextColumn get source => textEnum<WorkoutSource>().withDefault(Constant(WorkoutSource.live.name))();
  BoolColumn get healthSynced => boolean().withDefault(const Constant(false))();
}

/// An exercise within a session. Entries sharing [supersetGroup] form a
/// superset/circuit.
@DataClassName('ExerciseEntryRow')
class ExerciseEntries extends Table with SyncColumns {
  TextColumn get sessionId => text()();
  TextColumn get exerciseId => text()();
  IntColumn get position => integer()();
  IntColumn get supersetGroup => integer().nullable()();
  IntColumn get restSeconds => integer().withDefault(const Constant(90))();
  TextColumn get notes => text().nullable()();
}

/// A single set. Weight is always stored in kg.
@DataClassName('SetEntryRow')
class SetEntries extends Table with SyncColumns {
  TextColumn get exerciseEntryId => text()();
  IntColumn get position => integer()();
  TextColumn get setType => textEnum<SetType>().withDefault(Constant(SetType.working.name))();
  RealColumn get weightKg => real().nullable()();
  IntColumn get reps => integer().nullable()();
  RealColumn get rpe => real().nullable()();
  IntColumn get durationSec => integer().nullable()();
  RealColumn get distanceM => real().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
}
