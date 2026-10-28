import 'package:flutter/foundation.dart';

/// iOS App Group shared by the Runner and the PulseWidgets extension
/// (home widgets + Live Activity data). Must match both targets' entitlements.
const pulseAppGroup = 'group.com.example.gymApp.pulse';

/// What the current device can do. Features check these flags and hide
/// themselves instead of showing buttons that can't work.
@immutable
class PlatformCapabilities {
  const PlatformCapabilities(this.platform, {this.isWeb = false});

  /// Reads the running platform (respects `debugDefaultTargetPlatformOverride`).
  factory PlatformCapabilities.current() =>
      PlatformCapabilities(defaultTargetPlatform, isWeb: kIsWeb);

  final TargetPlatform platform;
  final bool isWeb;

  bool get isIOS => !isWeb && platform == TargetPlatform.iOS;
  bool get isAndroid => !isWeb && platform == TargetPlatform.android;
  bool get isMacOS => !isWeb && platform == TargetPlatform.macOS;
  bool get isWindows => !isWeb && platform == TargetPlatform.windows;
  bool get isMobile => isIOS || isAndroid;
  bool get isDesktop => isMacOS || isWindows || (!isWeb && platform == TargetPlatform.linux);

  bool get hasHaptics => isMobile;
  bool get hasStepCounter => isMobile;
  bool get hasGpsTracking => isMobile;
  bool get hasHealthData => isMobile;
  bool get hasHomeWidgets => isMobile;
  bool get hasLiveActivities => isIOS;
  bool get hasWindowControls => isDesktop;

  /// Live workout mode (rest timer, Live Activity). Desktop only logs
  /// finished workouts after the fact — nobody trains in front of a laptop.
  bool get hasLiveWorkout => isMobile;

  /// Cmd on macOS, Ctrl elsewhere — used to build keyboard shortcuts.
  bool get usesMetaForShortcuts => platform == TargetPlatform.macOS || platform == TargetPlatform.iOS;
}
