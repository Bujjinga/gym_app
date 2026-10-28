// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(planList)
final planListProvider = PlanListProvider._();

final class PlanListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Plan>>,
          List<Plan>,
          Stream<List<Plan>>
        >
    with $FutureModifier<List<Plan>>, $StreamProvider<List<Plan>> {
  PlanListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planListHash();

  @$internal
  @override
  $StreamProviderElement<List<Plan>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Plan>> create(Ref ref) {
    return planList(ref);
  }
}

String _$planListHash() => r'e3a1020c213b26e32521cbdf940bc07f89e43562';

@ProviderFor(planById)
final planByIdProvider = PlanByIdFamily._();

final class PlanByIdProvider
    extends $FunctionalProvider<AsyncValue<Plan?>, Plan?, FutureOr<Plan?>>
    with $FutureModifier<Plan?>, $FutureProvider<Plan?> {
  PlanByIdProvider._({
    required PlanByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'planByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$planByIdHash();

  @override
  String toString() {
    return r'planByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Plan?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Plan?> create(Ref ref) {
    final argument = this.argument as String;
    return planById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PlanByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$planByIdHash() => r'b13454ee516c964a89841a7b5b13f7c50a0154b9';

final class PlanByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Plan?>, String> {
  PlanByIdFamily._()
    : super(
        retry: null,
        name: r'planByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PlanByIdProvider call(String id) =>
      PlanByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'planByIdProvider';
}

/// The active plan with its days, or null.

@ProviderFor(activePlan)
final activePlanProvider = ActivePlanProvider._();

/// The active plan with its days, or null.

final class ActivePlanProvider
    extends $FunctionalProvider<AsyncValue<Plan?>, Plan?, FutureOr<Plan?>>
    with $FutureModifier<Plan?>, $FutureProvider<Plan?> {
  /// The active plan with its days, or null.
  ActivePlanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activePlanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activePlanHash();

  @$internal
  @override
  $FutureProviderElement<Plan?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Plan?> create(Ref ref) {
    return activePlan(ref);
  }
}

String _$activePlanHash() => r'2cbf2ab71b20376220907e4dc4a626517e4a3e96';

/// What to train next from the active plan (refreshes as workouts finish).

@ProviderFor(nextWorkout)
final nextWorkoutProvider = NextWorkoutProvider._();

/// What to train next from the active plan (refreshes as workouts finish).

final class NextWorkoutProvider
    extends
        $FunctionalProvider<
          AsyncValue<({PlanDay day, bool isToday, Plan plan})?>,
          ({PlanDay day, bool isToday, Plan plan})?,
          FutureOr<({PlanDay day, bool isToday, Plan plan})?>
        >
    with
        $FutureModifier<({PlanDay day, bool isToday, Plan plan})?>,
        $FutureProvider<({PlanDay day, bool isToday, Plan plan})?> {
  /// What to train next from the active plan (refreshes as workouts finish).
  NextWorkoutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nextWorkoutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nextWorkoutHash();

  @$internal
  @override
  $FutureProviderElement<({PlanDay day, bool isToday, Plan plan})?>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<({PlanDay day, bool isToday, Plan plan})?> create(Ref ref) {
    return nextWorkout(ref);
  }
}

String _$nextWorkoutHash() => r'ebbc87c713b4a7f4ef9e855d70c330a261ebffea';
