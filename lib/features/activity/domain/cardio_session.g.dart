// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardio_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardioSession _$CardioSessionFromJson(Map<String, dynamic> json) =>
    _CardioSession(
      id: json['id'] as String,
      type: $enumDecode(_$CardioTypeEnumMap, json['type']),
      source: $enumDecode(_$CardioSourceEnumMap, json['source']),
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
      durationSec: (json['durationSec'] as num?)?.toInt() ?? 0,
      distanceM: (json['distanceM'] as num?)?.toDouble() ?? 0,
      caloriesKcal: (json['caloriesKcal'] as num?)?.toDouble(),
      elevationGainM: (json['elevationGainM'] as num?)?.toDouble(),
      avgHeartRate: (json['avgHeartRate'] as num?)?.toInt(),
      maxHeartRate: (json['maxHeartRate'] as num?)?.toInt(),
      steps: (json['steps'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CardioSessionToJson(_CardioSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$CardioTypeEnumMap[instance.type]!,
      'source': _$CardioSourceEnumMap[instance.source]!,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': ?instance.endedAt?.toIso8601String(),
      'durationSec': instance.durationSec,
      'distanceM': instance.distanceM,
      'caloriesKcal': ?instance.caloriesKcal,
      'elevationGainM': ?instance.elevationGainM,
      'avgHeartRate': ?instance.avgHeartRate,
      'maxHeartRate': ?instance.maxHeartRate,
      'steps': ?instance.steps,
      'notes': ?instance.notes,
    };

const _$CardioTypeEnumMap = {
  CardioType.walk: 'walk',
  CardioType.run: 'run',
  CardioType.hike: 'hike',
  CardioType.cycle: 'cycle',
  CardioType.treadmill: 'treadmill',
  CardioType.other: 'other',
};

const _$CardioSourceEnumMap = {
  CardioSource.gps: 'gps',
  CardioSource.indoor: 'indoor',
  CardioSource.manual: 'manual',
  CardioSource.health: 'health',
};
