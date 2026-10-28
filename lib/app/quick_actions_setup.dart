import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_actions/quick_actions.dart';

import '../core/platform/platform_providers.dart';
import '../features/profile/data/drift_profile_repository.dart';
import '../features/workout/application/active_workout_controller.dart';
import '../l10n/system_l10n.dart';
import 'router.dart';

/// Home screen long-press shortcuts (iOS + Android): start workout, log
/// water, start walk.
void startQuickActions(ProviderContainer container) {
  if (!container.read(platformCapabilitiesProvider).isMobile) return;
  const actions = QuickActions();
  final l10n = systemL10n();
  actions.initialize((type) => _open(container, type));
  actions.setShortcutItems([
    ShortcutItem(type: 'start_workout', localizedTitle: l10n.startWorkout),
    ShortcutItem(type: 'log_water', localizedTitle: l10n.waterLogTitle),
    ShortcutItem(type: 'start_walk', localizedTitle: l10n.startWalk),
  ]).catchError((Object e) => debugPrint('Quick actions unavailable: $e'));
}

Future<void> _open(ProviderContainer container, String type) async {
  // Cold start: wait for the profile so onboarding still comes first.
  final profile = await container.read(userProfileProvider.future);
  if (!profile.onboardingComplete) return;
  final router = container.read(routerProvider);
  if (type == 'start_workout' && container.read(activeWorkoutProvider).value == null) {
    await container.read(activeWorkoutProvider.notifier).startEmpty(name: systemL10n().workoutDefaultName);
  }
  final location = switch (type) {
    'start_workout' => const ActiveWorkoutRoute().location,
    'log_water' => const WaterRoute().location,
    'start_walk' => const LiveTrackingRoute().location,
    _ => null,
  };
  if (location == null) return;
  // From the home tab, so Back lands somewhere sensible.
  router.go(const HomeRoute().location);
  router.push<void>(location);
}
