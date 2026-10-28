// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Device capabilities for widgets; tests override this to simulate any
/// platform.

@ProviderFor(platformCapabilities)
final platformCapabilitiesProvider = PlatformCapabilitiesProvider._();

/// Device capabilities for widgets; tests override this to simulate any
/// platform.

final class PlatformCapabilitiesProvider
    extends
        $FunctionalProvider<
          PlatformCapabilities,
          PlatformCapabilities,
          PlatformCapabilities
        >
    with $Provider<PlatformCapabilities> {
  /// Device capabilities for widgets; tests override this to simulate any
  /// platform.
  PlatformCapabilitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'platformCapabilitiesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$platformCapabilitiesHash();

  @$internal
  @override
  $ProviderElement<PlatformCapabilities> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlatformCapabilities create(Ref ref) {
    return platformCapabilities(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlatformCapabilities value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlatformCapabilities>(value),
    );
  }
}

String _$platformCapabilitiesHash() =>
    r'2d0ce4694b0e4af070c6c6653e9a290d4b0d2884';
