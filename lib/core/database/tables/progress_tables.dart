import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../sync_columns.dart';

/// Achievement state. Definitions (names, rules) live in code; this stores
/// progress and the unlock time per [achievementKey].
@DataClassName('AchievementRow')
class Achievements extends Table with SyncColumns {
  TextColumn get achievementKey => text().unique()();
  RealColumn get progress => real().withDefault(const Constant(0))();
  DateTimeColumn get unlockedAt => dateTime().nullable()();
}

/// Personal best for an exercise and record type.
@DataClassName('PersonalRecordRow')
@TableIndex(name: 'personal_records_exercise', columns: {#exerciseId, #type})
class PersonalRecords extends Table with SyncColumns {
  TextColumn get exerciseId => text()();
  TextColumn get type => textEnum<RecordType>()();
  RealColumn get value => real()();
  IntColumn get reps => integer().nullable()();
  DateTimeColumn get achievedAt => dateTime()();
  TextColumn get sessionId => text().nullable()();
}
