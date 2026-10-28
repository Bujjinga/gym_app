// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_plan_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(planRepository)
final planRepositoryProvider = PlanRepositoryProvider._();

final class PlanRepositoryProvider
    extends $FunctionalProvider<PlanRepository, PlanRepository, PlanRepository>
    with $Provider<PlanRepository> {
  PlanRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planRepositoryHash();

  @$internal
  @override
  $ProviderElement<PlanRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlanRepository create(Ref ref) {
    return planRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlanRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlanRepository>(value),
    );
  }
}

String _$planRepositoryHash() => r'76b2bc11bdd4e75648a6199305d5e2e1bf97d7b6';
