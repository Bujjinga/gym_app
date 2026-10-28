// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: json['id'] as String,
  displayName: json['displayName'] as String?,
  avatarPath: json['avatarPath'] as String?,
  goal: $enumDecodeNullable(_$TrainingGoalEnumMap, json['goal']),
  experience: $enumDecodeNullable(_$ExperienceLevelEnumMap, json['experience']),
  equipment:
      (json['equipment'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$EquipmentEnumMap, e))
          .toList() ??
      const <Equipment>[],
  trainingDaysPerWeek: (json['trainingDaysPerWeek'] as num?)?.toInt(),
  heightCm: (json['heightCm'] as num?)?.toDouble(),
  weightKg: (json['weightKg'] as num?)?.toDouble(),
  birthYear: (json['birthYear'] as num?)?.toInt(),
  sex: $enumDecodeNullable(_$SexEnumMap, json['sex']),
  weightUnit:
      $enumDecodeNullable(_$WeightUnitEnumMap, json['weightUnit']) ??
      WeightUnit.kg,
  distanceUnit:
      $enumDecodeNullable(_$DistanceUnitEnumMap, json['distanceUnit']) ??
      DistanceUnit.km,
  themeMode:
      $enumDecodeNullable(_$AppThemeModeEnumMap, json['themeMode']) ??
      AppThemeMode.dark,
  moveGoalKcal: (json['moveGoalKcal'] as num?)?.toInt() ?? 500,
  exerciseGoalMin: (json['exerciseGoalMin'] as num?)?.toInt() ?? 30,
  stepsGoal: (json['stepsGoal'] as num?)?.toInt() ?? 10000,
  waterGoalMl: (json['waterGoalMl'] as num?)?.toInt() ?? 2500,
  onboardingComplete: json['onboardingComplete'] as bool? ?? false,
  xp: (json['xp'] as num?)?.toInt() ?? 0,
  dashboardCards:
      (json['dashboardCards'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  remindersEnabled: json['remindersEnabled'] as bool? ?? false,
  reminderMinute: (json['reminderMinute'] as num?)?.toInt() ?? 18 * 60,
);

Map<String, dynamic> _$UserProfileToJson(
  _UserProfile instance,
) => <String, dynamic>{
  'id': instance.id,
  'displayName': ?instance.displayName,
  'avatarPath': ?instance.avatarPath,
  'goal': ?_$TrainingGoalEnumMap[instance.goal],
  'experience': ?_$ExperienceLevelEnumMap[instance.experience],
  'equipment': instance.equipment.map((e) => _$EquipmentEnumMap[e]!).toList(),
  'trainingDaysPerWeek': ?instance.trainingDaysPerWeek,
  'heightCm': ?instance.heightCm,
  'weightKg': ?instance.weightKg,
  'birthYear': ?instance.birthYear,
  'sex': ?_$SexEnumMap[instance.sex],
  'weightUnit': _$WeightUnitEnumMap[instance.weightUnit]!,
  'distanceUnit': _$DistanceUnitEnumMap[instance.distanceUnit]!,
  'themeMode': _$AppThemeModeEnumMap[instance.themeMode]!,
  'moveGoalKcal': instance.moveGoalKcal,
  'exerciseGoalMin': instance.exerciseGoalMin,
  'stepsGoal': instance.stepsGoal,
  'waterGoalMl': instance.waterGoalMl,
  'onboardingComplete': instance.onboardingComplete,
  'xp': instance.xp,
  'dashboardCards': instance.dashboardCards,
  'remindersEnabled': instance.remindersEnabled,
  'reminderMinute': instance.reminderMinute,
};

const _$TrainingGoalEnumMap = {
  TrainingGoal.buildMuscle: 'buildMuscle',
  TrainingGoal.loseFat: 'loseFat',
  TrainingGoal.endurance: 'endurance',
  TrainingGoal.generalFitness: 'generalFitness',
};

const _$ExperienceLevelEnumMap = {
  ExperienceLevel.beginner: 'beginner',
  ExperienceLevel.intermediate: 'intermediate',
  ExperienceLevel.advanced: 'advanced',
};

const _$EquipmentEnumMap = {
  Equipment.barbell: 'barbell',
  Equipment.dumbbell: 'dumbbell',
  Equipment.kettlebell: 'kettlebell',
  Equipment.machine: 'machine',
  Equipment.cable: 'cable',
  Equipment.smithMachine: 'smithMachine',
  Equipment.ezBar: 'ezBar',
  Equipment.trapBar: 'trapBar',
  Equipment.band: 'band',
  Equipment.bodyweight: 'bodyweight',
  Equipment.pullUpBar: 'pullUpBar',
  Equipment.medicineBall: 'medicineBall',
  Equipment.cardioMachine: 'cardioMachine',
};

const _$SexEnumMap = {
  Sex.female: 'female',
  Sex.male: 'male',
  Sex.other: 'other',
  Sex.preferNotToSay: 'preferNotToSay',
};

const _$WeightUnitEnumMap = {WeightUnit.kg: 'kg', WeightUnit.lb: 'lb'};

const _$DistanceUnitEnumMap = {DistanceUnit.km: 'km', DistanceUnit.mi: 'mi'};

const _$AppThemeModeEnumMap = {
  AppThemeMode.dark: 'dark',
  AppThemeMode.light: 'light',
  AppThemeMode.system: 'system',
};
