// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_measurement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BodyMeasurement _$BodyMeasurementFromJson(Map<String, dynamic> json) =>
    _BodyMeasurement(
      id: json['id'] as String,
      type: $enumDecode(_$MeasurementTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
      measuredAt: DateTime.parse(json['measuredAt'] as String),
    );

Map<String, dynamic> _$BodyMeasurementToJson(_BodyMeasurement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MeasurementTypeEnumMap[instance.type]!,
      'value': instance.value,
      'measuredAt': instance.measuredAt.toIso8601String(),
    };

const _$MeasurementTypeEnumMap = {
  MeasurementType.weight: 'weight',
  MeasurementType.bodyFat: 'bodyFat',
  MeasurementType.waist: 'waist',
  MeasurementType.chest: 'chest',
  MeasurementType.hips: 'hips',
  MeasurementType.arm: 'arm',
  MeasurementType.thigh: 'thigh',
  MeasurementType.neck: 'neck',
};
