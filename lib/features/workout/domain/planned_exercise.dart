import 'package:freezed_annotation/freezed_annotation.dart';

part 'planned_exercise.freezed.dart';
part 'planned_exercise.g.dart';

/// An exercise prescription inside a template or plan day, e.g. 3 × 8–12.
@freezed
abstract class PlannedExercise with _$PlannedExercise {
  const factory PlannedExercise({
    required String exerciseId,
    @Default(3) int sets,
    @Default(10) int reps,

    /// Upper end of a rep range (null for a fixed rep target).
    int? repsMax,
    @Default(90) int restSeconds,

    /// Exercises sharing a group number are done as a superset/circuit.
    int? supersetGroup,
    String? notes,
  }) = _PlannedExercise;

  factory PlannedExercise.fromJson(Map<String, dynamic> json) => _$PlannedExerciseFromJson(json);
}
