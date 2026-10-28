// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_body_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bodyRepository)
final bodyRepositoryProvider = BodyRepositoryProvider._();

final class BodyRepositoryProvider
    extends $FunctionalProvider<BodyRepository, BodyRepository, BodyRepository>
    with $Provider<BodyRepository> {
  BodyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bodyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bodyRepositoryHash();

  @$internal
  @override
  $ProviderElement<BodyRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BodyRepository create(Ref ref) {
    return bodyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BodyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BodyRepository>(value),
    );
  }
}

String _$bodyRepositoryHash() => r'3bb3cd221aa5b9bb4b06812f8b0c691de34cbf25';
