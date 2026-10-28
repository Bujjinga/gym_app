import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
// Used by the generated part: drift inlines SyncColumns' `Uuid().v4()` default.
import 'package:uuid/uuid.dart';

import '../domain/pulse_enums.dart';
import 'daos/activity_dao.dart';
import 'daos/body_dao.dart';
import 'daos/exercise_dao.dart';
import 'daos/nutrition_dao.dart';
import 'daos/plan_dao.dart';
import 'daos/profile_dao.dart';
import 'daos/progress_dao.dart';
import 'daos/workout_dao.dart';
import 'sync_columns.dart';
import 'tables/activity_tables.dart';
import 'tables/body_tables.dart';
import 'tables/exercise_tables.dart';
import 'tables/nutrition_tables.dart';
import 'tables/plan_tables.dart';
import 'tables/profile_tables.dart';
import 'tables/progress_tables.dart';
import 'tables/workout_tables.dart';

part 'app_database.g.dart';

/// Local SQLite database (all four platforms). Offline-first: every write
/// lands here and is marked `pending` for the sync engine.
@DriftDatabase(
  tables: [
    UsersProfile,
    Exercises,
    WorkoutTemplates,
    WorkoutSessions,
    ExerciseEntries,
    SetEntries,
    Plans,
    PlanDays,
    CardioSessions,
    RoutePoints,
    DailyActivity,
    BodyMeasurements,
    ProgressPhotos,
    WaterLogs,
    NutritionLogs,
    Achievements,
    PersonalRecords,
  ],
  daos: [ProfileDao, ExerciseDao, WorkoutDao, PlanDao, ActivityDao, BodyDao, NutritionDao, ProgressDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  /// The on-device database, stored in the app-support directory (not user
  /// visible Documents).
  factory AppDatabase.open() => AppDatabase(
        driftDatabase(
          name: 'pulse',
          native: const DriftNativeOptions(databaseDirectory: getApplicationSupportDirectory),
        ),
      );

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) await m.addColumn(usersProfile, usersProfile.dashboardCards);
          if (from < 3) {
            await m.addColumn(usersProfile, usersProfile.remindersEnabled);
            await m.addColumn(usersProfile, usersProfile.reminderMinute);
          }
        },
      );
}

/// UTC "now" for timestamps written by DAOs.
DateTime utcNow() => DateTime.now().toUtc();

/// Soft delete: rows are kept (so deletions sync) but hidden from queries.
extension SoftDeleteX on GeneratedDatabase {
  Future<void> softDelete(TableInfo<Table, Object?> table, String id) => customUpdate(
        'UPDATE "${table.actualTableName}" SET deleted = 1, updated_at = ?, sync_status = ? WHERE id = ?',
        variables: [Variable<DateTime>(utcNow()), Variable<String>(SyncStatus.pending.name), Variable<String>(id)],
        updates: {table},
        updateKind: UpdateKind.update,
      );
}
