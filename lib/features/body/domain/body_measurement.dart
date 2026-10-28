import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'body_measurement.freezed.dart';
part 'body_measurement.g.dart';

/// Weight (kg), body fat (%) or a circumference (cm).
@freezed
abstract class BodyMeasurement with _$BodyMeasurement {
  const factory BodyMeasurement({
    required String id,
    required MeasurementType type,
    required double value,
    required DateTime measuredAt,
  }) = _BodyMeasurement;

  factory BodyMeasurement.fromJson(Map<String, dynamic> json) => _$BodyMeasurementFromJson(json);
}
