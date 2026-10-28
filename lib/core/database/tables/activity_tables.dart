import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../sync_columns.dart';

/// Walk / run / hike / cycle session (GPS, indoor or manual).
@DataClassName('CardioSessionRow')
class CardioSessions extends Table with SyncColumns {
  TextColumn get type => textEnum<CardioType>()();
  TextColumn get source => textEnum<CardioSource>()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();

  /// Moving time (excludes pauses).
  IntColumn get durationSec => integer().withDefault(const Constant(0))();
  RealColumn get distanceM => real().withDefault(const Constant(0))();
  RealColumn get caloriesKcal => real().nullable()();
  RealColumn get elevationGainM => real().nullable()();
  IntColumn get avgHeartRate => integer().nullable()();
  IntColumn get maxHeartRate => integer().nullable()();
  IntColumn get steps => integer().nullable()();
  TextColumn get notes => text().nullable()();
}

/// GPS fix belonging to a cardio session.
@DataClassName('RoutePointRow')
@TableIndex(name: 'route_points_session', columns: {#cardioSessionId, #recordedAt})
class RoutePoints extends Table with SyncColumns {
  TextColumn get cardioSessionId => text()();
  DateTimeColumn get recordedAt => dateTime()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get altitudeM => real().nullable()();
  RealColumn get speedMps => real().nullable()();
  RealColumn get accuracyM => real().nullable()();
  IntColumn get heartRate => integer().nullable()();
}

/// One row per day of passive activity and health metrics. Recorded on the
/// phone; desktop reads it after sync.
@DataClassName('DailyActivityRow')
class DailyActivity extends Table with SyncColumns {
  /// Local calendar day as `yyyy-MM-dd`.
  TextColumn get day => text().unique()();
  IntColumn get steps => integer().withDefault(const Constant(0))();
  RealColumn get distanceM => real().withDefault(const Constant(0))();
  IntColumn get floors => integer().withDefault(const Constant(0))();
  RealColumn get activeKcal => real().withDefault(const Constant(0))();
  IntColumn get exerciseMin => integer().withDefault(const Constant(0))();
  IntColumn get restingHeartRate => integer().nullable()();
  IntColumn get avgHeartRate => integer().nullable()();
  RealColumn get hrvMs => real().nullable()();
  RealColumn get vo2Max => real().nullable()();
  IntColumn get sleepMinutes => integer().nullable()();
  TextColumn get source => textEnum<ActivitySource>().withDefault(Constant(ActivitySource.device.name))();
}
