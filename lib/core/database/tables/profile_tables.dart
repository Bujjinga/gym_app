import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../sync_columns.dart';

/// Single row per user: body stats, goals, units and app preferences.
@DataClassName('UserProfileRow')
class UsersProfile extends Table with SyncColumns {
  TextColumn get displayName => text().nullable()();
  TextColumn get avatarPath => text().nullable()();
  TextColumn get goal => textEnum<TrainingGoal>().nullable()();
  TextColumn get experience => textEnum<ExperienceLevel>().nullable()();

  /// JSON list of [Equipment] names.
  TextColumn get equipment => text().withDefault(const Constant('[]'))();
  IntColumn get trainingDaysPerWeek => integer().nullable()();
  RealColumn get heightCm => real().nullable()();
  RealColumn get weightKg => real().nullable()();
  IntColumn get birthYear => integer().nullable()();
  TextColumn get sex => textEnum<Sex>().nullable()();
  TextColumn get weightUnit => textEnum<WeightUnit>().withDefault(Constant(WeightUnit.kg.name))();
  TextColumn get distanceUnit => textEnum<DistanceUnit>().withDefault(Constant(DistanceUnit.km.name))();
  TextColumn get themeMode => textEnum<AppThemeMode>().withDefault(Constant(AppThemeMode.dark.name))();
  IntColumn get moveGoalKcal => integer().withDefault(const Constant(500))();
  IntColumn get exerciseGoalMin => integer().withDefault(const Constant(30))();
  IntColumn get stepsGoal => integer().withDefault(const Constant(10000))();
  IntColumn get waterGoalMl => integer().withDefault(const Constant(2500))();
  BoolColumn get onboardingComplete => boolean().withDefault(const Constant(false))();
  IntColumn get xp => integer().withDefault(const Constant(0))();

  /// Home dashboard card order (JSON list); hidden cards are prefixed with `!`. Added in schema v2.
  TextColumn get dashboardCards => text().withDefault(const Constant('[]'))();

  /// Local reminders on/off and their time of day (minutes after midnight). Added in schema v3.
  BoolColumn get remindersEnabled => boolean().withDefault(const Constant(false))();
  IntColumn get reminderMinute => integer().withDefault(const Constant(18 * 60))();
}
