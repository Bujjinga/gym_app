import 'plan.dart';

abstract interface class PlanRepository {
  /// Plan headers (no days); the active plan first.
  Stream<List<Plan>> watchPlans();

  /// Plan with its days in order.
  Future<Plan?> getPlan(String id);

  /// Saves the plan and its days; days missing from [plan.days] are removed.
  Future<void> savePlan(Plan plan);

  /// Makes [id] the single active plan and stamps its start date.
  Future<void> setActive(String id);

  Future<void> deletePlan(String id);
}
