// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_scheduler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Reminders that should be pending right now; empty when turned off.
// shortcut: "now" is taken when an input changes (and at launch), so an app
// left open for days won't re-plan tomorrow's streak reminder; add a midnight
// timer if that matters.

@ProviderFor(plannedReminders)
final plannedRemindersProvider = PlannedRemindersProvider._();

/// Reminders that should be pending right now; empty when turned off.
// shortcut: "now" is taken when an input changes (and at launch), so an app
// left open for days won't re-plan tomorrow's streak reminder; add a midnight
// timer if that matters.

final class PlannedRemindersProvider
    extends
        $FunctionalProvider<
          List<PlannedReminder>,
          List<PlannedReminder>,
          List<PlannedReminder>
        >
    with $Provider<List<PlannedReminder>> {
  /// Reminders that should be pending right now; empty when turned off.
  // shortcut: "now" is taken when an input changes (and at launch), so an app
  // left open for days won't re-plan tomorrow's streak reminder; add a midnight
  // timer if that matters.
  PlannedRemindersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plannedRemindersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plannedRemindersHash();

  @$internal
  @override
  $ProviderElement<List<PlannedReminder>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<PlannedReminder> create(Ref ref) {
    return plannedReminders(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PlannedReminder> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PlannedReminder>>(value),
    );
  }
}

String _$plannedRemindersHash() => r'ede6ef829e6f57a7e07b376d3d2b75ce45e90aa6';
