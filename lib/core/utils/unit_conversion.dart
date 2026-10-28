import '../domain/pulse_enums.dart';

/// Storage is always metric (kg, m, cm); these convert for display/input.
abstract final class Units {
  static const double lbPerKg = 2.2046226218;
  static const double metersPerMile = 1609.344;
  static const double cmPerInch = 2.54;

  static double kgToLb(double kg) => kg * lbPerKg;
  static double lbToKg(double lb) => lb / lbPerKg;

  static double cmToIn(double cm) => cm / cmPerInch;
  static double inToCm(double inches) => inches * cmPerInch;

  /// Kilograms shown in the user's [unit].
  static double weightFromKg(double kg, WeightUnit unit) => unit == WeightUnit.kg ? kg : kgToLb(kg);

  /// User-entered weight in [unit] → kilograms for storage.
  static double weightToKg(double value, WeightUnit unit) => unit == WeightUnit.kg ? value : lbToKg(value);

  /// Meters shown as km or miles.
  static double distanceFromMeters(double meters, DistanceUnit unit) =>
      unit == DistanceUnit.km ? meters / 1000 : meters / metersPerMile;

  /// User-entered km or miles → meters for storage.
  static double distanceToMeters(double value, DistanceUnit unit) =>
      unit == DistanceUnit.km ? value * 1000 : value * metersPerMile;

  /// Meters in one display unit (1 km or 1 mile) — for splits and pace.
  static double metersPerUnit(DistanceUnit unit) => unit == DistanceUnit.km ? 1000 : metersPerMile;
}
