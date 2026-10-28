import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../activity/data/drift_activity_repository.dart';
import '../../activity/domain/day_activity.dart';
import '../../home/application/home_providers.dart';
import '../../workout/application/workout_providers.dart';
import '../domain/coach_service.dart';
import 'rule_based_coach.dart';

part 'coach_providers.g.dart';

/// Swap this for an AI-backed [CoachService] to change the coach app-wide.
@Riverpod(keepAlive: true)
CoachService coachService(Ref ref) => const RuleBasedCoach();

/// The last 28 days of activity rows, oldest first.
@riverpod
Stream<List<DayActivity>> recentDays(Ref ref) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  return ref.watch(activityRepositoryProvider).watchDays(today.subtract(const Duration(days: 27)), today);
}

/// Today's recovery score, readiness and tips.
@riverpod
Future<CoachReport> coachReport(Ref ref) async {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final days = await ref.watch(recentDaysProvider.future);
  final sessions = await ref.watch(workoutHistoryProvider.future);
  final cardio = await ref.watch(cardioHistoryProvider.future);
  final since = today.subtract(const Duration(days: 35));
  return ref.watch(coachServiceProvider).report(CoachInput(
        now: now,
        days: days,
        training: [
          for (final s in sessions)
            if (s.duration case final d? when s.startedAt.isAfter(since)) (startedAt: s.startedAt, minutes: d.inMinutes),
          for (final c in cardio)
            if (c.startedAt.isAfter(since)) (startedAt: c.startedAt, minutes: c.durationSec ~/ 60),
        ],
      ));
}
