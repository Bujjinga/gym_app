import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/strength_calculations.dart';
import '../../achievements/domain/personal_record.dart';
import 'workout_session.dart';

/// Finds new personal records in a finished session.
///
/// [previousBest] returns the stored best value for an exercise/type, or
/// null if there is none (first time → it becomes a record).
List<PersonalRecord> detectRecords(
  WorkoutSession session, {
  required double? Function(String exerciseId, RecordType type) previousBest,
  required String Function() newId,
}) {
  final records = <PersonalRecord>[];
  final achievedAt = session.endedAt ?? session.startedAt;
  final byExercise = <String, List<({double kg, int reps})>>{};
  for (final entry in session.entries) {
    for (final s in entry.sets) {
      final reps = s.reps ?? 0;
      if (!s.isCompleted || s.type == SetType.warmup || reps <= 0) continue;
      (byExercise[entry.exerciseId] ??= []).add((kg: s.weightKg ?? 0, reps: reps));
    }
  }

  for (final MapEntry(key: exerciseId, value: sets) in byExercise.entries) {
    void consider(RecordType type, double value, {int? reps}) {
      if (value <= 0) return;
      final best = previousBest(exerciseId, type);
      if (best != null && value <= best + 1e-9) return;
      records.add(PersonalRecord(
        id: newId(),
        exerciseId: exerciseId,
        type: type,
        value: value,
        reps: reps,
        achievedAt: achievedAt,
        sessionId: session.id,
      ));
    }

    final heaviest = sets.reduce((a, b) => b.kg > a.kg || (b.kg == a.kg && b.reps > a.reps) ? b : a);
    consider(RecordType.maxWeight, heaviest.kg, reps: heaviest.reps);

    final best1rm = sets
        .map((s) => (set: s, e1rm: Strength.estimatedOneRepMax(s.kg, s.reps)))
        .reduce((a, b) => b.e1rm > a.e1rm ? b : a);
    consider(RecordType.estimatedOneRepMax, best1rm.e1rm, reps: best1rm.set.reps);

    final mostReps = sets.reduce((a, b) => b.reps > a.reps ? b : a);
    consider(RecordType.maxReps, mostReps.reps.toDouble(), reps: mostReps.reps);

    consider(RecordType.maxVolume, sets.fold(0.0, (sum, s) => sum + Strength.setVolume(s.kg, s.reps)));
  }
  return records;
}
