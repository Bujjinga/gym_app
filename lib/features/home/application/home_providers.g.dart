// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(todayActivity)
final todayActivityProvider = TodayActivityProvider._();

final class TodayActivityProvider
    extends
        $FunctionalProvider<
          AsyncValue<DayActivity>,
          DayActivity,
          Stream<DayActivity>
        >
    with $FutureModifier<DayActivity>, $StreamProvider<DayActivity> {
  TodayActivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayActivityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayActivityHash();

  @$internal
  @override
  $StreamProviderElement<DayActivity> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<DayActivity> create(Ref ref) {
    return todayActivity(ref);
  }
}

String _$todayActivityHash() => r'0038928c44aac9678842eb88e92408278f2b407a';

/// The last 7 days (oldest first), with empty days filled in.

@ProviderFor(weekActivity)
final weekActivityProvider = WeekActivityProvider._();

/// The last 7 days (oldest first), with empty days filled in.

final class WeekActivityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DayActivity>>,
          List<DayActivity>,
          Stream<List<DayActivity>>
        >
    with
        $FutureModifier<List<DayActivity>>,
        $StreamProvider<List<DayActivity>> {
  /// The last 7 days (oldest first), with empty days filled in.
  WeekActivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weekActivityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weekActivityHash();

  @$internal
  @override
  $StreamProviderElement<List<DayActivity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<DayActivity>> create(Ref ref) {
    return weekActivity(ref);
  }
}

String _$weekActivityHash() => r'3dcc766c1e399ecc17593b800c80d885a99e5610';

/// Minutes of finished workouts today (feeds the Exercise ring).

@ProviderFor(todayWorkoutMinutes)
final todayWorkoutMinutesProvider = TodayWorkoutMinutesProvider._();

/// Minutes of finished workouts today (feeds the Exercise ring).

final class TodayWorkoutMinutesProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// Minutes of finished workouts today (feeds the Exercise ring).
  TodayWorkoutMinutesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayWorkoutMinutesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayWorkoutMinutesHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return todayWorkoutMinutes(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$todayWorkoutMinutesHash() =>
    r'4e5338d45535b92244a736b375777096b2d86178';

@ProviderFor(cardioHistory)
final cardioHistoryProvider = CardioHistoryProvider._();

final class CardioHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CardioSession>>,
          List<CardioSession>,
          Stream<List<CardioSession>>
        >
    with
        $FutureModifier<List<CardioSession>>,
        $StreamProvider<List<CardioSession>> {
  CardioHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardioHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardioHistoryHash();

  @$internal
  @override
  $StreamProviderElement<List<CardioSession>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CardioSession>> create(Ref ref) {
    return cardioHistory(ref);
  }
}

String _$cardioHistoryHash() => r'3101b8315eb0c30c712ddf6df0a8af97eb68f683';

/// Consecutive days with a finished workout or a cardio session.

@ProviderFor(trainingStreak)
final trainingStreakProvider = TrainingStreakProvider._();

/// Consecutive days with a finished workout or a cardio session.

final class TrainingStreakProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// Consecutive days with a finished workout or a cardio session.
  TrainingStreakProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trainingStreakProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trainingStreakHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return trainingStreak(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$trainingStreakHash() => r'639f883a269f8b0c055ac51d3b429d0e6b718f33';

@ProviderFor(recentRecords)
final recentRecordsProvider = RecentRecordsProvider._();

final class RecentRecordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PersonalRecord>>,
          List<PersonalRecord>,
          Stream<List<PersonalRecord>>
        >
    with
        $FutureModifier<List<PersonalRecord>>,
        $StreamProvider<List<PersonalRecord>> {
  RecentRecordsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentRecordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentRecordsHash();

  @$internal
  @override
  $StreamProviderElement<List<PersonalRecord>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<PersonalRecord>> create(Ref ref) {
    return recentRecords(ref);
  }
}

String _$recentRecordsHash() => r'ae8652102771b10e229fa562e4ee0baadac77836';

@ProviderFor(dashboardLayout)
final dashboardLayoutProvider = DashboardLayoutProvider._();

final class DashboardLayoutProvider
    extends
        $FunctionalProvider<DashboardLayout, DashboardLayout, DashboardLayout>
    with $Provider<DashboardLayout> {
  DashboardLayoutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardLayoutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardLayoutHash();

  @$internal
  @override
  $ProviderElement<DashboardLayout> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DashboardLayout create(Ref ref) {
    return dashboardLayout(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardLayout value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardLayout>(value),
    );
  }
}

String _$dashboardLayoutHash() => r'5ddac9e78e407a3b15d48c7f866bf0fe2cf4cd9f';
