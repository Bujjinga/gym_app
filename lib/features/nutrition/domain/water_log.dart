import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_log.freezed.dart';
part 'water_log.g.dart';

@freezed
abstract class WaterLog with _$WaterLog {
  const factory WaterLog({
    required String id,
    required DateTime loggedAt,
    required int amountMl,
  }) = _WaterLog;

  factory WaterLog.fromJson(Map<String, dynamic> json) => _$WaterLogFromJson(json);
}
