import 'package:flutter/material.dart';

import 'pulse_colors.dart';
import 'pulse_metrics.dart';
import 'pulse_motion.dart';
import 'pulse_shadows.dart';

export 'pulse_colors.dart';
export 'pulse_metrics.dart';
export 'pulse_motion.dart';
export 'pulse_shadows.dart';

/// Short accessors for design tokens: `context.colors.accentStart`, etc.
extension PulseTokensX on BuildContext {
  PulseColors get colors => Theme.of(this).extension<PulseColors>()!;
  PulseMetrics get metrics => Theme.of(this).extension<PulseMetrics>()!;
  PulseShadows get shadows => Theme.of(this).extension<PulseShadows>()!;
  bool get reduceMotion => MediaQuery.maybeDisableAnimationsOf(this) ?? false;
  PulseMotion get motion => PulseMotion(reduced: reduceMotion);
}
