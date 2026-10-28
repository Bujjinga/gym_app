// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_workout_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The workout in progress (null when none). Live sessions are saved to the
/// database continuously, so they survive backgrounding and app restarts.

@ProviderFor(ActiveWorkout)
final activeWorkoutProvider = ActiveWorkoutProvider._();

/// The workout in progress (null when none). Live sessions are saved to the
/// database continuously, so they survive backgrounding and app restarts.
final class ActiveWorkoutProvider
    extends $AsyncNotifierProvider<ActiveWorkout, ActiveWorkoutState?> {
  /// The workout in progress (null when none). Live sessions are saved to the
  /// database continuously, so they survive backgrounding and app restarts.
  ActiveWorkoutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeWorkoutProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeWorkoutHash();

  @$internal
  @override
  ActiveWorkout create() => ActiveWorkout();
}

String _$activeWorkoutHash() => r'47654eac3d3e649ae3814376df0da8c532a22d6a';

/// The workout in progress (null when none). Live sessions are saved to the
/// database continuously, so they survive backgrounding and app restarts.

abstract class _$ActiveWorkout extends $AsyncNotifier<ActiveWorkoutState?> {
  FutureOr<ActiveWorkoutState?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ActiveWorkoutState?>, ActiveWorkoutState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ActiveWorkoutState?>, ActiveWorkoutState?>,
              AsyncValue<ActiveWorkoutState?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
