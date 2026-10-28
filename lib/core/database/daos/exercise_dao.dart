import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../app_database.dart';
import '../sync_columns.dart';
import '../tables/exercise_tables.dart';

part 'exercise_dao.g.dart';

@DriftAccessor(tables: [Exercises])
class ExerciseDao extends DatabaseAccessor<AppDatabase> with _$ExerciseDaoMixin {
  ExerciseDao(super.attachedDatabase);

  /// Filtered, name-sorted library. All filters are optional.
  Stream<List<ExerciseRow>> watchExercises({
    String? query,
    MuscleGroup? muscle,
    Equipment? equipment,
    Difficulty? difficulty,
    bool favoritesOnly = false,
  }) {
    final q = select(exercises)..where((t) => t.deleted.equals(false));
    if (query != null && query.trim().isNotEmpty) {
      q.where((t) => t.name.like('%${query.trim()}%'));
    }
    if (muscle != null) q.where((t) => t.primaryMuscle.equalsValue(muscle));
    if (equipment != null) q.where((t) => t.equipment.equalsValue(equipment));
    if (difficulty != null) q.where((t) => t.difficulty.equalsValue(difficulty));
    if (favoritesOnly) q.where((t) => t.isFavorite.equals(true));
    q.orderBy([(t) => OrderingTerm.asc(t.name)]);
    return q.watch();
  }

  Future<ExerciseRow?> getById(String id) =>
      (select(exercises)..where((t) => t.id.equals(id) & t.deleted.equals(false))).getSingleOrNull();

  Future<List<ExerciseRow>> getByIds(Iterable<String> ids) =>
      (select(exercises)..where((t) => t.id.isIn(ids))).get();

  Future<void> setFavorite(String id, {required bool favorite}) =>
      (update(exercises)..where((t) => t.id.equals(id))).write(
        ExercisesCompanion(
          isFavorite: Value(favorite),
          updatedAt: Value(utcNow()),
          syncStatus: const Value(SyncStatus.pending),
        ),
      );

  Future<void> upsert(ExercisesCompanion row) => into(exercises).insertOnConflictUpdate(
        row.copyWith(updatedAt: Value(utcNow()), syncStatus: const Value(SyncStatus.pending)),
      );

  /// Seed rows have deterministic ids; existing rows (and the user's
  /// favorites on them) are left untouched.
  Future<void> insertSeed(List<ExercisesCompanion> rows) =>
      batch((b) => b.insertAll(exercises, rows, mode: InsertMode.insertOrIgnore));

  Future<int> count() async {
    final c = exercises.id.count();
    final row = await (selectOnly(exercises)..addColumns([c])).getSingle();
    return row.read(c) ?? 0;
  }

  Future<void> softDeleteById(String id) => attachedDatabase.softDelete(exercises, id);
}
