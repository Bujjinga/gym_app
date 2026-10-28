import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/database/json_columns.dart';
import '../../../core/domain/pulse_enums.dart';
import '../domain/exercise.dart';
import '../domain/exercise_filter.dart';
import '../domain/exercise_repository.dart';

part 'drift_exercise_repository.g.dart';

@Riverpod(keepAlive: true)
ExerciseRepository exerciseRepository(Ref ref) => DriftExerciseRepository(ref.watch(appDatabaseProvider));

class DriftExerciseRepository implements ExerciseRepository {
  DriftExerciseRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<Exercise>> watch([ExerciseFilter filter = const ExerciseFilter()]) => _db.exerciseDao
      .watchExercises(
        query: filter.query,
        muscle: filter.muscle,
        equipment: filter.equipment,
        difficulty: filter.difficulty,
        favoritesOnly: filter.favoritesOnly,
      )
      .map((rows) => rows.map(toDomain).toList());

  @override
  Future<Exercise?> getById(String id) async {
    final row = await _db.exerciseDao.getById(id);
    return row == null ? null : toDomain(row);
  }

  @override
  Future<List<Exercise>> getByIds(Iterable<String> ids) async =>
      (await _db.exerciseDao.getByIds(ids)).map(toDomain).toList();

  @override
  Future<void> setFavorite(String id, {required bool favorite}) =>
      _db.exerciseDao.setFavorite(id, favorite: favorite);

  @override
  Future<void> saveCustom(Exercise e) => _db.exerciseDao.upsert(toCompanion(e.copyWith(isCustom: true)));

  @override
  Future<void> deleteCustom(String id) async {
    final row = await _db.exerciseDao.getById(id);
    if (row != null && row.isCustom) await _db.exerciseDao.softDeleteById(id);
  }

  static Exercise toDomain(ExerciseRow r) => Exercise(
        id: r.id,
        name: r.name,
        primaryMuscle: r.primaryMuscle,
        secondaryMuscles: decodeEnumList(r.secondaryMuscles, MuscleGroup.values),
        equipment: r.equipment,
        difficulty: r.difficulty,
        movementPattern: r.movementPattern,
        instructions: decodeStringList(r.instructions),
        mistakes: decodeStringList(r.mistakes),
        animationAsset: r.animationAsset,
        isCustom: r.isCustom,
        isFavorite: r.isFavorite,
      );

  static ExercisesCompanion toCompanion(Exercise e, {String? slug}) => ExercisesCompanion.insert(
        id: Value(e.id),
        slug: Value(slug),
        name: e.name,
        primaryMuscle: e.primaryMuscle,
        secondaryMuscles: Value(encodeEnumList(e.secondaryMuscles)),
        equipment: e.equipment,
        difficulty: e.difficulty,
        movementPattern: e.movementPattern,
        instructions: Value(encodeStringList(e.instructions)),
        mistakes: Value(encodeStringList(e.mistakes)),
        animationAsset: Value(e.animationAsset),
        isCustom: Value(e.isCustom),
        isFavorite: Value(e.isFavorite),
      );
}
