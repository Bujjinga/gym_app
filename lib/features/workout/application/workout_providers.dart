import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../achievements/data/drift_progress_repository.dart';
import '../../achievements/domain/personal_record.dart';
import '../../exercises/data/drift_exercise_repository.dart';
import '../../exercises/domain/exercise.dart';
import '../data/drift_workout_repository.dart';
import '../domain/workout_session.dart';
import '../domain/workout_template.dart';

part 'workout_providers.g.dart';

/// Finished and in-progress session headers, newest first.
@riverpod
Stream<List<WorkoutSession>> workoutHistory(Ref ref) => ref.watch(workoutRepositoryProvider).watchSessions();

@riverpod
Stream<List<WorkoutTemplate>> workoutTemplates(Ref ref) => ref.watch(workoutRepositoryProvider).watchTemplates();

@riverpod
Future<WorkoutSession?> workoutSession(Ref ref, String id) => ref.watch(workoutRepositoryProvider).getSession(id);

@riverpod
Stream<List<PersonalRecord>> sessionRecords(Ref ref, String sessionId) => ref
    .watch(progressRepositoryProvider)
    .watchRecords()
    .map((all) => all.where((r) => r.sessionId == sessionId).toList());

/// Exercise details for a set of ids (comma-joined key keeps the family stable).
@riverpod
Future<Map<String, Exercise>> exercisesByIds(Ref ref, String joinedIds) async {
  final ids = joinedIds.split(',').where((s) => s.isNotEmpty);
  final list = await ref.watch(exerciseRepositoryProvider).getByIds(ids);
  return {for (final e in list) e.id: e};
}
