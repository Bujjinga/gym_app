// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Exercise _$ExerciseFromJson(Map<String, dynamic> json) => _Exercise(
  id: json['id'] as String,
  name: json['name'] as String,
  primaryMuscle: $enumDecode(_$MuscleGroupEnumMap, json['primaryMuscle']),
  secondaryMuscles:
      (json['secondaryMuscles'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MuscleGroupEnumMap, e))
          .toList() ??
      const <MuscleGroup>[],
  equipment: $enumDecode(_$EquipmentEnumMap, json['equipment']),
  difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
  movementPattern: $enumDecode(
    _$MovementPatternEnumMap,
    json['movementPattern'],
  ),
  instructions:
      (json['instructions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  mistakes:
      (json['mistakes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  animationAsset: json['animationAsset'] as String?,
  isCustom: json['isCustom'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$ExerciseToJson(_Exercise instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'primaryMuscle': _$MuscleGroupEnumMap[instance.primaryMuscle]!,
  'secondaryMuscles': instance.secondaryMuscles
      .map((e) => _$MuscleGroupEnumMap[e]!)
      .toList(),
  'equipment': _$EquipmentEnumMap[instance.equipment]!,
  'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
  'movementPattern': _$MovementPatternEnumMap[instance.movementPattern]!,
  'instructions': instance.instructions,
  'mistakes': instance.mistakes,
  'animationAsset': ?instance.animationAsset,
  'isCustom': instance.isCustom,
  'isFavorite': instance.isFavorite,
};

const _$MuscleGroupEnumMap = {
  MuscleGroup.chest: 'chest',
  MuscleGroup.back: 'back',
  MuscleGroup.lats: 'lats',
  MuscleGroup.traps: 'traps',
  MuscleGroup.shoulders: 'shoulders',
  MuscleGroup.biceps: 'biceps',
  MuscleGroup.triceps: 'triceps',
  MuscleGroup.forearms: 'forearms',
  MuscleGroup.abs: 'abs',
  MuscleGroup.obliques: 'obliques',
  MuscleGroup.lowerBack: 'lowerBack',
  MuscleGroup.glutes: 'glutes',
  MuscleGroup.quads: 'quads',
  MuscleGroup.hamstrings: 'hamstrings',
  MuscleGroup.adductors: 'adductors',
  MuscleGroup.calves: 'calves',
  MuscleGroup.fullBody: 'fullBody',
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

const _$DifficultyEnumMap = {
  Difficulty.beginner: 'beginner',
  Difficulty.intermediate: 'intermediate',
  Difficulty.advanced: 'advanced',
};

const _$MovementPatternEnumMap = {
  MovementPattern.horizontalPush: 'horizontalPush',
  MovementPattern.verticalPush: 'verticalPush',
  MovementPattern.horizontalPull: 'horizontalPull',
  MovementPattern.verticalPull: 'verticalPull',
  MovementPattern.squat: 'squat',
  MovementPattern.hinge: 'hinge',
  MovementPattern.lunge: 'lunge',
  MovementPattern.carry: 'carry',
  MovementPattern.core: 'core',
  MovementPattern.isolation: 'isolation',
  MovementPattern.plyometric: 'plyometric',
  MovementPattern.conditioning: 'conditioning',
};
