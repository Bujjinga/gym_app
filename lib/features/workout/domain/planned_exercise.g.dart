// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlannedExercise _$PlannedExerciseFromJson(Map<String, dynamic> json) =>
    _PlannedExercise(
      exerciseId: json['exerciseId'] as String,
      sets: (json['sets'] as num?)?.toInt() ?? 3,
      reps: (json['reps'] as num?)?.toInt() ?? 10,
      repsMax: (json['repsMax'] as num?)?.toInt(),
      restSeconds: (json['restSeconds'] as num?)?.toInt() ?? 90,
      supersetGroup: (json['supersetGroup'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$PlannedExerciseToJson(_PlannedExercise instance) =>
    <String, dynamic>{
      'exerciseId': instance.exerciseId,
      'sets': instance.sets,
      'reps': instance.reps,
      'repsMax': ?instance.repsMax,
      'restSeconds': instance.restSeconds,
      'supersetGroup': ?instance.supersetGroup,
      'notes': ?instance.notes,
    };
