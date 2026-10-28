import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../workout/application/workout_providers.dart';
import '../data/drift_plan_repository.dart';
import '../domain/plan.dart';
import '../domain/plan_day.dart';
import '../domain/plan_schedule.dart';

part 'plan_providers.g.dart';

@riverpod
Stream<List<Plan>> planList(Ref ref) => ref.watch(planRepositoryProvider).watchPlans();

@riverpod
Future<Plan?> planById(Ref ref, String id) => ref.watch(planRepositoryProvider).getPlan(id);

/// The active plan with its days, or null.
@riverpod
Future<Plan?> activePlan(Ref ref) async {
  final plans = await ref.watch(planListProvider.future);
  final active = plans.where((p) => p.active).firstOrNull;
  return active == null ? null : ref.watch(planRepositoryProvider).getPlan(active.id);
}

/// What to train next from the active plan (refreshes as workouts finish).
@riverpod
Future<({Plan plan, PlanDay day, bool isToday})?> nextWorkout(Ref ref) async {
  final plan = await ref.watch(activePlanProvider.future);
  if (plan == null) return null;
  final dayIds = plan.days.map((d) => d.id).toSet();
  final sessions = await ref.watch(workoutHistoryProvider.future);
  final completed = sessions.where((s) => s.endedAt != null && dayIds.contains(s.planDayId)).length;
  final next = nextPlanDay(plan, DateTime.now(), completedPlanWorkouts: completed);
  return next == null ? null : (plan: plan, day: next.day, isToday: next.isToday);
}
