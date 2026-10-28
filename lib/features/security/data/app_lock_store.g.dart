// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_lock_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appLockStore)
final appLockStoreProvider = AppLockStoreProvider._();

final class AppLockStoreProvider
    extends $FunctionalProvider<AppLockStore, AppLockStore, AppLockStore>
    with $Provider<AppLockStore> {
  AppLockStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLockStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLockStoreHash();

  @$internal
  @override
  $ProviderElement<AppLockStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppLockStore create(Ref ref) {
    return appLockStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLockStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLockStore>(value),
    );
  }
}

String _$appLockStoreHash() => r'11e807cbdc3ae9bd354aea3956b9c8d0ae22f5f4';
