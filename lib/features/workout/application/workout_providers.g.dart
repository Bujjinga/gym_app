// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Finished and in-progress session headers, newest first.

@ProviderFor(workoutHistory)
final workoutHistoryProvider = WorkoutHistoryProvider._();

/// Finished and in-progress session headers, newest first.

final class WorkoutHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WorkoutSession>>,
          List<WorkoutSession>,
          Stream<List<WorkoutSession>>
        >
    with
        $FutureModifier<List<WorkoutSession>>,
        $StreamProvider<List<WorkoutSession>> {
  /// Finished and in-progress session headers, newest first.
  WorkoutHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutHistoryHash();

  @$internal
  @override
  $StreamProviderElement<List<WorkoutSession>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<WorkoutSession>> create(Ref ref) {
    return workoutHistory(ref);
  }
}

String _$workoutHistoryHash() => r'dfc9d8e65f8f4ecfbcfcaae0fb638a7cbb953f15';

@ProviderFor(workoutTemplates)
final workoutTemplatesProvider = WorkoutTemplatesProvider._();

final class WorkoutTemplatesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WorkoutTemplate>>,
          List<WorkoutTemplate>,
          Stream<List<WorkoutTemplate>>
        >
    with
        $FutureModifier<List<WorkoutTemplate>>,
        $StreamProvider<List<WorkoutTemplate>> {
  WorkoutTemplatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutTemplatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutTemplatesHash();

  @$internal
  @override
  $StreamProviderElement<List<WorkoutTemplate>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<WorkoutTemplate>> create(Ref ref) {
    return workoutTemplates(ref);
  }
}

String _$workoutTemplatesHash() => r'bbecd76e8c836a853b464d27fc282b42fd7c3efd';

@ProviderFor(workoutSession)
final workoutSessionProvider = WorkoutSessionFamily._();

final class WorkoutSessionProvider
    extends
        $FunctionalProvider<
          AsyncValue<WorkoutSession?>,
          WorkoutSession?,
          FutureOr<WorkoutSession?>
        >
    with $FutureModifier<WorkoutSession?>, $FutureProvider<WorkoutSession?> {
  WorkoutSessionProvider._({
    required WorkoutSessionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'workoutSessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$workoutSessionHash();

  @override
  String toString() {
    return r'workoutSessionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<WorkoutSession?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WorkoutSession?> create(Ref ref) {
    final argument = this.argument as String;
    return workoutSession(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutSessionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$workoutSessionHash() => r'81bf484ce4a016845e7d86c72786536a13db64a0';

final class WorkoutSessionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WorkoutSession?>, String> {
  WorkoutSessionFamily._()
    : super(
        retry: null,
        name: r'workoutSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WorkoutSessionProvider call(String id) =>
      WorkoutSessionProvider._(argument: id, from: this);

  @override
  String toString() => r'workoutSessionProvider';
}

@ProviderFor(sessionRecords)
final sessionRecordsProvider = SessionRecordsFamily._();

final class SessionRecordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PersonalRecord>>,
          List<PersonalRecord>,
          Stream<List<PersonalRecord>>
        >
    with
        $FutureModifier<List<PersonalRecord>>,
        $StreamProvider<List<PersonalRecord>> {
  SessionRecordsProvider._({
    required SessionRecordsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionRecordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionRecordsHash();

  @override
  String toString() {
    return r'sessionRecordsProvider'
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
    return sessionRecords(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionRecordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionRecordsHash() => r'8353d176fa6c0d5b11f5f7b51754c5fdc6770915';

final class SessionRecordsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<PersonalRecord>>, String> {
  SessionRecordsFamily._()
    : super(
        retry: null,
        name: r'sessionRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionRecordsProvider call(String sessionId) =>
      SessionRecordsProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionRecordsProvider';
}

/// Exercise details for a set of ids (comma-joined key keeps the family stable).

@ProviderFor(exercisesByIds)
final exercisesByIdsProvider = ExercisesByIdsFamily._();

/// Exercise details for a set of ids (comma-joined key keeps the family stable).

final class ExercisesByIdsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, Exercise>>,
          Map<String, Exercise>,
          FutureOr<Map<String, Exercise>>
        >
    with
        $FutureModifier<Map<String, Exercise>>,
        $FutureProvider<Map<String, Exercise>> {
  /// Exercise details for a set of ids (comma-joined key keeps the family stable).
  ExercisesByIdsProvider._({
    required ExercisesByIdsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'exercisesByIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exercisesByIdsHash();

  @override
  String toString() {
    return r'exercisesByIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, Exercise>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, Exercise>> create(Ref ref) {
    final argument = this.argument as String;
    return exercisesByIds(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExercisesByIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exercisesByIdsHash() => r'6eae1e25f79148c14d837b0383c5a795d749c323';

/// Exercise details for a set of ids (comma-joined key keeps the family stable).

final class ExercisesByIdsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<String, Exercise>>, String> {
  ExercisesByIdsFamily._()
    : super(
        retry: null,
        name: r'exercisesByIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Exercise details for a set of ids (comma-joined key keeps the family stable).

  ExercisesByIdsProvider call(String joinedIds) =>
      ExercisesByIdsProvider._(argument: joinedIds, from: this);

  @override
  String toString() => r'exercisesByIdsProvider';
}
