import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'day_activity.freezed.dart';
part 'day_activity.g.dart';

/// One calendar day of passive activity and health metrics.
@freezed
abstract class DayActivity with _$DayActivity {
  const factory DayActivity({
    /// Local calendar day, `yyyy-MM-dd`.
    required String day,
    @Default(0) int steps,
    @Default(0) double distanceM,
    @Default(0) int floors,
    @Default(0) double activeKcal,
    @Default(0) int exerciseMin,
    int? restingHeartRate,
    int? avgHeartRate,
    double? hrvMs,
    double? vo2Max,
    int? sleepMinutes,
    @Default(ActivitySource.device) ActivitySource source,
  }) = _DayActivity;

  factory DayActivity.fromJson(Map<String, dynamic> json) => _$DayActivityFromJson(json);

  /// `yyyy-MM-dd` key for a local date.
  static String keyFor(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}
