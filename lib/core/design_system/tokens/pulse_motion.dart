import 'package:flutter/widgets.dart';

import '../animations/spring_curve.dart';

/// The three motion presets every animation in PULSE picks from.
enum MotionPreset {
  /// Quick, critically damped — taps, toggles, small UI changes.
  snappy(stiffness: 700, dampingRatio: 0.9, curve: Curves.easeOutCubic),

  /// Calm, no overshoot — page-level and layout changes.
  smooth(stiffness: 220, dampingRatio: 1, curve: Curves.easeInOutCubic),

  /// Visible overshoot — celebrations, goal closes, "GO" states.
  bouncy(stiffness: 320, dampingRatio: 0.55, curve: Curves.easeOutBack);

  const MotionPreset({
    required this.stiffness,
    required this.dampingRatio,
    required this.curve,
  });

  final double stiffness;
  final double dampingRatio;

  /// Curve approximation for implicit animations that need a fixed duration.
  final Curve curve;

  SpringDescription get spring => SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: stiffness,
        ratio: dampingRatio,
      );

  /// The real spring expressed as a [Curve] (for AnimatedFoo widgets).
  Curve get springCurve => SpringCurve(spring);
}

/// Duration tokens. Read via `context.motion`.
@immutable
class PulseMotion {
  const PulseMotion({required this.reduced});

  /// True when the OS asks for reduced motion; big movement becomes fades.
  final bool reduced;

  Duration get fast => reduced ? Duration.zero : const Duration(milliseconds: 150);
  Duration get medium => reduced ? const Duration(milliseconds: 150) : const Duration(milliseconds: 300);
  Duration get slow => reduced ? const Duration(milliseconds: 200) : const Duration(milliseconds: 600);
  Duration get stagger => reduced ? Duration.zero : const Duration(milliseconds: 45);
}
