import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lock_store.g.dart';

@Riverpod(keepAlive: true)
AppLockStore appLockStore(Ref ref) => AppLockStore();

typedef LockSettings = ({bool enabled, bool biometric});

/// Wait before the next PIN try after [failures] wrong ones: free for the
/// first 4, then 30 s more for every further miss.
Duration lockoutFor(int failures) => failures < 5 ? Duration.zero : Duration(seconds: 30 * (failures - 4));

/// App-lock settings in the OS keychain/keystore. The PIN is never stored,
/// only a salted PBKDF2 hash; failed tries persist so killing the app
/// doesn't reset the lockout.
class AppLockStore {
  AppLockStore({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _pinKey = 'pulse.lock.pin';
  static const _biometricKey = 'pulse.lock.biometric';
  static const _failuresKey = 'pulse.lock.failures';

  // shortcut: a 4-digit PIN has only 10k values, so the hash only keeps it
  // out of plain sight; the keychain and the lockout are the real protection.
  static final _kdf = Pbkdf2(macAlgorithm: Hmac.sha256(), iterations: 20000, bits: 256);

  /// Disabled when the keychain can't be read (e.g. tests, broken keystore).
  Future<LockSettings> load() async {
    try {
      final pin = await _storage.read(key: _pinKey);
      return (enabled: pin != null, biometric: pin != null && await _storage.read(key: _biometricKey) == '1');
    } catch (_) {
      return (enabled: false, biometric: false);
    }
  }

  Future<void> setPin(String pin) async {
    final salt = List<int>.generate(16, (_) => Random.secure().nextInt(256));
    await _storage.write(key: _pinKey, value: 'v1:${_hex(salt)}:${_hex(await _hash(pin, salt))}');
    await _storage.delete(key: _failuresKey);
  }

  Future<bool> verify(String pin) async {
    final stored = (await _storage.read(key: _pinKey))?.split(':');
    if (stored == null || stored.length != 3) return false;
    final expected = _unhex(stored[2]);
    final actual = await _hash(pin, _unhex(stored[1]));
    var diff = expected.length ^ actual.length;
    for (var i = 0; i < min(expected.length, actual.length); i++) {
      diff |= expected[i] ^ actual[i]; // constant time
    }
    return diff == 0;
  }

  Future<void> setBiometric(bool on) => _storage.write(key: _biometricKey, value: on ? '1' : '0');

  /// Failed PIN tries so far and when the next try is allowed.
  Future<({int count, DateTime? until})> failures() async {
    final v = (await _storage.read(key: _failuresKey))?.split('|');
    if (v == null || v.length != 2) return (count: 0, until: null);
    return (count: int.tryParse(v[0]) ?? 0, until: DateTime.tryParse(v[1]));
  }

  Future<void> recordFailure() async {
    final count = (await failures()).count + 1;
    final until = DateTime.now().toUtc().add(lockoutFor(count));
    await _storage.write(key: _failuresKey, value: '$count|${until.toIso8601String()}');
  }

  Future<void> clearFailures() => _storage.delete(key: _failuresKey);

  Future<void> clear() async {
    await _storage.delete(key: _pinKey);
    await _storage.delete(key: _biometricKey);
    await _storage.delete(key: _failuresKey);
  }

  static Future<List<int>> _hash(String pin, List<int> salt) async =>
      (await _kdf.deriveKeyFromPassword(password: pin, nonce: salt)).extractBytes();

  static String _hex(List<int> b) => b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
  static List<int> _unhex(String s) =>
      [for (var i = 0; i + 1 < s.length; i += 2) int.parse(s.substring(i, i + 2), radix: 16)];
}
