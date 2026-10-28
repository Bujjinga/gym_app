import 'plan.dart';
import 'plan_day.dart';

/// The plan day to train next.
///
/// Days pinned to weekdays: today's day if scheduled, else the next
/// scheduled weekday. Unpinned days rotate by how many plan workouts have
/// been completed.
({PlanDay day, bool isToday})? nextPlanDay(Plan plan, DateTime today, {int completedPlanWorkouts = 0}) {
  if (plan.days.isEmpty) return null;
  final pinned = plan.days.where((d) => d.weekday != null).toList();
  if (pinned.isEmpty) {
    return (day: plan.days[completedPlanWorkouts % plan.days.length], isToday: true);
  }
  for (var offset = 0; offset < 7; offset++) {
    final weekday = (today.weekday - 1 + offset) % 7 + 1;
    for (final d in pinned) {
      if (d.weekday == weekday) return (day: d, isToday: offset == 0);
    }
  }
  return null;
}
