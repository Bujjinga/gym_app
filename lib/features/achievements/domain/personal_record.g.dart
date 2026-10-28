// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalRecord _$PersonalRecordFromJson(Map<String, dynamic> json) =>
    _PersonalRecord(
      id: json['id'] as String,
      exerciseId: json['exerciseId'] as String,
      type: $enumDecode(_$RecordTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
      reps: (json['reps'] as num?)?.toInt(),
      achievedAt: DateTime.parse(json['achievedAt'] as String),
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$PersonalRecordToJson(_PersonalRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exerciseId': instance.exerciseId,
      'type': _$RecordTypeEnumMap[instance.type]!,
      'value': instance.value,
      'reps': ?instance.reps,
      'achievedAt': instance.achievedAt.toIso8601String(),
      'sessionId': ?instance.sessionId,
    };

const _$RecordTypeEnumMap = {
  RecordType.maxWeight: 'maxWeight',
  RecordType.estimatedOneRepMax: 'estimatedOneRepMax',
  RecordType.maxReps: 'maxReps',
  RecordType.maxVolume: 'maxVolume',
};
