// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_vault.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(photoVault)
final photoVaultProvider = PhotoVaultProvider._();

final class PhotoVaultProvider
    extends $FunctionalProvider<PhotoVault, PhotoVault, PhotoVault>
    with $Provider<PhotoVault> {
  PhotoVaultProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photoVaultProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photoVaultHash();

  @$internal
  @override
  $ProviderElement<PhotoVault> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PhotoVault create(Ref ref) {
    return photoVault(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotoVault value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotoVault>(value),
    );
  }
}

String _$photoVaultHash() => r'c6a8b94dfa92d5b388c629913d206ebe9ede803e';
