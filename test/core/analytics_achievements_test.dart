import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/utils/analytics.dart';
import 'package:gym_app/features/achievements/domain/achievement_catalog.dart';

void main() {
  final now = DateTime(2026, 10, 28, 15); // Wednesday

  group('buckets', () {
    test('sizes per range', () {
      expect(bucketStarts(TimeRange.week, now).length, 7);
      expect(bucketStarts(TimeRange.month, now).length, 30);
      expect(bucketStarts(TimeRange.threeMonths, now).last, DateTime(2026, 10, 26)); // Monday
      expect(bucketStarts(TimeRange.year, now).first, DateTime(2025, 11));
    });

    test('sums land in the right bucket and outliers are dropped', () {
      final items = [
        (DateTime(2026, 10, 28, 9), 3.0),
        (DateTime(2026, 10, 28, 20), 2.0),
        (DateTime(2026, 10, 22), 1.0),
        (DateTime(2026, 10, 1), 9.0), // outside the week
      ];
      final sums = bucketSums(TimeRange.week, now, items, (i) => i.$1, (i) => i.$2);
      expect(sums.last, 5);
      expect(sums.first, 1);
      expect(sums.reduce((a, b) => a + b), 6);
      expect(bucketSums(TimeRange.year, now, items, (i) => i.$1, (i) => i.$2).last, 15);
    });
  });

  group('achievements & levels', () {
    const stats = (
      workouts: 12,
      streak: 3,
      maxSessionVolumeKg: 5000.0,
      records: 1,
      cardioSessions: 0,
      cardioKm: 0.0,
      maxDaySteps: 12000,
    );
    double p(String key) => achievementCatalog.firstWhere((a) => a.key == key).progress(stats);

    test('progress is clamped to 0..1', () {
      expect(p('workouts_10'), 1);
      expect(p('workouts_50'), closeTo(0.24, 1e-9));
      expect(p('volume_10k'), 0.5);
      expect(p('first_cardio'), 0);
      expect(p('steps_10k'), 1);
    });

    test('keys are unique', () {
      expect(achievementCatalog.map((a) => a.key).toSet().length, achievementCatalog.length);
    });

    test('level thresholds and XP rewards', () {
      expect(levelForXp(0), 1);
      expect(levelForXp(99), 1);
      expect(levelForXp(100), 2);
      expect(levelForXp(400), 3);
      expect(xpForLevel(4), 900);
      expect(XpRewards.workout(volumeKg: 4800, records: 2), 100 + 48 + 100);
    });
  });
}
