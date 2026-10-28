// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutSession _$WorkoutSessionFromJson(Map<String, dynamic> json) =>
    _WorkoutSession(
      id: json['id'] as String,
      name: json['name'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
      templateId: json['templateId'] as String?,
      planDayId: json['planDayId'] as String?,
      notes: json['notes'] as String?,
      totalVolumeKg: (json['totalVolumeKg'] as num?)?.toDouble() ?? 0,
      caloriesKcal: (json['caloriesKcal'] as num?)?.toDouble(),
      source:
          $enumDecodeNullable(_$WorkoutSourceEnumMap, json['source']) ??
          WorkoutSource.live,
      healthSynced: json['healthSynced'] as bool? ?? false,
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map((e) => ExerciseEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExerciseEntry>[],
    );

Map<String, dynamic> _$WorkoutSessionToJson(_WorkoutSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': ?instance.endedAt?.toIso8601String(),
      'templateId': ?instance.templateId,
      'planDayId': ?instance.planDayId,
      'notes': ?instance.notes,
      'totalVolumeKg': instance.totalVolumeKg,
      'caloriesKcal': ?instance.caloriesKcal,
      'source': _$WorkoutSourceEnumMap[instance.source]!,
      'healthSynced': instance.healthSynced,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };

const _$WorkoutSourceEnumMap = {
  WorkoutSource.live: 'live',
  WorkoutSource.manual: 'manual',
};
