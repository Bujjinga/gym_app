import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/streak.dart';
import '../../achievements/data/drift_progress_repository.dart';
import '../../achievements/domain/personal_record.dart';
import '../../activity/data/drift_activity_repository.dart';
import '../../activity/domain/cardio_session.dart';
import '../../activity/domain/day_activity.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../../workout/application/workout_providers.dart';
import '../domain/dashboard_layout.dart';

part 'home_providers.g.dart';

DateTime _today() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

// shortcut: "today" is fixed when the stream starts and rolls over on the next
// launch; Phase 5's step service will invalidate these at midnight.
@riverpod
Stream<DayActivity> todayActivity(Ref ref) {
  final today = _today();
  return ref
      .watch(activityRepositoryProvider)
      .watchDays(today, today)
      .map((days) => days.firstOrNull ?? DayActivity(day: DayActivity.keyFor(today)));
}

/// The last 7 days (oldest first), with empty days filled in.
@riverpod
Stream<List<DayActivity>> weekActivity(Ref ref) {
  final today = _today();
  final from = today.subtract(const Duration(days: 6));
  return ref.watch(activityRepositoryProvider).watchDays(from, today).map((rows) {
    final byDay = {for (final r in rows) r.day: r};
    final keys = [for (var i = 0; i < 7; i++) DayActivity.keyFor(DateTime(from.year, from.month, from.day + i))];
    return [for (final k in keys) byDay[k] ?? DayActivity(day: k)];
  });
}

/// Minutes of finished workouts today (feeds the Exercise ring).
@riverpod
int todayWorkoutMinutes(Ref ref) {
  final today = _today();
  final sessions = ref.watch(workoutHistoryProvider).value ?? const [];
  return sessions
      .where((s) => s.endedAt != null && !s.startedAt.toLocal().isBefore(today))
      .fold(0, (sum, s) => sum + (s.duration?.inMinutes ?? 0));
}

@riverpod
Stream<List<CardioSession>> cardioHistory(Ref ref) => ref.watch(activityRepositoryProvider).watchCardio();

/// Consecutive days with a finished workout or a cardio session.
@riverpod
int trainingStreak(Ref ref) {
  final sessions = ref.watch(workoutHistoryProvider).value ?? const [];
  final cardio = ref.watch(cardioHistoryProvider).value ?? const [];
  return currentStreak([
    for (final s in sessions)
      if (s.endedAt != null) s.startedAt.toLocal(),
    for (final c in cardio) c.startedAt.toLocal(),
  ], DateTime.now());
}

@riverpod
Stream<List<PersonalRecord>> recentRecords(Ref ref) =>
    ref.watch(progressRepositoryProvider).watchRecords().map((r) => r.take(3).toList());

@riverpod
DashboardLayout dashboardLayout(Ref ref) =>
    DashboardLayout.fromStored(ref.watch(userProfileProvider).value?.dashboardCards ?? const []);
