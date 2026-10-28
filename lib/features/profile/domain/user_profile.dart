import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// The user's body stats, goals, units and preferences. Every body stat is
/// optional; units only affect display (storage is always metric).
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    String? displayName,
    String? avatarPath,
    TrainingGoal? goal,
    ExperienceLevel? experience,
    @Default(<Equipment>[]) List<Equipment> equipment,
    int? trainingDaysPerWeek,
    double? heightCm,
    double? weightKg,
    int? birthYear,
    Sex? sex,
    @Default(WeightUnit.kg) WeightUnit weightUnit,
    @Default(DistanceUnit.km) DistanceUnit distanceUnit,
    @Default(AppThemeMode.dark) AppThemeMode themeMode,
    @Default(500) int moveGoalKcal,
    @Default(30) int exerciseGoalMin,
    @Default(10000) int stepsGoal,
    @Default(2500) int waterGoalMl,
    @Default(false) bool onboardingComplete,
    @Default(0) int xp,

    /// Home card order; `!` prefix = hidden. Interpreted by the home feature.
    @Default(<String>[]) List<String> dashboardCards,
    @Default(false) bool remindersEnabled,

    /// Reminder time as minutes after midnight (local).
    @Default(18 * 60) int reminderMinute,
  }) = _UserProfile;

  const UserProfile._();

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  /// Age in whole years from [birthYear], if known.
  int? ageOn(DateTime date) => birthYear == null ? null : date.year - birthYear!;
}
