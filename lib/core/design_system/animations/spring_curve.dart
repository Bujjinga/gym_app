import 'package:flutter/animation.dart';
import 'package:flutter/physics.dart';

/// A [Curve] that follows a [SpringSimulation] from 0 to 1, so implicit
/// animations can use real spring physics (including overshoot).
class SpringCurve extends Curve {
  SpringCurve(SpringDescription spring)
      : _sim = SpringSimulation(spring, 0, 1, 0),
        _settle = _settleTime(spring);

  final SpringSimulation _sim;
  final double _settle;

  // Time (s) after which the spring is visually at rest; maps curve t=1 to it.
  static double _settleTime(SpringDescription spring) {
    final sim = SpringSimulation(spring, 0, 1, 0,
        tolerance: const Tolerance(distance: 0.001, velocity: 0.001));
    var t = 0.0;
    while (!sim.isDone(t) && t < 5) {
      t += 1 / 120;
    }
    return t;
  }

  @override
  double transformInternal(double t) => _sim.x(t * _settle);
}
