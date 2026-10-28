import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/database/app_database.dart';
import 'package:gym_app/core/database/database_provider.dart';
import 'package:gym_app/core/database/seed/seed_service.dart';
import 'package:gym_app/core/utils/ids.dart';
import 'package:gym_app/features/home/domain/dashboard_layout.dart';
import 'package:gym_app/features/workout/application/active_workout_controller.dart';
import 'package:gym_app/features/workout/data/drift_workout_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppDatabase db;
  ProviderContainer container() {
    final c = ProviderContainer(overrides: [appDatabaseProvider.overrideWithValue(db)]);
    addTearDown(c.dispose);
    return c;
  }

  // Lets unawaited persistence writes land.
  Future<void> settle() => Future<void>.delayed(const Duration(milliseconds: 50));

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await SeedService(db).run();
  });
  tearDown(() => db.close());

  final bench = seedId('exercise', 'barbell-bench-press');
  final row = seedId('exercise', 'barbell-bent-over-row');

  test('log a set, survive a restart, finish with a PR', () async {
    final c = container();
    expect(await c.read(activeWorkoutProvider.future), isNull);
    final ctrl = c.read(activeWorkoutProvider.notifier);
    await ctrl.startEmpty(name: 'Push');
    await ctrl.addExercises([bench]);
    final entry = c.read(activeWorkoutProvider).value!.session.entries.single;
    final set = entry.sets.single;
    ctrl.updateSet(entry.id, set.id, (s) => s.copyWith(weightKg: 60, reps: 8));
    ctrl.toggleSetComplete(entry.id, set.id);
    expect(c.read(activeWorkoutProvider).value!.restEndsAt, isNotNull, reason: 'rest timer starts');
    await settle();

    // A fresh container (app relaunch) resumes the unfinished session.
    final resumed = await container().read(activeWorkoutProvider.future);
    expect(resumed!.session.entries.single.sets.single.isCompleted, isTrue);
    expect(resumed.session.entries.single.sets.single.weightKg, 60);

    final result = await ctrl.finish();
    expect(result!.records, isNotEmpty);
    final repo = DriftWorkoutRepository(db);
    final saved = (await repo.getSession(result.sessionId))!;
    expect(saved.endedAt, isNotNull);
    expect(saved.totalVolumeKg, 480);
    expect(await repo.unfinishedSession(), isNull);
    expect(c.read(activeWorkoutProvider).value, isNull);
  });

  test('second session pre-fills from last time and only new bests are PRs', () async {
    final c = container();
    final ctrl = c.read(activeWorkoutProvider.notifier);
    await c.read(activeWorkoutProvider.future);
    await ctrl.startEmpty(name: 'A');
    await ctrl.addExercises([bench]);
    var e = c.read(activeWorkoutProvider).value!.session.entries.single;
    ctrl.updateSet(e.id, e.sets.single.id, (s) => s.copyWith(weightKg: 80, reps: 5));
    ctrl.toggleSetComplete(e.id, e.sets.single.id);
    await ctrl.finish();

    await ctrl.startEmpty(name: 'B');
    await ctrl.addExercises([bench]);
    e = c.read(activeWorkoutProvider).value!.session.entries.single;
    expect(e.sets.single.weightKg, 80, reason: 'pre-filled from last time');
    ctrl.updateSet(e.id, e.sets.single.id, (s) => s.copyWith(weightKg: 70, reps: 5));
    ctrl.toggleSetComplete(e.id, e.sets.single.id);
    final result = await ctrl.finish();
    expect(result!.records, isEmpty, reason: '70×5 beats nothing from 80×5');
  });

  test('no rest between exercises of a superset', () async {
    final c = container();
    final ctrl = c.read(activeWorkoutProvider.notifier);
    await c.read(activeWorkoutProvider.future);
    await ctrl.startEmpty(name: 'SS');
    await ctrl.addExercises([bench, row]);
    final first = c.read(activeWorkoutProvider).value!.session.entries.first;
    ctrl.toggleSupersetWithNext(first.id);
    final entries = c.read(activeWorkoutProvider).value!.session.entries;
    expect(entries[0].supersetGroup, isNotNull);
    expect(entries[0].supersetGroup, entries[1].supersetGroup);

    ctrl.toggleSetComplete(entries[0].id, entries[0].sets.first.id);
    expect(c.read(activeWorkoutProvider).value!.restEndsAt, isNull);
    ctrl.toggleSetComplete(entries[1].id, entries[1].sets.first.id);
    expect(c.read(activeWorkoutProvider).value!.restEndsAt, isNotNull);
    await ctrl.discard();
    await settle();
  });

  group('dashboard layout', () {
    test('round-trips order and hidden cards', () {
      final layout = DashboardLayout.fromStored(['weekly', '!rings', 'stats']);
      expect(layout.order.take(3), [DashboardCard.weekly, DashboardCard.rings, DashboardCard.stats]);
      expect(layout.hidden, {DashboardCard.rings});
      expect(layout.order.length, DashboardCard.values.length, reason: 'missing cards appended');
      expect(DashboardLayout.fromStored(layout.toStored()).toStored(), layout.toStored());
    });

    test('ignores unknown names and toggles visibility', () {
      final layout = DashboardLayout.fromStored(['bogus', 'streak']).toggle(DashboardCard.streak);
      expect(layout.visible, isNot(contains(DashboardCard.streak)));
      expect(layout.move(0, 2).order[2], DashboardCard.streak);
    });
  });
}
