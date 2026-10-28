// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseEntry _$ExerciseEntryFromJson(Map<String, dynamic> json) =>
    _ExerciseEntry(
      id: json['id'] as String,
      exerciseId: json['exerciseId'] as String,
      supersetGroup: (json['supersetGroup'] as num?)?.toInt(),
      restSeconds: (json['restSeconds'] as num?)?.toInt() ?? 90,
      notes: json['notes'] as String?,
      sets:
          (json['sets'] as List<dynamic>?)
              ?.map((e) => SetEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SetEntry>[],
    );

Map<String, dynamic> _$ExerciseEntryToJson(_ExerciseEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exerciseId': instance.exerciseId,
      'supersetGroup': ?instance.supersetGroup,
      'restSeconds': instance.restSeconds,
      'notes': ?instance.notes,
      'sets': instance.sets.map((e) => e.toJson()).toList(),
    };
