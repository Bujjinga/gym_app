// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetEntry _$SetEntryFromJson(Map<String, dynamic> json) => _SetEntry(
  id: json['id'] as String,
  type: $enumDecodeNullable(_$SetTypeEnumMap, json['type']) ?? SetType.working,
  weightKg: (json['weightKg'] as num?)?.toDouble(),
  reps: (json['reps'] as num?)?.toInt(),
  rpe: (json['rpe'] as num?)?.toDouble(),
  durationSec: (json['durationSec'] as num?)?.toInt(),
  distanceM: (json['distanceM'] as num?)?.toDouble(),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$SetEntryToJson(_SetEntry instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$SetTypeEnumMap[instance.type]!,
  'weightKg': ?instance.weightKg,
  'reps': ?instance.reps,
  'rpe': ?instance.rpe,
  'durationSec': ?instance.durationSec,
  'distanceM': ?instance.distanceM,
  'completedAt': ?instance.completedAt?.toIso8601String(),
};

const _$SetTypeEnumMap = {
  SetType.warmup: 'warmup',
  SetType.working: 'working',
  SetType.drop: 'drop',
  SetType.failure: 'failure',
};
