// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutTemplate _$WorkoutTemplateFromJson(Map<String, dynamic> json) =>
    _WorkoutTemplate(
      id: json['id'] as String,
      name: json['name'] as String,
      notes: json['notes'] as String?,
      exercises:
          (json['exercises'] as List<dynamic>?)
              ?.map((e) => PlannedExercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PlannedExercise>[],
    );

Map<String, dynamic> _$WorkoutTemplateToJson(_WorkoutTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'notes': ?instance.notes,
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
    };
