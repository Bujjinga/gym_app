import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/platform/platform_providers.dart';
import '../../home/application/home_providers.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../data/drift_activity_repository.dart';
import '../domain/day_activity.dart';

part 'step_counter_service.g.dart';

@Riverpod(keepAlive: true)
StepCounterService stepCounter(Ref ref) {
  final service = StepCounterService(ref);
  ref.onDispose(service.stop);
  return service;
}

/// All-day step counting from the phone's motion sensor into today's
/// `daily_activity` row. The OS counter is cumulative (since boot), so a
/// per-day baseline turns it into "steps today"; reboots and midnight reset
/// the baseline.
class StepCounterService {
  StepCounterService(this._ref);

  final Ref _ref;
  StreamSubscription<StepCount>? _sub;
  DayActivity? _today;
  int? _baseline;
  int _lastSaved = -1;
  DateTime _lastSaveAt = DateTime(0);

  /// Starts only on phones and only when motion access is already granted,
  /// so the system prompt never appears before onboarding explains it.
  Future<void> start() async {
    final caps = _ref.read(platformCapabilitiesProvider);
    if (_sub != null || !caps.hasStepCounter) return;
    final permission = caps.isAndroid ? Permission.activityRecognition : Permission.sensors;
    if (!await permission.isGranted) return;
    _sub = Pedometer.stepCountStream.listen(_onCount, onError: (Object _) => stop());
  }

  void stop() {
    _sub?.cancel();
    _sub = null;
  }

  Future<void> _onCount(StepCount event) async {
    final now = DateTime.now();
    final key = DayActivity.keyFor(now);
    if (_today?.day != key) {
      final rows = await _ref.read(activityRepositoryProvider).watchDays(now, now).first;
      _today = rows.firstOrNull ?? DayActivity(day: key);
      _baseline = event.steps - _today!.steps;
      // New day: refresh Home's "today" streams.
      _ref
        ..invalidate(todayActivityProvider)
        ..invalidate(weekActivityProvider);
    }
    var steps = event.steps - _baseline!;
    if (steps < _today!.steps) {
      // Counter went backwards (reboot): keep today's total and rebase.
      _baseline = event.steps - _today!.steps;
      steps = _today!.steps;
    }
    // Throttle writes: every 50 steps or 30 s.
    if (steps - _lastSaved < 50 && now.difference(_lastSaveAt) < const Duration(seconds: 30)) return;
    _lastSaved = steps;
    _lastSaveAt = now;
    final heightCm = (await _ref.read(profileRepositoryProvider).get()).heightCm;
    _today = _today!.copyWith(steps: steps, distanceM: steps * strideMeters(heightCm));
    await _ref.read(activityRepositoryProvider).saveDay(_today!);
  }

  /// Walking stride ≈ 41.5% of height; 0.75 m when height is unknown.
  static double strideMeters(double? heightCm) => heightCm == null ? 0.75 : heightCm * 0.00415;
}
