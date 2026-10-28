import 'package:drift/drift.dart';

import '../app_database.dart';
import '../sync_columns.dart';
import '../tables/activity_tables.dart';

part 'activity_dao.g.dart';

@DriftAccessor(tables: [CardioSessions, RoutePoints, DailyActivity])
class ActivityDao extends DatabaseAccessor<AppDatabase> with _$ActivityDaoMixin {
  ActivityDao(super.attachedDatabase);

  static const _pending = Value(SyncStatus.pending);

  // ---- Cardio sessions -----------------------------------------------------

  Stream<List<CardioSessionRow>> watchCardio({DateTime? from, DateTime? to}) {
    // Unfinished sessions (still tracking, or abandoned by a crash) aren't history.
    final q = select(cardioSessions)..where((t) => t.deleted.equals(false) & t.endedAt.isNotNull());
    if (from != null) q.where((t) => t.startedAt.isBiggerOrEqualValue(from.toUtc()));
    if (to != null) q.where((t) => t.startedAt.isSmallerThanValue(to.toUtc()));
    q.orderBy([(t) => OrderingTerm.desc(t.startedAt)]);
    return q.watch();
  }

  Future<CardioSessionRow?> getCardio(String id) =>
      (select(cardioSessions)..where((t) => t.id.equals(id) & t.deleted.equals(false))).getSingleOrNull();

  Future<List<RoutePointRow>> routeFor(String sessionId) => (select(routePoints)
        ..where((t) => t.cardioSessionId.equals(sessionId) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.recordedAt)]))
      .get();

  Future<void> upsertCardio(CardioSessionsCompanion row) =>
      into(cardioSessions).insertOnConflictUpdate(row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending));

  /// Appends GPS points (called in batches while tracking).
  Future<void> addRoutePoints(List<RoutePointsCompanion> points) =>
      batch((b) => b.insertAll(routePoints, points, mode: InsertMode.insertOrIgnore));

  Future<void> deleteCardio(String id) => transaction(() async {
        final now = utcNow();
        // Route points are bulk-hidden in one statement; there can be thousands.
        await (update(routePoints)..where((t) => t.cardioSessionId.equals(id))).write(
          RoutePointsCompanion(deleted: const Value(true), updatedAt: Value(now), syncStatus: _pending),
        );
        await attachedDatabase.softDelete(cardioSessions, id);
      });

  // ---- Daily activity ------------------------------------------------------

  /// Inserts or updates the row for [row.day] (one row per calendar day).
  Future<void> upsertDay(DailyActivityCompanion row) {
    final stamped = row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending);
    return into(dailyActivity).insert(
      stamped,
      onConflict: DoUpdate((_) => stamped.copyWith(id: const Value.absent()), target: [dailyActivity.day]),
    );
  }

  /// Days in `[fromDay, toDay]` inclusive, as `yyyy-MM-dd` strings.
  Stream<List<DailyActivityRow>> watchDays(String fromDay, String toDay) => (select(dailyActivity)
        ..where((t) => t.day.isBetweenValues(fromDay, toDay) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.day)]))
      .watch();
}
