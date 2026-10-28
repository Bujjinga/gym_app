import 'package:freezed_annotation/freezed_annotation.dart';

import 'plan_day.dart';

part 'plan.freezed.dart';
part 'plan.g.dart';

/// A training program. [days] is empty in list views and filled by
/// `PlanRepository.getPlan`.
@freezed
abstract class Plan with _$Plan {
  const factory Plan({
    required String id,
    required String name,
    String? description,
    @Default(false) bool isPrebuilt,
    @Default(false) bool active,
    DateTime? startDate,
    int? weeks,
    @Default(<PlanDay>[]) List<PlanDay> days,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
