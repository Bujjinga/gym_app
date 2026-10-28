import '../domain/pulse_enums.dart';
import 'unit_conversion.dart';

/// Pace, speed and calorie math for cardio.
abstract final class Cardio {
  /// Seconds per km/mile, or null when there is no distance yet.
  static double? paceSecondsPerUnit(double distanceM, int durationSec, DistanceUnit unit) {
    if (distanceM <= 0 || durationSec <= 0) return null;
    return durationSec / (distanceM / Units.metersPerUnit(unit));
  }

  /// "5:07" style pace (minutes:seconds per unit).
  static String formatPace(double? secondsPerUnit) {
    if (secondsPerUnit == null || !secondsPerUnit.isFinite) return '--:--';
    final s = secondsPerUnit.round();
    return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
  }

  static double speedKmh(double distanceM, int durationSec) =>
      durationSec <= 0 ? 0 : (distanceM / 1000) / (durationSec / 3600);

  /// MET estimate (Compendium of Physical Activities). Running scales with
  /// speed (≈1 MET per km/h, floor 6); treadmill uses walk/run by speed.
  static double met(CardioType type, {double speedKmh = 0}) => switch (type) {
        CardioType.walk => speedKmh >= 6 ? 5.0 : 3.5,
        CardioType.run => speedKmh <= 0 ? 9.8 : (speedKmh < 6 ? 6.0 : speedKmh),
        CardioType.hike => 6.0,
        CardioType.cycle => speedKmh >= 25 ? 10.0 : (speedKmh >= 19 ? 8.0 : 6.8),
        CardioType.treadmill => speedKmh >= 7 ? speedKmh : (speedKmh >= 6 ? 5.0 : 3.5),
        CardioType.other => 5.0,
      };

  /// kcal = MET × body weight (kg) × hours.
  static double caloriesFromMet(double met, double weightKg, Duration duration) =>
      met * weightKg * duration.inSeconds / 3600;

  /// Calories for a session; falls back to a 70 kg body weight when unknown.
  static double sessionCalories({
    required CardioType type,
    required double distanceM,
    required int durationSec,
    double? weightKg,
  }) =>
      caloriesFromMet(
        met(type, speedKmh: speedKmh(distanceM, durationSec)),
        weightKg ?? 70,
        Duration(seconds: durationSec),
      );
}
