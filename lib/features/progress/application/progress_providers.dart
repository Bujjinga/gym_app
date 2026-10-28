import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/pulse_enums.dart';
import '../../activity/data/drift_activity_repository.dart';
import '../../activity/domain/day_activity.dart';
import '../../body/data/drift_body_repository.dart';
import '../../body/domain/body_measurement.dart';
import '../../body/domain/progress_photo.dart';
import '../../nutrition/data/drift_nutrition_repository.dart';
import '../../nutrition/domain/meal_entry.dart';
import '../../nutrition/domain/water_log.dart';

part 'progress_providers.g.dart';

({DateTime from, DateTime to}) _todayRange() {
  final now = DateTime.now();
  final from = DateTime(now.year, now.month, now.day);
  return (from: from, to: from.add(const Duration(days: 1)));
}

@riverpod
Stream<List<BodyMeasurement>> measurements(Ref ref, MeasurementType type) =>
    ref.watch(bodyRepositoryProvider).watchMeasurements(type);

@riverpod
Stream<List<WaterLog>> waterToday(Ref ref) {
  final r = _todayRange();
  return ref.watch(nutritionRepositoryProvider).watchWater(r.from, r.to);
}

@riverpod
Stream<List<MealEntry>> mealsToday(Ref ref) {
  final r = _todayRange();
  return ref.watch(nutritionRepositoryProvider).watchMeals(r.from, r.to);
}

@riverpod
Stream<List<ProgressPhoto>> progressPhotos(Ref ref) => ref.watch(bodyRepositoryProvider).watchPhotos();

/// Most recent day in the last week with any health metric (Health card).
@riverpod
Stream<DayActivity?> latestHealthDay(Ref ref) {
  final now = DateTime.now();
  return ref.watch(activityRepositoryProvider).watchDays(now.subtract(const Duration(days: 7)), now).map(
        (days) => days.reversed
            .where((d) => d.restingHeartRate != null || d.hrvMs != null || d.sleepMinutes != null)
            .firstOrNull,
      );
}
