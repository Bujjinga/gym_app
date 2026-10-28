import 'package:intl/intl.dart';

import '../domain/pulse_enums.dart';
import 'unit_conversion.dart';

/// Display formatting in the user's units. Storage stays metric.
abstract final class Fmt {
  /// "62.5" — at most one decimal, no trailing ".0".
  static String number(num value, {int decimals = 1}) =>
      NumberFormat.decimalPatternDigits(decimalDigits: decimals).format(value).replaceFirst(RegExp(r'\.0+$'), '');

  /// Weight number only, converted to [unit].
  static String weightValue(double kg, WeightUnit unit) => number(Units.weightFromKg(kg, unit));

  /// "62.5 kg" / "137.8 lb".
  static String weight(double kg, WeightUnit unit) => '${weightValue(kg, unit)} ${unit.name}';

  /// "5.21 km" / "3.24 mi".
  static String distance(double meters, DistanceUnit unit) =>
      '${number(Units.distanceFromMeters(meters, unit), decimals: 2)} ${unit.name}';

  /// "1:05:30" or "45:12".
  static String clock(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60).toString().padLeft(h > 0 ? 2 : 1, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '$m:$s';
  }

  /// "60 kg × 8" (weight omitted for bodyweight sets).
  static String set(double? kg, int? reps, WeightUnit unit) {
    final r = reps ?? 0;
    return kg == null || kg <= 0 ? '$r' : '${weight(kg, unit)} × $r';
  }
}
