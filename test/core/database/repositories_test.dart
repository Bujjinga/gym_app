import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/database/app_database.dart';
import 'package:gym_app/core/database/seed/seed_service.dart';
import 'package:gym_app/core/database/sync_columns.dart';
import 'package:gym_app/core/domain/pulse_enums.dart';
import 'package:gym_app/core/utils/ids.dart';
import 'package:gym_app/features/achievements/data/drift_progress_repository.dart';
import 'package:gym_app/features/achievements/domain/achievement_progress.dart';
import 'package:gym_app/features/activity/data/drift_activity_repository.dart';
import 'package:gym_app/features/activity/domain/day_activity.dart';
import 'package:gym_app/features/exercises/data/drift_exercise_repository.dart';
import 'package:gym_app/features/exercises/domain/exercise_filter.dart';
import 'package:gym_app/features/plans/data/drift_plan_repository.dart';
import 'package:gym_app/features/profile/data/drift_profile_repository.dart';
import 'package:gym_app/features/workout/data/drift_workout_repository.dart';
import 'package:gym_app/features/workout/domain/exercise_entry.dart';
import 'package:gym_app/features/workout/domain/set_entry.dart';
import 'package:gym_app/features/workout/domain/workout_session.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // rootBundle for seed assets
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  group('seed', () {
    test('loads 200+ exercises and 5 programs, idempotently', () async {
      await SeedService(db).run();
      await SeedService(db).run();
      expect(await db.exerciseDao.count(), greaterThanOrEqualTo(200));
      expect((await db.select(db.plans).get()).length, 5);
    });

    test('re-seeding keeps user favorites', () async {
      await SeedService(db).run();
      final repo = DriftExerciseRepository(db);
      final bench = seedId('exercise', 'barbell-bench-press');
      await repo.setFavorite(bench, favorite: true);
      await SeedService(db).run();
      expect((await repo.getById(bench))!.isFavorite, isTrue);
    });

    test('every program exercise exists in the library', () async {
      await SeedService(db).run();
      final plans = DriftPlanRepository(db);
      final exercises = DriftExerciseRepository(db);
      for (final header in await plans.watchPlans().first) {
        final plan = (await plans.getPlan(header.id))!;
        expect(plan.days, isNotEmpty);
        final ids = {for (final d in plan.days) ...d.exercises.map((e) => e.exerciseId)};
        expect((await exercises.getByIds(ids)).length, ids.length, reason: plan.name);
      }
    });

    test('filters by muscle and search text', () async {
      await SeedService(db).run();
      final repo = DriftExerciseRepository(db);
      final chest = await repo.watch(const ExerciseFilter(muscle: MuscleGroup.chest)).first;
      expect(chest, isNotEmpty);
      expect(chest.every((e) => e.primaryMuscle == MuscleGroup.chest), isTrue);
      final squats = await repo.watch(const ExerciseFilter(query: 'squat')).first;
      expect(squats.every((e) => e.name.toLowerCase().contains('squat')), isTrue);
    });
  });

  group('workouts', () {
    final exerciseId = seedId('exercise', 'barbell-bench-press');

    WorkoutSession session(String id, DateTime start, List<SetEntry> sets) => WorkoutSession(
          id: id,
          name: 'Push',
          startedAt: start,
          entries: [ExerciseEntry(id: '$id-e1', exerciseId: exerciseId, sets: sets)],
        );

    SetEntry set(String id, double kg, int reps, {SetType type = SetType.working}) =>
        SetEntry(id: id, type: type, weightKg: kg, reps: reps, completedAt: DateTime.utc(2026));

    test('round-trips a session and computes volume without warm-ups', () async {
      final repo = DriftWorkoutRepository(db);
      await repo.saveSession(session('s1', DateTime.utc(2026, 10, 1), [
        set('a', 40, 10, type: SetType.warmup),
        set('b', 60, 8),
        set('c', 60, 8),
      ]));
      final loaded = (await repo.getSession('s1'))!;
      expect(loaded.entries.single.sets.map((s) => s.id), ['a', 'b', 'c']);
      expect(loaded.totalVolumeKg, 960);
    });

    test('removed sets are soft-deleted and marked for sync', () async {
      final repo = DriftWorkoutRepository(db);
      await repo.saveSession(session('s1', DateTime.utc(2026, 10, 1), [set('a', 60, 8), set('b', 60, 8)]));
      await repo.saveSession(session('s1', DateTime.utc(2026, 10, 1), [set('a', 60, 8)]));
      expect((await repo.getSession('s1'))!.entries.single.sets.map((s) => s.id), ['a']);
      final raw = await (db.select(db.setEntries)..where((t) => t.id.equals('b'))).getSingle();
      expect(raw.deleted, isTrue);
      expect(raw.syncStatus, SyncStatus.pending);
    });

    test('last performance comes from the most recent other session', () async {
      final repo = DriftWorkoutRepository(db);
      await repo.saveSession(session('old', DateTime.utc(2026, 9, 1), [set('o1', 50, 10)]));
      await repo.saveSession(session('new', DateTime.utc(2026, 10, 1), [set('n1', 60, 8)]));
      expect((await repo.lastPerformance(exerciseId)).single.weightKg, 60);
      expect((await repo.lastPerformance(exerciseId, excludeSessionId: 'new')).single.weightKg, 50);
    });

    test('deleted sessions disappear from lists', () async {
      final repo = DriftWorkoutRepository(db);
      await repo.saveSession(session('s1', DateTime.utc(2026, 10, 1), [set('a', 60, 8)]));
      await repo.deleteSession('s1');
      expect(await repo.watchSessions().first, isEmpty);
      expect(await repo.getSession('s1'), isNull);
    });
  });

  test('daily activity upserts one row per day', () async {
    final repo = DriftActivityRepository(db);
    await repo.saveDay(const DayActivity(day: '2026-10-28', steps: 1000));
    await repo.saveDay(const DayActivity(day: '2026-10-28', steps: 4200, floors: 3));
    final days = await repo.watchDays(DateTime(2026, 10, 27), DateTime(2026, 10, 29)).first;
    expect(days.single.steps, 4200);
    expect(days.single.floors, 3);
  });

  test('achievements upsert by key', () async {
    final repo = DriftProgressRepository(db);
    await repo.saveAchievement(const AchievementProgress(key: 'first-workout', progress: 0.5));
    await repo.saveAchievement(AchievementProgress(key: 'first-workout', progress: 1, unlockedAt: DateTime.utc(2026)));
    final all = await repo.watchAchievements().first;
    expect(all.single.isUnlocked, isTrue);
  });

  test('profile is created once and persists preferences', () async {
    final repo = DriftProfileRepository(db);
    final first = await repo.get();
    expect(first.themeMode, AppThemeMode.dark);
    await repo.save(first.copyWith(themeMode: AppThemeMode.light, weightUnit: WeightUnit.lb));
    final again = await repo.get();
    expect(again.id, first.id);
    expect(again.themeMode, AppThemeMode.light);
    expect(again.weightUnit, WeightUnit.lb);
    expect((await db.select(db.usersProfile).get()).length, 1);
  });
}
