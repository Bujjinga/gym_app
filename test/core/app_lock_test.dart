import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/features/security/data/app_lock_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('lockout: free for 4 misses, then 30 s more per miss', () {
    expect(lockoutFor(4), Duration.zero);
    expect(lockoutFor(5), const Duration(seconds: 30));
    expect(lockoutFor(7), const Duration(seconds: 90));
  });

  group('AppLockStore', () {
    late AppLockStore store;
    setUp(() {
      FlutterSecureStorage.setMockInitialValues({});
      store = AppLockStore();
    });

    test('stores only a hash and verifies the PIN', () async {
      expect((await store.load()).enabled, isFalse);
      await store.setPin('1234');
      await store.setBiometric(true);
      final raw = await const FlutterSecureStorage().readAll();
      expect(raw.values.any((v) => v.contains('1234')), isFalse);
      expect(await store.verify('1234'), isTrue);
      expect(await store.verify('4321'), isFalse);
      expect(await store.load(), (enabled: true, biometric: true));
    });

    test('failed tries persist, set a lockout and reset on a new PIN', () async {
      await store.setPin('1234');
      for (var i = 0; i < 5; i++) {
        await store.recordFailure();
      }
      final f = await AppLockStore().failures(); // a fresh instance, as after an app restart
      expect(f.count, 5);
      expect(f.until!.isAfter(DateTime.now().toUtc()), isTrue);
      await store.setPin('5678');
      expect((await store.failures()).count, 0);
    });

    test('clear turns the lock off', () async {
      await store.setPin('1234');
      await store.clear();
      expect(await store.load(), (enabled: false, biometric: false));
    });
  });
}
