// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Search/filter state of the library screen (reset when it closes).

@ProviderFor(ExerciseFilterController)
final exerciseFilterControllerProvider = ExerciseFilterControllerProvider._();

/// Search/filter state of the library screen (reset when it closes).
final class ExerciseFilterControllerProvider
    extends $NotifierProvider<ExerciseFilterController, ExerciseFilter> {
  /// Search/filter state of the library screen (reset when it closes).
  ExerciseFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exerciseFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exerciseFilterControllerHash();

  @$internal
  @override
  ExerciseFilterController create() => ExerciseFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExerciseFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExerciseFilter>(value),
    );
  }
}

String _$exerciseFilterControllerHash() =>
    r'93907d4e4ce5eb9f9c041b2e6cf2b30e3141df23';

/// Search/filter state of the library screen (reset when it closes).

abstract class _$ExerciseFilterController extends $Notifier<ExerciseFilter> {
  ExerciseFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ExerciseFilter, ExerciseFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExerciseFilter, ExerciseFilter>,
              ExerciseFilter,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(exerciseList)
final exerciseListProvider = ExerciseListProvider._();

final class ExerciseListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Exercise>>,
          List<Exercise>,
          Stream<List<Exercise>>
        >
    with $FutureModifier<List<Exercise>>, $StreamProvider<List<Exercise>> {
  ExerciseListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exerciseListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exerciseListHash();

  @$internal
  @override
  $StreamProviderElement<List<Exercise>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Exercise>> create(Ref ref) {
    return exerciseList(ref);
  }
}

String _$exerciseListHash() => r'b567fe4e874e522dea2cb61e5b2e630d14ecda5e';

@ProviderFor(exerciseById)
final exerciseByIdProvider = ExerciseByIdFamily._();

final class ExerciseByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Exercise?>,
          Exercise?,
          FutureOr<Exercise?>
        >
    with $FutureModifier<Exercise?>, $FutureProvider<Exercise?> {
  ExerciseByIdProvider._({
    required ExerciseByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'exerciseByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exerciseByIdHash();

  @override
  String toString() {
    return r'exerciseByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Exercise?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Exercise?> create(Ref ref) {
    final argument = this.argument as String;
    return exerciseById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exerciseByIdHash() => r'194b74f379087d914ae0ae84f11dafb182aeab2c';

final class ExerciseByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Exercise?>, String> {
  ExerciseByIdFamily._()
    : super(
        retry: null,
        name: r'exerciseByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExerciseByIdProvider call(String id) =>
      ExerciseByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'exerciseByIdProvider';
}

@ProviderFor(exerciseHistory)
final exerciseHistoryProvider = ExerciseHistoryFamily._();

final class ExerciseHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ExerciseHistoryPoint>>,
          List<ExerciseHistoryPoint>,
          FutureOr<List<ExerciseHistoryPoint>>
        >
    with
        $FutureModifier<List<ExerciseHistoryPoint>>,
        $FutureProvider<List<ExerciseHistoryPoint>> {
  ExerciseHistoryProvider._({
    required ExerciseHistoryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'exerciseHistoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exerciseHistoryHash();

  @override
  String toString() {
    return r'exerciseHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ExerciseHistoryPoint>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ExerciseHistoryPoint>> create(Ref ref) {
    final argument = this.argument as String;
    return exerciseHistory(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseHistoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exerciseHistoryHash() => r'8f3822116229edafdf5e686c6e90810ba2e78a71';

final class ExerciseHistoryFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<ExerciseHistoryPoint>>,
          String
        > {
  ExerciseHistoryFamily._()
    : super(
        retry: null,
        name: r'exerciseHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExerciseHistoryProvider call(String id) =>
      ExerciseHistoryProvider._(argument: id, from: this);

  @override
  String toString() => r'exerciseHistoryProvider';
}

@ProviderFor(exerciseRecords)
final exerciseRecordsProvider = ExerciseRecordsFamily._();

final class ExerciseRecordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PersonalRecord>>,
          List<PersonalRecord>,
          Stream<List<PersonalRecord>>
        >
    with
        $FutureModifier<List<PersonalRecord>>,
        $StreamProvider<List<PersonalRecord>> {
  ExerciseRecordsProvider._({
    required ExerciseRecordsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'exerciseRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exerciseRecordsHash();

  @override
  String toString() {
    return r'exerciseRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<PersonalRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<PersonalRecord>> create(Ref ref) {
    final argument = this.argument as String;
    return exerciseRecords(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExerciseRecordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exerciseRecordsHash() => r'e75e6bdc03f058b6b2303bb027e2b6b0ae28978d';

final class ExerciseRecordsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<PersonalRecord>>, String> {
  ExerciseRecordsFamily._()
    : super(
        retry: null,
        name: r'exerciseRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExerciseRecordsProvider call(String id) =>
      ExerciseRecordsProvider._(argument: id, from: this);

  @override
  String toString() => r'exerciseRecordsProvider';
}
