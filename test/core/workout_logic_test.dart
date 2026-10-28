import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/domain/pulse_enums.dart';
import 'package:gym_app/core/utils/plate_calculator.dart';
import 'package:gym_app/core/utils/streak.dart';
import 'package:gym_app/features/plans/domain/plan.dart';
import 'package:gym_app/features/plans/domain/plan_day.dart';
import 'package:gym_app/features/plans/domain/plan_schedule.dart';
import 'package:gym_app/features/workout/domain/exercise_entry.dart';
import 'package:gym_app/features/workout/domain/pr_detector.dart';
import 'package:gym_app/features/workout/domain/set_entry.dart';
import 'package:gym_app/features/workout/domain/workout_session.dart';

void main() {
  group('plate calculator', () {
    test('loads 100 kg on a 20 kg bar', () {
      final load = PlateCalculator.calculate(target: 100, bar: 20, plates: PlateCalculator.kgPlates);
      expect(load.perSide, [25, 15]);
      expect(load.achieved, 100);
    });

    test('uses small plates and reports the closest achievable weight', () {
      final load = PlateCalculator.calculate(target: 63, bar: 20, plates: PlateCalculator.kgPlates);
      expect(load.perSide, [20, 1.25]);
      expect(load.achieved, 62.5);
    });

    test('target below the bar loads nothing', () {
      final load = PlateCalculator.calculate(target: 10, bar: 20, plates: PlateCalculator.kgPlates);
      expect(load.perSide, isEmpty);
      expect(load.achieved, 20);
    });

    test('pounds', () {
      expect(PlateCalculator.calculate(target: 225, bar: 45, plates: PlateCalculator.lbPlates).perSide, [45, 45]);
    });
  });

  group('streak', () {
    final today = DateTime(2026, 10, 28, 15);

    test('counts back from today', () {
      expect(currentStreak([DateTime(2026, 10, 28, 7), DateTime(2026, 10, 27), DateTime(2026, 10, 26)], today), 3);
    });

    test('still alive when only yesterday was active', () {
      expect(currentStreak([DateTime(2026, 10, 27), DateTime(2026, 10, 26)], today), 2);
    });

    test('broken by a gap', () {
      expect(currentStreak([DateTime(2026, 10, 28), DateTime(2026, 10, 26)], today), 1);
      expect(currentStreak([DateTime(2026, 10, 25)], today), 0);
    });

    test('crosses month boundaries', () {
      expect(
        currentStreak([DateTime(2026, 11, 1), DateTime(2026, 10, 31), DateTime(2026, 10, 30)], DateTime(2026, 11, 1)),
        3,
      );
    });
  });

  group('next plan day', () {
    const pinned = Plan(id: 'p', name: 'PPL', days: [
      PlanDay(id: 'mon', name: 'Push', weekday: 1),
      PlanDay(id: 'wed', name: 'Pull', weekday: 3),
      PlanDay(id: 'fri', name: 'Legs', weekday: 5),
    ]);

    test('today when scheduled', () {
      final next = nextPlanDay(pinned, DateTime(2026, 10, 28)); // Wednesday
      expect(next!.day.id, 'wed');
      expect(next.isToday, isTrue);
    });

    test('next scheduled day, wrapping the week', () {
      expect(nextPlanDay(pinned, DateTime(2026, 10, 29))!.day.id, 'fri'); // Thursday
      final sat = nextPlanDay(pinned, DateTime(2026, 10, 31))!; // Saturday
      expect(sat.day.id, 'mon');
      expect(sat.isToday, isFalse);
    });

    test('unpinned days rotate by completed workouts', () {
      const rotating = Plan(id: 'r', name: 'FB', days: [PlanDay(id: 'a', name: 'A'), PlanDay(id: 'b', name: 'B')]);
      expect(nextPlanDay(rotating, DateTime(2026), completedPlanWorkouts: 3)!.day.id, 'b');
    });
  });

  group('PR detection', () {
    SetEntry set(double kg, int reps, {SetType type = SetType.working, bool done = true}) =>
        SetEntry(id: '$kg-$reps-$type', type: type, weightKg: kg, reps: reps, completedAt: done ? DateTime(2026) : null);

    final session = WorkoutSession(
      id: 's',
      name: 'Push',
      startedAt: DateTime(2026, 10, 28),
      entries: [
        ExerciseEntry(id: 'e', exerciseId: 'bench', sets: [
          set(40, 10, type: SetType.warmup),
          set(80, 5),
          set(70, 10),
          set(100, 1, done: false),
        ]),
      ],
    );
    var n = 0;
    String id() => 'r${n++}';

    test('first session sets every record type', () {
      final byType = {
        for (final r in detectRecords(session, previousBest: (_, _) => null, newId: id)) r.type: r,
      };
      expect(byType[RecordType.maxWeight]!.value, 80);
      expect(byType[RecordType.maxReps]!.value, 10);
      expect(byType[RecordType.maxVolume]!.value, 80 * 5 + 70 * 10);
      expect(byType[RecordType.estimatedOneRepMax]!.value, closeTo(93.33, 0.01));
    });

    test('ignores warm-ups, uncompleted sets and values that do not beat the best', () {
      final records = detectRecords(
        session,
        previousBest: (_, type) => switch (type) {
          RecordType.maxWeight => 90,
          RecordType.estimatedOneRepMax => 200,
          RecordType.maxReps => 12,
          RecordType.maxVolume => 1000,
        },
        newId: id,
      );
      expect(records.map((r) => r.type), [RecordType.maxVolume]);
    });
  });
}
