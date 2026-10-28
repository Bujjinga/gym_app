import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';
import 'exercise_entry.dart';

part 'workout_session.freezed.dart';
part 'workout_session.g.dart';

/// A performed workout. [entries] is empty in list views and filled when
/// loaded via `WorkoutRepository.getSession`.
@freezed
abstract class WorkoutSession with _$WorkoutSession {
  const factory WorkoutSession({
    required String id,
    required String name,
    required DateTime startedAt,
    DateTime? endedAt,
    String? templateId,
    String? planDayId,
    String? notes,
    @Default(0) double totalVolumeKg,
    double? caloriesKcal,
    @Default(WorkoutSource.live) WorkoutSource source,
    @Default(false) bool healthSynced,
    @Default(<ExerciseEntry>[]) List<ExerciseEntry> entries,
  }) = _WorkoutSession;

  const WorkoutSession._();

  factory WorkoutSession.fromJson(Map<String, dynamic> json) => _$WorkoutSessionFromJson(json);

  Duration? get duration => endedAt?.difference(startedAt);
}
