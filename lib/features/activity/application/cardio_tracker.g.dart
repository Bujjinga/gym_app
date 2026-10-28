// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardio_tracker.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Live GPS (outdoor) or step-based (indoor) cardio tracking. Phones only.

@ProviderFor(CardioTracker)
final cardioTrackerProvider = CardioTrackerProvider._();

/// Live GPS (outdoor) or step-based (indoor) cardio tracking. Phones only.
final class CardioTrackerProvider
    extends $NotifierProvider<CardioTracker, TrackingState?> {
  /// Live GPS (outdoor) or step-based (indoor) cardio tracking. Phones only.
  CardioTrackerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardioTrackerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardioTrackerHash();

  @$internal
  @override
  CardioTracker create() => CardioTracker();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackingState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackingState?>(value),
    );
  }
}

String _$cardioTrackerHash() => r'80a9444dfefd939930696d4fef2338f491c247af';

/// Live GPS (outdoor) or step-based (indoor) cardio tracking. Phones only.

abstract class _$CardioTracker extends $Notifier<TrackingState?> {
  TrackingState? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TrackingState?, TrackingState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TrackingState?, TrackingState?>,
              TrackingState?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
