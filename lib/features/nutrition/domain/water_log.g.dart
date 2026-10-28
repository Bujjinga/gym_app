// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WaterLog _$WaterLogFromJson(Map<String, dynamic> json) => _WaterLog(
  id: json['id'] as String,
  loggedAt: DateTime.parse(json['loggedAt'] as String),
  amountMl: (json['amountMl'] as num).toInt(),
);

Map<String, dynamic> _$WaterLogToJson(_WaterLog instance) => <String, dynamic>{
  'id': instance.id,
  'loggedAt': instance.loggedAt.toIso8601String(),
  'amountMl': instance.amountMl,
};
