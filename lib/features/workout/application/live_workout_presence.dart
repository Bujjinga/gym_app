import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_activities/live_activities.dart';

import '../../../core/platform/platform_capabilities.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../l10n/system_l10n.dart';
import '../../reminders/data/notification_service.dart';
import 'active_workout_controller.dart';
import 'active_workout_state.dart';

/// What the lock screen shows; records compare by value, so unchanged
/// snapshots are skipped.
typedef _Snapshot = ({String id, String name, String exercise, int done, int total, DateTime startedAt, DateTime? restEndsAt});

_Snapshot? _snapshot(ActiveWorkoutState? s) {
  if (s == null || s.manual) return null;
  final entries = s.session.entries;
  final sets = [for (final e in entries) ...e.sets];
  final current = entries.where((e) => e.sets.any((x) => x.completedAt == null)).firstOrNull ?? entries.lastOrNull;
  return (
    id: s.session.id,
    name: s.session.name,
    exercise: current == null ? '' : s.exercises[current.exerciseId]?.name ?? '',
    done: sets.where((x) => x.completedAt != null).length,
    total: sets.length,
    startedAt: s.session.startedAt,
    restEndsAt: s.restEndsAt,
  );
}

/// Mirrors the live workout outside the app: a Live Activity (lock screen +
/// Dynamic Island) on iOS, an ongoing notification on Android. Desktop has no
/// live workouts, so this does nothing there.
void startLiveWorkoutPresence(ProviderContainer container) {
  final caps = container.read(platformCapabilitiesProvider);
  if (!caps.hasLiveWorkout) return;
  final notifications = container.read(notificationServiceProvider);
  final liveActivities = caps.hasLiveActivities ? LiveActivities() : null;
  // Activities from a previous run can't be updated any more; clear them.
  final ready = liveActivities
      ?.init(appGroupId: pulseAppGroup, requestAndroidNotificationPermission: false)
      .then((_) => liveActivities.endAllActivities());
  String? activityId;
  _Snapshot? shown;

  Future<void> apply(_Snapshot? next) async {
    try {
      if (next == null) {
        if (activityId != null) await liveActivities?.endActivity(activityId!);
        activityId = null;
        if (caps.isAndroid) await notifications.cancel(NotificationService.liveWorkoutId);
        return;
      }
      final resting = next.restEndsAt != null && next.restEndsAt!.isAfter(DateTime.now());
      if (liveActivities != null) {
        await ready;
        final data = {
          'name': next.name,
          'exercise': next.exercise,
          'done': next.done,
          'total': next.total,
          'startedAt': next.startedAt.millisecondsSinceEpoch,
          'restEndsAt': resting ? next.restEndsAt!.millisecondsSinceEpoch : 0,
        };
        if (activityId == null) {
          // Updated locally only; push-token updates would need the Push Notifications entitlement.
          activityId = await liveActivities.createActivity(next.id, data,
              removeWhenAppIsKilled: false, iOSEnableRemoteUpdates: false);
        } else {
          await liveActivities.updateActivity(activityId!, data);
        }
      } else if (caps.isAndroid) {
        final l10n = systemL10n();
        await notifications.showLiveWorkout(
          title: next.name,
          body: [resting ? l10n.rest : next.exercise, l10n.setsProgress(next.done, next.total)]
              .where((s) => s.isNotEmpty)
              .join(' · '),
          startedAt: next.startedAt,
          restEndsAt: resting ? next.restEndsAt : null,
        );
      }
    } catch (e) {
      debugPrint('Live workout presence failed: $e'); // never break the workout over this
    }
  }

  var queue = Future<void>.value();
  Timer? restOver;
  container.listen(activeWorkoutProvider, fireImmediately: true, (_, next) {
    final snap = _snapshot(next.value);
    if (snap == shown) return;
    shown = snap;
    queue = queue.then((_) => apply(snap)); // keep create/update/end in order
    // A rest that runs out doesn't change the state, so switch back from the
    // countdown to the workout clock ourselves.
    restOver?.cancel();
    final wait = snap?.restEndsAt?.difference(DateTime.now());
    if (wait != null && !wait.isNegative) restOver = Timer(wait, () => queue = queue.then((_) => apply(snap)));
  });
}
