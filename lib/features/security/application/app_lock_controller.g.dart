// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_lock_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// App lock: locked at launch and after [grace] in the background, unlocked
/// with Face ID / fingerprint or the PIN.

@ProviderFor(AppLock)
final appLockProvider = AppLockProvider._();

/// App lock: locked at launch and after [grace] in the background, unlocked
/// with Face ID / fingerprint or the PIN.
final class AppLockProvider
    extends $AsyncNotifierProvider<AppLock, AppLockState> {
  /// App lock: locked at launch and after [grace] in the background, unlocked
  /// with Face ID / fingerprint or the PIN.
  AppLockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLockProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLockHash();

  @$internal
  @override
  AppLock create() => AppLock();
}

String _$appLockHash() => r'41bc48136a296e11ce9e26e6fe4f1539a9d6957b';

/// App lock: locked at launch and after [grace] in the background, unlocked
/// with Face ID / fingerprint or the PIN.

abstract class _$AppLock extends $AsyncNotifier<AppLockState> {
  FutureOr<AppLockState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AppLockState>, AppLockState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppLockState>, AppLockState>,
              AsyncValue<AppLockState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
