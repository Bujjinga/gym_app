import 'dart:math' as math;

import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/core/database/app_database.dart';
import 'package:gym_app/core/database/database_provider.dart';
import 'package:gym_app/core/database/seed/seed_service.dart';
import 'package:gym_app/core/domain/pulse_enums.dart';
import 'package:gym_app/core/utils/ids.dart';
import 'package:gym_app/features/achievements/data/drift_progress_repository.dart';
import 'package:gym_app/features/achievements/domain/personal_record.dart';
import 'package:gym_app/features/activity/data/drift_activity_repository.dart';
import 'package:gym_app/features/activity/domain/cardio_session.dart';
import 'package:gym_app/features/activity/domain/day_activity.dart';
import 'package:gym_app/features/activity/domain/route_point.dart';
import 'package:gym_app/features/body/data/drift_body_repository.dart';
import 'package:gym_app/features/body/domain/body_measurement.dart';
import 'package:gym_app/features/nutrition/data/drift_nutrition_repository.dart';
import 'package:gym_app/features/nutrition/domain/water_log.dart';
import 'package:gym_app/features/plans/data/drift_plan_repository.dart';
import 'package:gym_app/features/profile/data/drift_profile_repository.dart';
import 'package:gym_app/features/workout/data/drift_workout_repository.dart';
import 'package:gym_app/features/workout/domain/exercise_entry.dart';
import 'package:gym_app/features/workout/domain/set_entry.dart';
import 'package:gym_app/features/workout/domain/workout_session.dart';

/// A container on a throwaway in-memory database filled with five weeks of
/// believable training, activity and body data — for store screenshots and
/// performance runs only. Deterministic, so screenshots are repeatable.
Future<ProviderContainer> demoContainer() async {
  final c = ProviderContainer(overrides: [appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory()))]);
  await c.read(seedDatabaseProvider.future);
  final rnd = math.Random(7);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  DateTime daysAgo(int d, [int hour = 18]) => DateTime(today.year, today.month, today.day - d, hour);

  final profiles = c.read(profileRepositoryProvider);
  await profiles.save((await profiles.get()).copyWith(
    displayName: 'Alex',
    goal: TrainingGoal.values.first,
    experience: ExperienceLevel.values[1],
    trainingDaysPerWeek: 4,
    heightCm: 180,
    weightKg: 79,
    birthYear: 1994,
    onboardingComplete: true,
    xp: 4800,
  ));
  await c.read(planRepositoryProvider).setActive(seedId('plan', 'push-pull-legs'));

  final activity = c.read(activityRepositoryProvider);
  for (var d = 27; d >= 0; d--) {
    final steps = d == 0 ? 7420 : 6500 + rnd.nextInt(7000);
    await activity.saveDay(DayActivity(
      day: DayActivity.keyFor(daysAgo(d)),
      steps: steps,
      distanceM: steps * 0.78,
      floors: 4 + rnd.nextInt(10),
      activeKcal: d == 0 ? 410 : 300 + rnd.nextInt(350).toDouble(),
      exerciseMin: d == 0 ? 12 : rnd.nextInt(30),
      restingHeartRate: 54 + rnd.nextInt(4),
      hrvMs: 58 + rnd.nextInt(12).toDouble(),
      sleepMinutes: 410 + rnd.nextInt(80),
    ));
  }

  // Push / pull / legs rotation, 4 sessions a week with slow progression.
  final workouts = c.read(workoutRepositoryProvider);
  const days = <(String, List<String>)>[
    ('Push', ['barbell-bench-press', 'barbell-overhead-press', 'incline-dumbbell-press']),
    ('Pull', ['lat-pulldown', 'barbell-bent-over-row', 'seated-cable-row']),
    ('Legs', ['barbell-back-squat', 'front-squat', 'dumbbell-goblet-squat']),
  ];
  const base = {
    'barbell-bench-press': 70.0, 'barbell-overhead-press': 42.5, 'incline-dumbbell-press': 26.0,
    'lat-pulldown': 60.0, 'barbell-bent-over-row': 65.0, 'seated-cable-row': 55.0,
    'barbell-back-squat': 95.0, 'front-squat': 65.0, 'dumbbell-goblet-squat': 30.0,
  };
  var n = 0;
  for (var d = 34; d >= 1; d--) {
    if (d % 7 == 3 || d % 7 == 6 || d % 7 == 0) continue; // rest days
    final (name, slugs) = days[n % 3];
    final start = daysAgo(d, 7);
    final progress = (34 - d) / 34;
    await workouts.saveSession(WorkoutSession(
      id: newId(),
      name: name,
      startedAt: start,
      endedAt: start.add(Duration(minutes: 52 + rnd.nextInt(20))),
      entries: [
        for (final slug in slugs)
          ExerciseEntry(
            id: newId(),
            exerciseId: seedId('exercise', slug),
            sets: [
              for (var s = 0; s < 3; s++)
                SetEntry(
                  id: newId(),
                  weightKg: ((base[slug]! * (1 + 0.08 * progress)) / 2.5).round() * 2.5,
                  reps: 8 - s,
                  completedAt: start.add(Duration(minutes: 5 + s * 3)),
                ),
            ],
          ),
      ],
    ));
    n++;
  }

  final progress = c.read(progressRepositoryProvider);
  for (final (slug, kg, d) in [('barbell-bench-press', 77.5, 2), ('barbell-back-squat', 102.5, 4), ('lat-pulldown', 65.0, 6)]) {
    await progress.addRecord(PersonalRecord(
        id: newId(), exerciseId: seedId('exercise', slug), type: RecordType.maxWeight, value: kg, reps: 6, achievedAt: daysAgo(d)));
  }

  // Runs and walks on a loop around a park, sized so the route length matches
  // the recorded distance (≈ 4.5 km loop at scale 1).
  for (final (d, type, km) in [(1, CardioType.run, 5.2), (5, CardioType.walk, 3.1), (9, CardioType.run, 6.4), (13, CardioType.walk, 4.0)]) {
    final start = daysAgo(d, 19);
    final paceSec = type == CardioType.run ? 330 : 690;
    final id = newId();
    await activity.saveCardio(CardioSession(
      id: id,
      type: type,
      source: CardioSource.gps,
      startedAt: start,
      endedAt: start.add(Duration(seconds: (km * paceSec).round())),
      durationSec: (km * paceSec).round(),
      distanceM: km * 1000,
      caloriesKcal: km * (type == CardioType.run ? 68 : 52),
      avgHeartRate: type == CardioType.run ? 152 : 108,
      maxHeartRate: type == CardioType.run ? 176 : 124,
    ));
    await activity.addRoutePoints(id, [
      for (var i = 0; i <= 120; i++)
        RoutePoint(
          id: newId(),
          recordedAt: start.add(Duration(seconds: (km * paceSec * i / 120).round())),
          latitude: 51.5079 + 0.006 * math.sin(i / 120 * 2 * math.pi) * (km / 4.5),
          longitude: -0.1652 + 0.011 * math.cos(i / 120 * 2 * math.pi) * (km / 4.5) + 0.0006 * math.sin(i / 7),
          heartRate: (type == CardioType.run ? 140 : 100) + rnd.nextInt(30),
        ),
    ]);
  }

  final body = c.read(bodyRepositoryProvider);
  for (var w = 10; w >= 0; w--) {
    await body.saveMeasurement(
        BodyMeasurement(id: newId(), type: MeasurementType.weight, value: 79 + w * 0.35, measuredAt: daysAgo(w * 3, 8)));
  }
  final water = c.read(nutritionRepositoryProvider);
  for (final h in [8, 11, 14]) {
    await water.addWater(WaterLog(id: newId(), loggedAt: DateTime(today.year, today.month, today.day, h), amountMl: 500));
  }
  return c;
}
