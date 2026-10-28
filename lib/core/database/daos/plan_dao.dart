import 'package:drift/drift.dart';

import '../app_database.dart';
import '../sync_columns.dart';
import '../tables/plan_tables.dart';

part 'plan_dao.g.dart';

@DriftAccessor(tables: [Plans, PlanDays])
class PlanDao extends DatabaseAccessor<AppDatabase> with _$PlanDaoMixin {
  PlanDao(super.attachedDatabase);

  static const _pending = Value(SyncStatus.pending);

  Stream<List<PlanRow>> watchPlans() => (select(plans)
        ..where((t) => t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.desc(t.active), (t) => OrderingTerm.asc(t.name)]))
      .watch();

  Future<PlanRow?> getPlan(String id) =>
      (select(plans)..where((t) => t.id.equals(id) & t.deleted.equals(false))).getSingleOrNull();

  Future<List<PlanDayRow>> daysFor(String planId) => (select(planDays)
        ..where((t) => t.planId.equals(planId) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.position)]))
      .get();

  /// Saves a plan and its days atomically; removed days are soft-deleted.
  Future<void> savePlanGraph(PlansCompanion plan, List<PlanDaysCompanion> days) {
    final now = Value(utcNow());
    return transaction(() async {
      await into(plans).insertOnConflictUpdate(plan.copyWith(updatedAt: now, syncStatus: _pending));
      final keep = days.map((d) => d.id.value).toSet();
      for (final old in await daysFor(plan.id.value)) {
        if (!keep.contains(old.id)) await attachedDatabase.softDelete(planDays, old.id);
      }
      for (final d in days) {
        await into(planDays).insertOnConflictUpdate(d.copyWith(updatedAt: now, syncStatus: _pending));
      }
    });
  }

  /// Makes [id] the only active plan.
  Future<void> setActive(String id) => transaction(() async {
        final now = Value(utcNow());
        await (update(plans)..where((t) => t.active.equals(true) & t.id.equals(id).not()))
            .write(PlansCompanion(active: const Value(false), updatedAt: now, syncStatus: _pending));
        await (update(plans)..where((t) => t.id.equals(id)))
            .write(PlansCompanion(active: const Value(true), startDate: now, updatedAt: now, syncStatus: _pending));
      });

  Future<void> deletePlan(String id) => transaction(() async {
        for (final d in await daysFor(id)) {
          await attachedDatabase.softDelete(planDays, d.id);
        }
        await attachedDatabase.softDelete(plans, id);
      });

  /// Prebuilt programs: deterministic ids, existing rows left untouched.
  Future<void> insertSeed(List<PlansCompanion> planRows, List<PlanDaysCompanion> dayRows) => batch((b) {
        b.insertAll(plans, planRows, mode: InsertMode.insertOrIgnore);
        b.insertAll(planDays, dayRows, mode: InsertMode.insertOrIgnore);
      });
}
