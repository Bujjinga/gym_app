import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

/// A library exercise (bundled or custom).
@freezed
abstract class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required MuscleGroup primaryMuscle,
    @Default(<MuscleGroup>[]) List<MuscleGroup> secondaryMuscles,
    required Equipment equipment,
    required Difficulty difficulty,
    required MovementPattern movementPattern,

    /// Step-by-step form cues.
    @Default(<String>[]) List<String> instructions,
    @Default(<String>[]) List<String> mistakes,
    String? animationAsset,
    @Default(false) bool isCustom,
    @Default(false) bool isFavorite,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
}
