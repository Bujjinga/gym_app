import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/app_lock_store.dart';

part 'app_lock_controller.g.dart';

typedef AppLockState = ({bool enabled, bool biometric, bool locked});

/// Outcome of a PIN attempt; [wait] is set while locked out.
typedef PinResult = ({bool ok, Duration? wait});

/// App lock: locked at launch and after [grace] in the background, unlocked
/// with Face ID / fingerprint or the PIN.
@Riverpod(keepAlive: true)
class AppLock extends _$AppLock {
  static const grace = Duration(seconds: 30);
  final _auth = LocalAuthentication();
  DateTime? _hiddenAt;

  AppLockStore get _store => ref.read(appLockStoreProvider);

  @override
  Future<AppLockState> build() async {
    final lifecycle = AppLifecycleListener(onHide: () => _hiddenAt = DateTime.now(), onShow: _relockIfAway);
    ref.onDispose(lifecycle.dispose);
    final s = await _store.load();
    return (enabled: s.enabled, biometric: s.biometric, locked: s.enabled);
  }

  void _relockIfAway() {
    final s = state.value;
    final away = _hiddenAt == null ? Duration.zero : DateTime.now().difference(_hiddenAt!);
    if (s != null && s.enabled && away >= grace) state = AsyncData((enabled: true, biometric: s.biometric, locked: true));
  }

  void _unlock() {
    final s = state.value;
    if (s != null) state = AsyncData((enabled: s.enabled, biometric: s.biometric, locked: false));
  }

  /// Whether this device can use Face ID / Touch ID / fingerprint.
  Future<bool> biometricsAvailable() async {
    try {
      return await _auth.canCheckBiometrics && (await _auth.getAvailableBiometrics()).isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Shows the system biometric prompt; true when it succeeded.
  Future<bool> authenticateBiometric(String reason) async {
    try {
      return await _auth.authenticate(localizedReason: reason, biometricOnly: true);
    } catch (_) {
      return false; // cancelled, not enrolled, or locked out by the OS: fall back to the PIN
    }
  }

  Future<bool> unlockWithBiometric(String reason) async {
    final ok = await authenticateBiometric(reason);
    if (ok) {
      await _store.clearFailures();
      _unlock();
    }
    return ok;
  }

  /// Checks [pin] (honouring the lockout) without unlocking.
  Future<PinResult> checkPin(String pin) async {
    final f = await _store.failures();
    final now = DateTime.now().toUtc();
    if (f.until != null && f.until!.isAfter(now)) return (ok: false, wait: f.until!.difference(now));
    if (await _store.verify(pin)) {
      await _store.clearFailures();
      return (ok: true, wait: null);
    }
    await _store.recordFailure();
    final wait = lockoutFor(f.count + 1);
    return (ok: false, wait: wait == Duration.zero ? null : wait);
  }

  Future<PinResult> unlockWithPin(String pin) async {
    final r = await checkPin(pin);
    if (r.ok) _unlock();
    return r;
  }

  Future<void> enable(String pin, {required bool biometric}) async {
    await _store.setPin(pin);
    await _store.setBiometric(biometric);
    state = AsyncData((enabled: true, biometric: biometric, locked: false));
  }

  Future<void> setBiometric(bool on) async {
    final s = state.value;
    if (s == null || !s.enabled) return;
    await _store.setBiometric(on);
    state = AsyncData((enabled: true, biometric: on, locked: s.locked));
  }

  Future<void> disable() async {
    await _store.clear();
    state = const AsyncData((enabled: false, biometric: false, locked: false));
  }
}
