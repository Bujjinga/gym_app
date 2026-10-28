// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Swap this for an AI-backed [CoachService] to change the coach app-wide.

@ProviderFor(coachService)
final coachServiceProvider = CoachServiceProvider._();

/// Swap this for an AI-backed [CoachService] to change the coach app-wide.

final class CoachServiceProvider
    extends $FunctionalProvider<CoachService, CoachService, CoachService>
    with $Provider<CoachService> {
  /// Swap this for an AI-backed [CoachService] to change the coach app-wide.
  CoachServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coachServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coachServiceHash();

  @$internal
  @override
  $ProviderElement<CoachService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoachService create(Ref ref) {
    return coachService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoachService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoachService>(value),
    );
  }
}

String _$coachServiceHash() => r'f57407afbbaf6723dfa1d0580a0626580c4386b3';

/// The last 28 days of activity rows, oldest first.

@ProviderFor(recentDays)
final recentDaysProvider = RecentDaysProvider._();

/// The last 28 days of activity rows, oldest first.

final class RecentDaysProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DayActivity>>,
          List<DayActivity>,
          Stream<List<DayActivity>>
        >
    with
        $FutureModifier<List<DayActivity>>,
        $StreamProvider<List<DayActivity>> {
  /// The last 28 days of activity rows, oldest first.
  RecentDaysProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentDaysProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentDaysHash();

  @$internal
  @override
  $StreamProviderElement<List<DayActivity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<DayActivity>> create(Ref ref) {
    return recentDays(ref);
  }
}

String _$recentDaysHash() => r'9db22f8af66f1f236c3ce8ae1225345598f9d817';

/// Today's recovery score, readiness and tips.

@ProviderFor(coachReport)
final coachReportProvider = CoachReportProvider._();

/// Today's recovery score, readiness and tips.

final class CoachReportProvider
    extends
        $FunctionalProvider<
          AsyncValue<CoachReport>,
          CoachReport,
          FutureOr<CoachReport>
        >
    with $FutureModifier<CoachReport>, $FutureProvider<CoachReport> {
  /// Today's recovery score, readiness and tips.
  CoachReportProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coachReportProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coachReportHash();

  @$internal
  @override
  $FutureProviderElement<CoachReport> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CoachReport> create(Ref ref) {
    return coachReport(ref);
  }
}

String _$coachReportHash() => r'56f3d23031558815edc76bedcf2c4d254c610491';
