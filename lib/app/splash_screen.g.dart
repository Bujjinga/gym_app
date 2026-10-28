// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// True once the intro has finished; heavy startup work waits for it so it
/// doesn't steal the animation's frames.

@ProviderFor(IntroDone)
final introDoneProvider = IntroDoneProvider._();

/// True once the intro has finished; heavy startup work waits for it so it
/// doesn't steal the animation's frames.
final class IntroDoneProvider extends $NotifierProvider<IntroDone, bool> {
  /// True once the intro has finished; heavy startup work waits for it so it
  /// doesn't steal the animation's frames.
  IntroDoneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'introDoneProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$introDoneHash();

  @$internal
  @override
  IntroDone create() => IntroDone();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$introDoneHash() => r'27b7100a2e7b4b3c4ac774d389b7befc321de3aa';

/// True once the intro has finished; heavy startup work waits for it so it
/// doesn't steal the animation's frames.

abstract class _$IntroDone extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
