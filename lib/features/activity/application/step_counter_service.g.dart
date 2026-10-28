// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_counter_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stepCounter)
final stepCounterProvider = StepCounterProvider._();

final class StepCounterProvider
    extends
        $FunctionalProvider<
          StepCounterService,
          StepCounterService,
          StepCounterService
        >
    with $Provider<StepCounterService> {
  StepCounterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stepCounterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stepCounterHash();

  @$internal
  @override
  $ProviderElement<StepCounterService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StepCounterService create(Ref ref) {
    return stepCounter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StepCounterService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StepCounterService>(value),
    );
  }
}

String _$stepCounterHash() => r'219a38dca1c3d3f6c9b305f3da205e784cb5b32c';
