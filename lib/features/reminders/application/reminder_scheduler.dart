import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../l10n/system_l10n.dart';
import '../../home/application/home_providers.dart';
import '../../plans/application/plan_providers.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../../workout/application/workout_providers.dart';
import '../data/notification_service.dart';
import '../domain/reminder_plan.dart';

part 'reminder_scheduler.g.dart';

/// Reminders that should be pending right now; empty when turned off.
// shortcut: "now" is taken when an input changes (and at launch), so an app
// left open for days won't re-plan tomorrow's streak reminder; add a midnight
// timer if that matters.
@Riverpod(keepAlive: true)
List<PlannedReminder> plannedReminders(Ref ref) {
  final profile = ref.watch(userProfileProvider).value;
  if (profile == null || !profile.remindersEnabled) return const [];
  final plan = ref.watch(activePlanProvider).value;
  final sessions = ref.watch(workoutHistoryProvider).value ?? const [];
  final cardio = ref.watch(cardioHistoryProvider).value ?? const [];
  final trained = [
    for (final s in sessions)
      if (s.endedAt != null) s.startedAt,
    for (final c in cardio) c.startedAt,
  ];
  return planReminders(
    now: DateTime.now(),
    reminderMinute: profile.reminderMinute,
    pinnedWorkouts: {
      for (final d in plan?.days ?? const [])
        if (d.weekday != null) d.weekday!: d.name,
    },
    lastTrained: trained.isEmpty ? null : trained.reduce((a, b) => a.isAfter(b) ? a : b),
    streak: ref.watch(trainingStreakProvider),
  );
}

/// Keeps the OS schedule in sync with [plannedRemindersProvider] and shows
/// "goal reached" when today's steps cross the goal.
void startReminders(ProviderContainer container) {
  final service = container.read(notificationServiceProvider);
  container.listen(plannedRemindersProvider, fireImmediately: true, (_, plan) {
    final l10n = systemL10n();
    unawaited(service.schedule(plan, (r) => switch (r.kind) {
          ReminderKind.workout => (l10n.reminderWorkoutTitle, l10n.reminderWorkoutBody(r.workoutName ?? '')),
          ReminderKind.streak => (l10n.reminderStreakTitle, l10n.reminderStreakBody(container.read(trainingStreakProvider))),
          ReminderKind.inactivity => (l10n.reminderInactiveTitle, l10n.reminderInactiveBody),
        }));
  });
  container.listen(todayActivityProvider, (prev, next) {
    final profile = container.read(userProfileProvider).value;
    final (before, after) = (prev?.value?.steps, next.value?.steps);
    if (profile == null || !profile.remindersEnabled || before == null || after == null) return;
    if (before < profile.stepsGoal && after >= profile.stepsGoal) {
      final l10n = systemL10n();
      unawaited(service.show(NotificationService.goalReachedId, l10n.goalReachedTitle, l10n.goalReachedBody(profile.stepsGoal)));
    }
  });
}
