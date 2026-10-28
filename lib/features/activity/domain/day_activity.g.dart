// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayActivity _$DayActivityFromJson(Map<String, dynamic> json) => _DayActivity(
  day: json['day'] as String,
  steps: (json['steps'] as num?)?.toInt() ?? 0,
  distanceM: (json['distanceM'] as num?)?.toDouble() ?? 0,
  floors: (json['floors'] as num?)?.toInt() ?? 0,
  activeKcal: (json['activeKcal'] as num?)?.toDouble() ?? 0,
  exerciseMin: (json['exerciseMin'] as num?)?.toInt() ?? 0,
  restingHeartRate: (json['restingHeartRate'] as num?)?.toInt(),
  avgHeartRate: (json['avgHeartRate'] as num?)?.toInt(),
  hrvMs: (json['hrvMs'] as num?)?.toDouble(),
  vo2Max: (json['vo2Max'] as num?)?.toDouble(),
  sleepMinutes: (json['sleepMinutes'] as num?)?.toInt(),
  source:
      $enumDecodeNullable(_$ActivitySourceEnumMap, json['source']) ??
      ActivitySource.device,
);

Map<String, dynamic> _$DayActivityToJson(_DayActivity instance) =>
    <String, dynamic>{
      'day': instance.day,
      'steps': instance.steps,
      'distanceM': instance.distanceM,
      'floors': instance.floors,
      'activeKcal': instance.activeKcal,
      'exerciseMin': instance.exerciseMin,
      'restingHeartRate': ?instance.restingHeartRate,
      'avgHeartRate': ?instance.avgHeartRate,
      'hrvMs': ?instance.hrvMs,
      'vo2Max': ?instance.vo2Max,
      'sleepMinutes': ?instance.sleepMinutes,
      'source': _$ActivitySourceEnumMap[instance.source]!,
    };

const _$ActivitySourceEnumMap = {
  ActivitySource.device: 'device',
  ActivitySource.health: 'health',
  ActivitySource.manual: 'manual',
};
