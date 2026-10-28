import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/workout/domain/planned_exercise.dart';
import '../../domain/pulse_enums.dart';
import '../../utils/ids.dart';
import '../app_database.dart';
import '../database_provider.dart';
import '../json_columns.dart';
import '../sync_columns.dart';

part 'seed_service.g.dart';

/// Loads the bundled exercise library and prebuilt programs into the
/// database. Safe to run on every launch: rows have deterministic ids and
/// existing rows (with the user's favorites/edits) are never overwritten.
@Riverpod(keepAlive: true)
Future<void> seedDatabase(Ref ref) => SeedService(ref.watch(appDatabaseProvider)).run();

class SeedService {
  SeedService(this._db, {AssetBundle? bundle}) : _bundle = bundle ?? rootBundle;

  final AppDatabase _db;
  final AssetBundle _bundle;

  static const exercisesAsset = 'assets/seed/exercises.json';
  static const programsAsset = 'assets/seed/programs.json';

  // Bundled rows exist on every device, so they never need pushing.
  static const _synced = Value(SyncStatus.synced);

  Future<void> run() async {
    await _seedExercises();
    await _seedPrograms();
  }

  Future<void> _seedExercises() async {
    final json = jsonDecode(await _bundle.loadString(exercisesAsset)) as Map<String, dynamic>;
    final rows = [
      for (final e in (json['exercises'] as List).cast<Map<String, dynamic>>())
        ExercisesCompanion.insert(
          id: Value(seedId('exercise', e['slug'] as String)),
          slug: Value(e['slug'] as String),
          name: e['name'] as String,
          primaryMuscle: MuscleGroup.values.byName(e['primaryMuscle'] as String),
          secondaryMuscles: Value(encodeEnumList(
            (e['secondaryMuscles'] as List).cast<String>().map(MuscleGroup.values.byName),
          )),
          equipment: Equipment.values.byName(e['equipment'] as String),
          difficulty: Difficulty.values.byName(e['difficulty'] as String),
          movementPattern: MovementPattern.values.byName(e['movementPattern'] as String),
          instructions: Value(encodeStringList((e['instructions'] as List).cast<String>())),
          mistakes: Value(encodeStringList((e['mistakes'] as List).cast<String>())),
          syncStatus: _synced,
        ),
    ];
    await _db.exerciseDao.insertSeed(rows);
  }

  Future<void> _seedPrograms() async {
    final json = jsonDecode(await _bundle.loadString(programsAsset)) as Map<String, dynamic>;
    final plans = <PlansCompanion>[];
    final days = <PlanDaysCompanion>[];
    for (final p in (json['programs'] as List).cast<Map<String, dynamic>>()) {
      final planSlug = p['slug'] as String;
      final planId = seedId('plan', planSlug);
      plans.add(PlansCompanion.insert(
        id: Value(planId),
        name: p['name'] as String,
        description: Value(p['description'] as String?),
        isPrebuilt: const Value(true),
        weeks: Value(p['weeks'] as int?),
        syncStatus: _synced,
      ));
      for (final (i, d) in (p['days'] as List).cast<Map<String, dynamic>>().indexed) {
        final exercises = [
          for (final e in (d['exercises'] as List).cast<Map<String, dynamic>>())
            PlannedExercise(
              exerciseId: seedId('exercise', e['exercise'] as String),
              sets: e['sets'] as int,
              reps: e['reps'] as int,
              repsMax: e['repsMax'] as int?,
              restSeconds: e['rest'] as int,
            ).toJson(),
        ];
        days.add(PlanDaysCompanion.insert(
          id: Value(seedId('planDay', '$planSlug/$i')),
          planId: planId,
          position: i,
          name: d['name'] as String,
          weekday: Value(d['weekday'] as int?),
          exercises: Value(jsonEncode(exercises)),
          syncStatus: _synced,
        ));
      }
    }
    await _db.planDao.insertSeed(plans, days);
  }
}
