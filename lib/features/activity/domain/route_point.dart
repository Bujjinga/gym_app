import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_point.freezed.dart';
part 'route_point.g.dart';

/// One GPS fix of a tracked route.
@freezed
abstract class RoutePoint with _$RoutePoint {
  const factory RoutePoint({
    required String id,
    required DateTime recordedAt,
    required double latitude,
    required double longitude,
    double? altitudeM,
    double? speedMps,
    double? accuracyM,
    int? heartRate,
  }) = _RoutePoint;

  factory RoutePoint.fromJson(Map<String, dynamic> json) => _$RoutePointFromJson(json);
}
