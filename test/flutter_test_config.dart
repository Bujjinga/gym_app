import 'dart:async';

import 'package:gym_app/core/design_system/theme/pulse_typography.dart';
import 'package:gym_app/core/platform/haptics.dart';

/// Runs before every test file: keep tests offline (no Google Fonts fetch).
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  PulseTypography.useGoogleFonts = false;
  Haptics.enabled = false; // no vibration plugin under flutter test
  await testMain();
}
