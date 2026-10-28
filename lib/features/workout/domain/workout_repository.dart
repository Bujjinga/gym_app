import 'set_entry.dart';
import 'workout_session.dart';
import 'workout_template.dart';

abstract interface class WorkoutRepository {
  Stream<List<WorkoutTemplate>> watchTemplates();

  Future<void> saveTemplate(WorkoutTemplate template);

  Future<void> deleteTemplate(String id);

  /// Session headers (no entries), newest first.
  Stream<List<WorkoutSession>> watchSessions({DateTime? from, DateTime? to});

  /// Full session with entries and sets, or null if missing/deleted.
  Future<WorkoutSession?> getSession(String id);

  /// Saves the whole session graph; total volume is recomputed from sets.
  Future<void> saveSession(WorkoutSession session);

  Future<void> deleteSession(String id);

  /// An unfinished live workout to resume after the app was closed.
  Future<WorkoutSession?> unfinishedSession();

  /// One point per finished session that included [exerciseId], oldest first.
  Future<List<ExerciseHistoryPoint>> history(String exerciseId);

  /// Finished workouts started from these plan days (drives plan rotation).
  Stream<int> watchCompletedForPlanDays(List<String> planDayIds);

  /// Sets from the last time [exerciseId] was performed ("last time: 60 kg × 8").
  Future<List<SetEntry>> lastPerformance(String exerciseId, {String? excludeSessionId});
}

/// Best effort of one session for an exercise (for progress charts).
typedef ExerciseHistoryPoint = ({DateTime date, double bestOneRepMax, double topWeightKg, int topReps});
