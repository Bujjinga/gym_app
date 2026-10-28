import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// Spacing (8-pt grid) and corner-radius tokens. Read via `context.metrics`.
///
/// The `static const` values exist for `const` constructors (e.g. EdgeInsets);
/// the instance fields are what the theme carries.
@immutable
class PulseMetrics extends ThemeExtension<PulseMetrics> {
  const PulseMetrics({
    this.xs = space4,
    this.sm = space8,
    this.md = space16,
    this.lg = space24,
    this.xl = space32,
    this.xxl = space48,
    this.radiusSm = 10,
    this.radiusMd = 18,
    this.radiusLg = 28,
  });

  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space48 = 48;

  /// Layout breakpoints for the adaptive shell.
  static const double compactMax = 600;
  static const double mediumMax = 1100;

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double radiusSm;
  final double radiusMd;
  final double radiusLg;

  static const standard = PulseMetrics();

  @override
  PulseMetrics copyWith() => this;

  @override
  PulseMetrics lerp(PulseMetrics? other, double t) {
    if (other == null) return this;
    double d(double a, double b) => lerpDouble(a, b, t)!;
    return PulseMetrics(
      xs: d(xs, other.xs),
      sm: d(sm, other.sm),
      md: d(md, other.md),
      lg: d(lg, other.lg),
      xl: d(xl, other.xl),
      xxl: d(xxl, other.xxl),
      radiusSm: d(radiusSm, other.radiusSm),
      radiusMd: d(radiusMd, other.radiusMd),
      radiusLg: d(radiusLg, other.radiusLg),
    );
  }
}
