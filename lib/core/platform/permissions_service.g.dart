// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(permissionsService)
final permissionsServiceProvider = PermissionsServiceProvider._();

final class PermissionsServiceProvider
    extends
        $FunctionalProvider<
          PermissionsService,
          PermissionsService,
          PermissionsService
        >
    with $Provider<PermissionsService> {
  PermissionsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionsServiceHash();

  @$internal
  @override
  $ProviderElement<PermissionsService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PermissionsService create(Ref ref) {
    return permissionsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionsService>(value),
    );
  }
}

String _$permissionsServiceHash() =>
    r'acc545daee92e1f0854b91af41bffdb9fb82b8aa';
