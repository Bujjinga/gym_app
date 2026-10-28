/// Which plates to load on each side of the bar for a target weight.
/// Works in whatever unit the plates are given in (kg or lb).
class PlateLoad {
  const PlateLoad({required this.perSide, required this.achieved});

  /// Plates for ONE side, heaviest first.
  final List<double> perSide;

  /// Total weight actually loaded (bar + both sides); ≤ target.
  final double achieved;
}

abstract final class PlateCalculator {
  static const kgPlates = [25.0, 20.0, 15.0, 10.0, 5.0, 2.5, 1.25];
  static const lbPlates = [45.0, 35.0, 25.0, 10.0, 5.0, 2.5];

  /// Greedy fill per side, heaviest plate first. A target below the bar
  /// loads nothing.
  static PlateLoad calculate({required double target, required double bar, required List<double> plates}) {
    final sorted = [...plates]..sort((a, b) => b.compareTo(a));
    var remaining = (target - bar) / 2;
    final perSide = <double>[];
    for (final p in sorted) {
      // Small epsilon so 2.5 + 1.25 etc. don't miss due to float error.
      while (remaining + 1e-9 >= p) {
        perSide.add(p);
        remaining -= p;
      }
    }
    final loaded = perSide.fold(0.0, (a, b) => a + b);
    return PlateLoad(perSide: perSide, achieved: target < bar ? bar : bar + loaded * 2);
  }
}
