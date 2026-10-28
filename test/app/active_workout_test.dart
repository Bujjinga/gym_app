import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gym_app/core/database/app_database.dart';
import 'package:gym_app/core/database/database_provider.dart';
import 'package:gym_app/core/database/seed/seed_service.dart';
import 'package:gym_app/core/design_system/design_system.dart';
import 'package:gym_app/features/exercises/data/drift_exercise_repository.dart';
import 'package:gym_app/features/workout/application/active_workout_controller.dart';
import 'package:gym_app/features/workout/presentation/active_workout_screen.dart';
import 'package:gym_app/core/domain/pulse_enums.dart';
import 'package:gym_app/features/workout/data/drift_workout_repository.dart';
import 'package:gym_app/features/workout/domain/exercise_entry.dart';
import 'package:gym_app/features/workout/domain/set_entry.dart';
import 'package:gym_app/features/workout/domain/workout_session.dart';
import 'package:gym_app/l10n/gen/app_localizations.dart';

/// Regression: adding an exercise crashed the card layout (IntrinsicHeight around a LayoutBuilder).
void main() {
  for (final manual in [false, true]) {
    testWidgets('adding exercises renders their cards (manual: $manual)', (tester) async {
      tester.view.physicalSize = const Size(400, 860);
      tester.view.devicePixelRatio = 1;
      final container = ProviderContainer(overrides: [
        appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory())),
      ]);
      await tester.runAsync(() async {
        await container.read(seedDatabaseProvider.future);
        await container.read(activeWorkoutProvider.future);
        await container.read(activeWorkoutProvider.notifier).startEmpty(name: 'W', manual: manual);
      });
      await tester.pumpWidget(UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: PulseTheme.dark(),
          localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
          home: const ActiveWorkoutScreen(),
        ),
      ));
      await tester.pump();
      final ids = await tester.runAsync(() async {
        final all = await container.read(exerciseRepositoryProvider).watch().first;
        return all.take(2).map((e) => e.id).toList();
      });
      await tester.runAsync(() => container.read(activeWorkoutProvider.notifier).addExercises(ids!));
      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 300));
      }
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 700)));
    });
  }

  test('a double tap on start creates one workout', () async {
    final container = ProviderContainer(overrides: [
      appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory())),
    ]);
    addTearDown(container.dispose);
    await container.read(activeWorkoutProvider.future);
    final ctrl = container.read(activeWorkoutProvider.notifier);
    await Future.wait([ctrl.startEmpty(name: 'A'), ctrl.startEmpty(name: 'B')]);
    expect(container.read(activeWorkoutProvider).value!.session.name, 'A');
    expect((await container.read(workoutRepositoryProvider).watchSessions().first).length, 1);
  });

  test('an exercise last done with warm-ups only still gets a set', () async {
    final container = ProviderContainer(overrides: [
      appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory())),
    ]);
    addTearDown(container.dispose);
    await container.read(seedDatabaseProvider.future);
    final id = (await container.read(exerciseRepositoryProvider).watch().first).first.id;
    final now = DateTime.now();
    await container.read(workoutRepositoryProvider).saveSession(WorkoutSession(
          id: 'old',
          name: 'Old',
          startedAt: now.subtract(const Duration(days: 1, hours: 1)),
          endedAt: now.subtract(const Duration(days: 1)),
          entries: [
            ExerciseEntry(id: 'e', exerciseId: id, sets: [
              SetEntry(id: 's', type: SetType.warmup, weightKg: 20, reps: 10, completedAt: now.subtract(const Duration(days: 1))),
            ]),
          ],
        ));
    await container.read(activeWorkoutProvider.future);
    final ctrl = container.read(activeWorkoutProvider.notifier);
    await ctrl.startEmpty(name: 'W');
    await ctrl.addExercises([id]);
    expect(container.read(activeWorkoutProvider).value!.session.entries.single.sets, hasLength(1));
  });
}
