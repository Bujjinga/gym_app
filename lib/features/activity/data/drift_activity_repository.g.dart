// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_activity_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activityRepository)
final activityRepositoryProvider = ActivityRepositoryProvider._();

final class ActivityRepositoryProvider
    extends
        $FunctionalProvider<
          ActivityRepository,
          ActivityRepository,
          ActivityRepository
        >
    with $Provider<ActivityRepository> {
  ActivityRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activityRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activityRepositoryHash();

  @$internal
  @override
  $ProviderElement<ActivityRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ActivityRepository create(Ref ref) {
    return activityRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ActivityRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ActivityRepository>(value),
    );
  }
}

String _$activityRepositoryHash() =>
    r'be9dabef40ceea525e55dc461ea1aa6e995faa54';
