import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'exercise_filter.freezed.dart';

/// Search + filter state for the exercise library. All fields optional.
@freezed
abstract class ExerciseFilter with _$ExerciseFilter {
  const factory ExerciseFilter({
    String? query,
    MuscleGroup? muscle,
    Equipment? equipment,
    Difficulty? difficulty,
    @Default(false) bool favoritesOnly,
  }) = _ExerciseFilter;
}
