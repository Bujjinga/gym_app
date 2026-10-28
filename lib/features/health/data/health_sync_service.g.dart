// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_sync_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(healthSync)
final healthSyncProvider = HealthSyncProvider._();

final class HealthSyncProvider
    extends
        $FunctionalProvider<
          HealthSyncService,
          HealthSyncService,
          HealthSyncService
        >
    with $Provider<HealthSyncService> {
  HealthSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'healthSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$healthSyncHash();

  @$internal
  @override
  $ProviderElement<HealthSyncService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HealthSyncService create(Ref ref) {
    return healthSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HealthSyncService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HealthSyncService>(value),
    );
  }
}

String _$healthSyncHash() => r'af882a91e61743c0a5af0b0c2c0365edba00ddda';
