/// Kinds of scheduled reminder. "Goal reached" isn't scheduled — it's shown
/// the moment the step goal is crossed.
enum ReminderKind { workout, streak, inactivity }

/// One notification to schedule. [workoutName] is set for [ReminderKind.workout].
typedef PlannedReminder = ({int id, ReminderKind kind, DateTime at, String? workoutName});

/// Days without training before the inactivity nudge.
const inactivityDays = 3;

/// Streak protection fires at 20:00 if nothing was logged yet today.
const streakReminderMinute = 20 * 60;

/// Reminders for the next 7 days. Re-planned whenever the inputs change, so
/// one-shot notifications are enough (no repeating schedules to drift).
///
/// - workout: at [reminderMinute] on each weekday the active plan pins a
///   workout to ([pinnedWorkouts]: ISO weekday → workout name), skipped today
///   if already trained
/// - streak: today at 20:00 when a streak is alive but today has no activity
/// - inactivity: [inactivityDays] after [lastTrained] at [reminderMinute]
///   (or the next upcoming reminder time if that has passed)
List<PlannedReminder> planReminders({
  required DateTime now,
  required int reminderMinute,
  required Map<int, String> pinnedWorkouts,
  required DateTime? lastTrained,
  required int streak,
}) {
  final today = DateTime(now.year, now.month, now.day);
  DateTime at(DateTime day, int minute) => DateTime(day.year, day.month, day.day, minute ~/ 60, minute % 60);
  final last = lastTrained?.toLocal();
  final trainedToday = last != null && !last.isBefore(today);
  final plan = <PlannedReminder>[];

  for (var offset = 0; offset < 7; offset++) {
    final day = DateTime(today.year, today.month, today.day + offset);
    final name = pinnedWorkouts[day.weekday];
    final when = at(day, reminderMinute);
    if (name == null || !when.isAfter(now) || (offset == 0 && trainedToday)) continue;
    plan.add((id: 100 + offset, kind: ReminderKind.workout, at: when, workoutName: name));
  }

  final streakAt = at(today, streakReminderMinute);
  if (streak > 0 && !trainedToday && streakAt.isAfter(now)) {
    plan.add((id: 200, kind: ReminderKind.streak, at: streakAt, workoutName: null));
  }

  if (last != null) {
    final lastDay = DateTime(last.year, last.month, last.day);
    var nudge = at(DateTime(lastDay.year, lastDay.month, lastDay.day + inactivityDays), reminderMinute);
    if (!nudge.isAfter(now)) {
      final todayAt = at(today, reminderMinute);
      nudge = todayAt.isAfter(now) ? todayAt : at(DateTime(today.year, today.month, today.day + 1), reminderMinute);
    }
    plan.add((id: 300, kind: ReminderKind.inactivity, at: nudge, workoutName: null));
  }
  return plan;
}
