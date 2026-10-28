import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../workout/data/drift_workout_repository.dart';
import '../domain/plan.dart';
import '../domain/plan_day.dart';
import '../domain/plan_repository.dart';

part 'drift_plan_repository.g.dart';

@Riverpod(keepAlive: true)
PlanRepository planRepository(Ref ref) => DriftPlanRepository(ref.watch(appDatabaseProvider));

class DriftPlanRepository implements PlanRepository {
  DriftPlanRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<Plan>> watchPlans() => _db.planDao.watchPlans().map((rows) => rows.map(_header).toList());

  @override
  Future<Plan?> getPlan(String id) async {
    final row = await _db.planDao.getPlan(id);
    if (row == null) return null;
    final days = await _db.planDao.daysFor(id);
    return _header(row).copyWith(
      days: [
        for (final d in days)
          PlanDay(
            id: d.id,
            name: d.name,
            weekday: d.weekday,
            exercises: DriftWorkoutRepository.decodePlanned(d.exercises),
          ),
      ],
    );
  }

  @override
  Future<void> savePlan(Plan p) => _db.planDao.savePlanGraph(toCompanion(p), daysToCompanions(p));

  @override
  Future<void> setActive(String id) => _db.planDao.setActive(id);

  @override
  Future<void> deletePlan(String id) => _db.planDao.deletePlan(id);

  static Plan _header(PlanRow r) => Plan(
        id: r.id,
        name: r.name,
        description: r.description,
        isPrebuilt: r.isPrebuilt,
        active: r.active,
        startDate: r.startDate,
        weeks: r.weeks,
      );

  static PlansCompanion toCompanion(Plan p) => PlansCompanion.insert(
        id: Value(p.id),
        name: p.name,
        description: Value(p.description),
        isPrebuilt: Value(p.isPrebuilt),
        active: Value(p.active),
        startDate: Value(p.startDate?.toUtc()),
        weeks: Value(p.weeks),
      );

  static List<PlanDaysCompanion> daysToCompanions(Plan p) => [
        for (final (i, d) in p.days.indexed)
          PlanDaysCompanion.insert(
            id: Value(d.id),
            planId: p.id,
            position: i,
            name: d.name,
            weekday: Value(d.weekday),
            exercises: Value(DriftWorkoutRepository.encodePlanned(d.exercises)),
          ),
      ];
}
