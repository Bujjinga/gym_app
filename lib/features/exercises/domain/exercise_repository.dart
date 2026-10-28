import 'exercise.dart';
import 'exercise_filter.dart';

abstract interface class ExerciseRepository {
  Stream<List<Exercise>> watch([ExerciseFilter filter = const ExerciseFilter()]);

  Future<Exercise?> getById(String id);

  Future<List<Exercise>> getByIds(Iterable<String> ids);

  Future<void> setFavorite(String id, {required bool favorite});

  /// Creates or updates a custom exercise (forces `isCustom: true`).
  Future<void> saveCustom(Exercise exercise);

  /// Only custom exercises can be deleted; bundled ones are ignored.
  Future<void> deleteCustom(String id);
}
