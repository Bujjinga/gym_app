import 'package:freezed_annotation/freezed_annotation.dart';

import '../../workout/domain/planned_exercise.dart';

part 'plan_day.freezed.dart';
part 'plan_day.g.dart';

@freezed
abstract class PlanDay with _$PlanDay {
  const factory PlanDay({
    required String id,
    required String name,

    /// ISO weekday 1 (Mon) … 7 (Sun) when pinned to a day of the week.
    int? weekday,
    @Default(<PlannedExercise>[]) List<PlannedExercise> exercises,
  }) = _PlanDay;

  factory PlanDay.fromJson(Map<String, dynamic> json) => _$PlanDayFromJson(json);
}
