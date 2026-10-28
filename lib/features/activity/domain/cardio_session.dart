import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'cardio_session.freezed.dart';
part 'cardio_session.g.dart';

/// Walk / run / hike / cycle. Distance in meters, moving time in seconds.
@freezed
abstract class CardioSession with _$CardioSession {
  const factory CardioSession({
    required String id,
    required CardioType type,
    required CardioSource source,
    required DateTime startedAt,
    DateTime? endedAt,
    @Default(0) int durationSec,
    @Default(0) double distanceM,
    double? caloriesKcal,
    double? elevationGainM,
    int? avgHeartRate,
    int? maxHeartRate,
    int? steps,
    String? notes,
  }) = _CardioSession;

  factory CardioSession.fromJson(Map<String, dynamic> json) => _$CardioSessionFromJson(json);
}
