import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../achievements/data/drift_progress_repository.dart';
import '../../achievements/domain/personal_record.dart';
import '../../workout/data/drift_workout_repository.dart';
import '../../workout/domain/workout_repository.dart';
import '../data/drift_exercise_repository.dart';
import '../domain/exercise.dart';
import '../domain/exercise_filter.dart';

part 'exercise_providers.g.dart';

/// Search/filter state of the library screen (reset when it closes).
@riverpod
class ExerciseFilterController extends _$ExerciseFilterController {
  @override
  ExerciseFilter build() => const ExerciseFilter();

  void set(ExerciseFilter filter) => state = filter;
}

@riverpod
Stream<List<Exercise>> exerciseList(Ref ref) =>
    ref.watch(exerciseRepositoryProvider).watch(ref.watch(exerciseFilterControllerProvider));

@riverpod
Future<Exercise?> exerciseById(Ref ref, String id) => ref.watch(exerciseRepositoryProvider).getById(id);

@riverpod
Future<List<ExerciseHistoryPoint>> exerciseHistory(Ref ref, String id) =>
    ref.watch(workoutRepositoryProvider).history(id);

@riverpod
Stream<List<PersonalRecord>> exerciseRecords(Ref ref, String id) =>
    ref.watch(progressRepositoryProvider).watchRecords(exerciseId: id);
