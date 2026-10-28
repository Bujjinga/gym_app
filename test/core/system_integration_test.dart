import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/platform/window_state.dart';
import 'package:gym_app/features/activity/domain/day_activity.dart';
import 'package:gym_app/features/coach/application/rule_based_coach.dart';
import 'package:gym_app/features/coach/domain/coach_service.dart';
import 'package:gym_app/features/reminders/domain/reminder_plan.dart';

void main() {
  // Wednesday 28 Oct 2026, 09:00 local.
  final now = DateTime(2026, 10, 28, 9);
  String key(int daysAgo) => DayActivity.keyFor(DateTime(2026, 10, 28 - daysAgo));

  group('RuleBasedCoach', () {
    const coach = RuleBasedCoach();
    List<DayActivity> baseline({double hrv = 60, int rhr = 55}) => [
          for (var i = 7; i >= 1; i--) DayActivity(day: key(i), hrvMs: 60, restingHeartRate: 55, sleepMinutes: 480),
          DayActivity(day: key(0), hrvMs: hrv, restingHeartRate: rhr, sleepMinutes: 480),
        ];

    test('well rested at baseline → ready', () async {
      final r = await coach.report(CoachInput(now: now, days: baseline(), training: const []));
      expect(r.recoveryScore, greaterThanOrEqualTo(67));
      expect(r.readiness, Readiness.ready);
      expect(r.tips, isEmpty);
    });

    test('low HRV, high resting HR and short sleep → rest with tips', () async {
      final days = baseline(hrv: 45, rhr: 63);
      days[days.length - 1] = days.last.copyWith(sleepMinutes: 300);
      final r = await coach.report(CoachInput(now: now, days: days, training: const []));
      expect(r.readiness, Readiness.rest);
      expect(r.tips, containsAll([CoachTip.sleepMore, CoachTip.hrvLow, CoachTip.restingHrHigh]));
    });

    test('no body data → no score, asks to connect health', () async {
      final r = await coach.report(CoachInput(now: now, days: const [], training: const []));
      expect(r.recoveryScore, isNull);
      expect(r.tips, [CoachTip.connectHealth]);
    });

    test('load spike and five hard weeks → loadSpike + deload', () async {
      final training = [
        // 3 × 40 min/week for the previous 4 weeks, then 6 × 60 min this week.
        for (var w = 1; w < 5; w++)
          for (var s = 0; s < 3; s++) (startedAt: now.subtract(Duration(days: 7 * w + s)), minutes: 40),
        for (var s = 0; s < 6; s++) (startedAt: now.subtract(Duration(days: s)), minutes: 60),
      ];
      final r = await coach.report(CoachInput(now: now, days: baseline(), training: training));
      expect(r.tips, containsAll([CoachTip.loadSpike, CoachTip.deload]));
    });
  });

  group('planReminders', () {
    test('workout reminders only on pinned weekdays, skipping past times', () {
      final plan = planReminders(
        now: now,
        reminderMinute: 18 * 60,
        pinnedWorkouts: {DateTime.wednesday: 'Push', DateTime.friday: 'Pull'},
        lastTrained: null,
        streak: 0,
      );
      expect(plan.map((r) => (r.at, r.workoutName)), [
        (DateTime(2026, 10, 28, 18), 'Push'),
        (DateTime(2026, 10, 30, 18), 'Pull'),
      ]);
    });

    test('trained today: no workout or streak reminder today, nudge in 3 days', () {
      final plan = planReminders(
        now: now,
        reminderMinute: 18 * 60,
        pinnedWorkouts: {DateTime.wednesday: 'Push'},
        lastTrained: now.subtract(const Duration(hours: 1)),
        streak: 4,
      );
      expect(plan.map((r) => r.kind), [ReminderKind.inactivity]);
      expect(plan.single.at, DateTime(2026, 10, 31, 18));
    });

    test('streak alive but nothing today → 20:00 protection; overdue nudge today', () {
      final plan = planReminders(
        now: now,
        reminderMinute: 18 * 60,
        pinnedWorkouts: const {},
        lastTrained: DateTime(2026, 10, 20, 7),
        streak: 1,
      );
      expect(plan.map((r) => (r.kind, r.at)), [
        (ReminderKind.streak, DateTime(2026, 10, 28, 20)),
        (ReminderKind.inactivity, DateTime(2026, 10, 28, 18)),
      ]);
    });
  });

  group('WindowState', () {
    const screen = Rect.fromLTWH(0, 0, 1920, 1080);
    const min = Size(900, 600);

    test('round-trips through JSON and rejects bad data', () {
      const s = WindowState(Rect.fromLTWH(10, 20, 1000, 700), maximized: true);
      final back = WindowState.fromJson(s.toJson());
      expect(back?.bounds, s.bounds);
      expect(back?.maximized, isTrue);
      expect(WindowState.fromJson({'x': 'nope'}), isNull);
    });

    test('grows to the minimum size; off-screen frames fall back to default', () {
      expect(const WindowState(Rect.fromLTWH(100, 100, 400, 300)).fit([screen], min), const Rect.fromLTWH(100, 100, 900, 600));
      expect(const WindowState(Rect.fromLTWH(3000, 100, 1000, 700)).fit([screen], min), isNull);
    });
  });
}
