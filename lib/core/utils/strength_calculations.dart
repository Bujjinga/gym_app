import '../domain/pulse_enums.dart';

/// Strength math. Weights in kg.
abstract final class Strength {
  /// Epley: w × (1 + reps / 30). Exact for a single rep.
  static double epley(double weightKg, int reps) {
    if (reps <= 0 || weightKg <= 0) return 0;
    if (reps == 1) return weightKg;
    return weightKg * (1 + reps / 30);
  }

  /// Brzycki: w × 36 / (37 − reps). Undefined at 37+ reps, so those return 0.
  static double brzycki(double weightKg, int reps) {
    if (reps <= 0 || weightKg <= 0 || reps >= 37) return 0;
    return weightKg * 36 / (37 - reps);
  }

  /// The 1RM shown in the app: Epley, which tracks Brzycki closely up to
  /// ~10 reps and stays defined for high-rep sets.
  static double estimatedOneRepMax(double weightKg, int reps) => epley(weightKg, reps);

  static double setVolume(double? weightKg, int? reps) =>
      (weightKg == null || reps == null || weightKg <= 0 || reps <= 0) ? 0 : weightKg * reps;

  /// Total volume of completed working sets (warm-ups excluded).
  static double totalVolume(Iterable<({double? weightKg, int? reps, SetType type, bool completed})> sets) =>
      sets
          .where((s) => s.completed && s.type != SetType.warmup)
          .fold(0.0, (sum, s) => sum + setVolume(s.weightKg, s.reps));
}
