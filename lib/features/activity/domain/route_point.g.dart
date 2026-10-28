// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoutePoint _$RoutePointFromJson(Map<String, dynamic> json) => _RoutePoint(
  id: json['id'] as String,
  recordedAt: DateTime.parse(json['recordedAt'] as String),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  altitudeM: (json['altitudeM'] as num?)?.toDouble(),
  speedMps: (json['speedMps'] as num?)?.toDouble(),
  accuracyM: (json['accuracyM'] as num?)?.toDouble(),
  heartRate: (json['heartRate'] as num?)?.toInt(),
);

Map<String, dynamic> _$RoutePointToJson(_RoutePoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordedAt': instance.recordedAt.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitudeM': ?instance.altitudeM,
      'speedMps': ?instance.speedMps,
      'accuracyM': ?instance.accuracyM,
      'heartRate': ?instance.heartRate,
    };
