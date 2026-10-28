import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exercises/domain/exercise.dart';
import '../domain/set_entry.dart';
import '../domain/workout_session.dart';

part 'active_workout_state.freezed.dart';

/// Everything the workout screen needs for the session in progress.
@freezed
abstract class ActiveWorkoutState with _$ActiveWorkoutState {
  const factory ActiveWorkoutState({
    required WorkoutSession session,

    /// Exercise details by id, for names and muscles.
    @Default(<String, Exercise>{}) Map<String, Exercise> exercises,

    /// Previous performance by exercise id ("last time: 60 kg × 8").
    @Default(<String, List<SetEntry>>{}) Map<String, List<SetEntry>> lastTime,
    DateTime? restEndsAt,
    @Default(Duration.zero) Duration restTotal,
    @Default(false) bool keepAwake,

    /// Logged after the fact (desktop): no rest timer, editable start/duration.
    @Default(false) bool manual,
    @Default(Duration(minutes: 60)) Duration manualDuration,
  }) = _ActiveWorkoutState;
}
