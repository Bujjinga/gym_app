import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

import 'platform_capabilities.dart';

/// Haptic vocabulary for PULSE. Every call is a no-op on desktop, or when the
/// user has turned haptics off in settings.
abstract final class Haptics {
  /// Mirrors the user's setting; wired to settings in a later phase.
  static bool enabled = true;

  static bool get _on => enabled && PlatformCapabilities.current().hasHaptics;

  /// Light tap for button presses.
  static Future<void> tap() async {
    if (_on) await HapticFeedback.lightImpact();
  }

  /// Detent click (swipe thresholds, picker steps).
  static Future<void> selection() async {
    if (_on) await HapticFeedback.selectionClick();
  }

  /// Countdown tick (last 3 seconds of the rest timer).
  static Future<void> tick() async {
    if (_on) await HapticFeedback.mediumImpact();
  }

  /// Set complete, goal reached, PR, timer end.
  static Future<void> success() async {
    if (!_on) return;
    if (PlatformCapabilities.current().isAndroid && await Vibration.hasCustomVibrationsSupport()) {
      await Vibration.vibrate(pattern: [0, 25, 70, 45], intensities: [0, 160, 0, 255]);
    } else {
      await HapticFeedback.mediumImpact();
      await Future<void>.delayed(const Duration(milliseconds: 90));
      await HapticFeedback.heavyImpact();
    }
  }

  /// Heavy single thump (splash heartbeat).
  static Future<void> thump() async {
    if (_on) await HapticFeedback.heavyImpact();
  }

  static Future<void> warning() async {
    if (_on) await HapticFeedback.heavyImpact();
  }
}
