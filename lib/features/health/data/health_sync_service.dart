import 'package:health/health.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/permissions_service.dart';
import '../../../core/platform/platform_providers.dart';
import '../../activity/data/drift_activity_repository.dart';
import '../../activity/domain/day_activity.dart';

part 'health_sync_service.g.dart';

@Riverpod(keepAlive: true)
HealthSyncService healthSync(Ref ref) => HealthSyncService(ref);

/// Reads HealthKit / Health Connect into `daily_activity` (so rings and
/// charts include it) and writes finished workouts back. Phones only;
/// every failure is swallowed — health data is an enhancement, never a crash.
class HealthSyncService {
  HealthSyncService(this._ref);

  final Ref _ref;
  final _health = Health();

  bool get _supported => _ref.read(platformCapabilitiesProvider).hasHealthData;

  /// Imports the last [days] days. Returns false if health isn't available.
  Future<bool> syncRecentDays({int days = 7}) async {
    if (!_supported) return false;
    try {
      await _health.configure();
      final types = _ref.read(permissionsServiceProvider).healthReadTypes;
      // iOS hides read-permission status (null); only a definite "no" stops us.
      if (await _health.hasPermissions(types) == false) return false;
      final repo = _ref.read(activityRepositoryProvider);
      final now = DateTime.now();
      for (var i = days - 1; i >= 0; i--) {
        final start = DateTime(now.year, now.month, now.day - i);
        final end = i == 0 ? now : DateTime(start.year, start.month, start.day + 1);
        final points = await _health.getHealthDataFromTypes(
          types: types.where((t) => t != HealthDataType.STEPS).toList(),
          startTime: start.subtract(const Duration(hours: 12)), // sleep that began the evening before
          endTime: end,
        );
        Iterable<num> values(Set<HealthDataType> t) => [
              for (final p in points)
                if (t.contains(p.type) && !p.dateFrom.isBefore(start)) (p.value as NumericHealthValue).numericValue,
            ];
        num sum(Set<HealthDataType> t) => values(t).fold<num>(0, (a, b) => a + b);
        double? avg(Set<HealthDataType> t) {
          final v = values(t);
          return v.isEmpty ? null : sum(t) / v.length;
        }

        final sleepMinutes = points
            .where((p) =>
                (p.type == HealthDataType.SLEEP_ASLEEP || p.type == HealthDataType.SLEEP_SESSION) &&
                !p.dateTo.isBefore(start) &&
                p.dateTo.isBefore(end))
            .fold(0, (a, p) => a + p.dateTo.difference(p.dateFrom).inMinutes);
        final steps = await _health.getTotalStepsInInterval(start, end) ?? 0;
        final existing =
            (await repo.watchDays(start, start).first).firstOrNull ?? DayActivity(day: DayActivity.keyFor(start));
        final distance = sum({HealthDataType.DISTANCE_DELTA, HealthDataType.DISTANCE_WALKING_RUNNING}).toDouble();
        await repo.saveDay(existing.copyWith(
          // The phone's own counter and Health can disagree; keep the larger.
          steps: steps > existing.steps ? steps : existing.steps,
          distanceM: distance > existing.distanceM ? distance : existing.distanceM,
          floors: sum({HealthDataType.FLIGHTS_CLIMBED}).round(),
          activeKcal: sum({HealthDataType.ACTIVE_ENERGY_BURNED}).toDouble(),
          avgHeartRate: avg({HealthDataType.HEART_RATE})?.round(),
          restingHeartRate: avg({HealthDataType.RESTING_HEART_RATE})?.round(),
          hrvMs: avg({HealthDataType.HEART_RATE_VARIABILITY_SDNN, HealthDataType.HEART_RATE_VARIABILITY_RMSSD}),
          sleepMinutes: sleepMinutes == 0 ? existing.sleepMinutes : sleepMinutes,
          source: ActivitySource.health,
        ));
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Latest heart-rate sample from the last 15 minutes, if any.
  Future<int?> latestHeartRate() async {
    if (!_supported) return null;
    try {
      final now = DateTime.now();
      final points = await _health.getHealthDataFromTypes(
        types: [HealthDataType.HEART_RATE],
        startTime: now.subtract(const Duration(minutes: 15)),
        endTime: now,
      );
      if (points.isEmpty) return null;
      points.sort((a, b) => a.dateTo.compareTo(b.dateTo));
      return (points.last.value as NumericHealthValue).numericValue.round();
    } catch (_) {
      return null;
    }
  }

  /// Saves a finished workout ([cardioType] null = strength) to Health.
  Future<bool> saveWorkout({
    required CardioType? cardioType,
    required DateTime start,
    required DateTime end,
    double? kcal,
    double? distanceM,
  }) async {
    if (!_supported) return false;
    try {
      return await _health.writeWorkoutData(
        activityType: switch (cardioType) {
          null => HealthWorkoutActivityType.TRADITIONAL_STRENGTH_TRAINING,
          CardioType.walk || CardioType.treadmill => HealthWorkoutActivityType.WALKING,
          CardioType.run => HealthWorkoutActivityType.RUNNING,
          CardioType.hike => HealthWorkoutActivityType.HIKING,
          CardioType.cycle => HealthWorkoutActivityType.BIKING,
          CardioType.other => HealthWorkoutActivityType.OTHER,
        },
        start: start,
        end: end,
        totalEnergyBurned: kcal?.round(),
        totalDistance: distanceM?.round(),
        title: 'PULSE',
      );
    } catch (_) {
      return false;
    }
  }
}
