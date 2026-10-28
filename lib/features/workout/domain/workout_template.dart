import 'package:freezed_annotation/freezed_annotation.dart';

import 'planned_exercise.dart';

part 'workout_template.freezed.dart';
part 'workout_template.g.dart';

@freezed
abstract class WorkoutTemplate with _$WorkoutTemplate {
  const factory WorkoutTemplate({
    required String id,
    required String name,
    String? notes,
    @Default(<PlannedExercise>[]) List<PlannedExercise> exercises,
  }) = _WorkoutTemplate;

  factory WorkoutTemplate.fromJson(Map<String, dynamic> json) => _$WorkoutTemplateFromJson(json);
}
