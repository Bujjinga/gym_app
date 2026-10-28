// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(measurements)
final measurementsProvider = MeasurementsFamily._();

final class MeasurementsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BodyMeasurement>>,
          List<BodyMeasurement>,
          Stream<List<BodyMeasurement>>
        >
    with
        $FutureModifier<List<BodyMeasurement>>,
        $StreamProvider<List<BodyMeasurement>> {
  MeasurementsProvider._({
    required MeasurementsFamily super.from,
    required MeasurementType super.argument,
  }) : super(
         retry: null,
         name: r'measurementsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$measurementsHash();

  @override
  String toString() {
    return r'measurementsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<BodyMeasurement>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<BodyMeasurement>> create(Ref ref) {
    final argument = this.argument as MeasurementType;
    return measurements(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MeasurementsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$measurementsHash() => r'109137ac2794bf291a20bcb0cea14d7b313aa770';

final class MeasurementsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<BodyMeasurement>>,
          MeasurementType
        > {
  MeasurementsFamily._()
    : super(
        retry: null,
        name: r'measurementsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MeasurementsProvider call(MeasurementType type) =>
      MeasurementsProvider._(argument: type, from: this);

  @override
  String toString() => r'measurementsProvider';
}

@ProviderFor(waterToday)
final waterTodayProvider = WaterTodayProvider._();

final class WaterTodayProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WaterLog>>,
          List<WaterLog>,
          Stream<List<WaterLog>>
        >
    with $FutureModifier<List<WaterLog>>, $StreamProvider<List<WaterLog>> {
  WaterTodayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waterTodayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waterTodayHash();

  @$internal
  @override
  $StreamProviderElement<List<WaterLog>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<WaterLog>> create(Ref ref) {
    return waterToday(ref);
  }
}

String _$waterTodayHash() => r'0b5e6c84b9f1af6f2c5afc56958e42464a5a86cf';

@ProviderFor(mealsToday)
final mealsTodayProvider = MealsTodayProvider._();

final class MealsTodayProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MealEntry>>,
          List<MealEntry>,
          Stream<List<MealEntry>>
        >
    with $FutureModifier<List<MealEntry>>, $StreamProvider<List<MealEntry>> {
  MealsTodayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealsTodayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealsTodayHash();

  @$internal
  @override
  $StreamProviderElement<List<MealEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<MealEntry>> create(Ref ref) {
    return mealsToday(ref);
  }
}

String _$mealsTodayHash() => r'89ffecace9db13fa3f1e016ec885327128a7be35';

@ProviderFor(progressPhotos)
final progressPhotosProvider = ProgressPhotosProvider._();

final class ProgressPhotosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProgressPhoto>>,
          List<ProgressPhoto>,
          Stream<List<ProgressPhoto>>
        >
    with
        $FutureModifier<List<ProgressPhoto>>,
        $StreamProvider<List<ProgressPhoto>> {
  ProgressPhotosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressPhotosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressPhotosHash();

  @$internal
  @override
  $StreamProviderElement<List<ProgressPhoto>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ProgressPhoto>> create(Ref ref) {
    return progressPhotos(ref);
  }
}

String _$progressPhotosHash() => r'9a83ad88d6c234a624594f2f8022215f2fa522db';

/// Most recent day in the last week with any health metric (Health card).

@ProviderFor(latestHealthDay)
final latestHealthDayProvider = LatestHealthDayProvider._();

/// Most recent day in the last week with any health metric (Health card).

final class LatestHealthDayProvider
    extends
        $FunctionalProvider<
          AsyncValue<DayActivity?>,
          DayActivity?,
          Stream<DayActivity?>
        >
    with $FutureModifier<DayActivity?>, $StreamProvider<DayActivity?> {
  /// Most recent day in the last week with any health metric (Health card).
  LatestHealthDayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'latestHealthDayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$latestHealthDayHash();

  @$internal
  @override
  $StreamProviderElement<DayActivity?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<DayActivity?> create(Ref ref) {
    return latestHealthDay(ref);
  }
}

String _$latestHealthDayHash() => r'9f0e526e4a002bbad4c11a54a9b3ecb7de116d9b';
