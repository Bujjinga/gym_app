import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../domain/activity_repository.dart';
import '../domain/cardio_session.dart';
import '../domain/day_activity.dart';
import '../domain/route_point.dart';

part 'drift_activity_repository.g.dart';

@Riverpod(keepAlive: true)
ActivityRepository activityRepository(Ref ref) => DriftActivityRepository(ref.watch(appDatabaseProvider));

class DriftActivityRepository implements ActivityRepository {
  DriftActivityRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<CardioSession>> watchCardio({DateTime? from, DateTime? to}) =>
      _db.activityDao.watchCardio(from: from, to: to).map((rows) => rows.map(_cardio).toList());

  @override
  Future<CardioSession?> getCardio(String id) async {
    final row = await _db.activityDao.getCardio(id);
    return row == null ? null : _cardio(row);
  }

  @override
  Future<List<RoutePoint>> route(String sessionId) async => [
        for (final p in await _db.activityDao.routeFor(sessionId))
          RoutePoint(
            id: p.id,
            recordedAt: p.recordedAt,
            latitude: p.latitude,
            longitude: p.longitude,
            altitudeM: p.altitudeM,
            speedMps: p.speedMps,
            accuracyM: p.accuracyM,
            heartRate: p.heartRate,
          ),
      ];

  @override
  Future<void> saveCardio(CardioSession s) => _db.activityDao.upsertCardio(
        CardioSessionsCompanion.insert(
          id: Value(s.id),
          type: s.type,
          source: s.source,
          startedAt: s.startedAt.toUtc(),
          endedAt: Value(s.endedAt?.toUtc()),
          durationSec: Value(s.durationSec),
          distanceM: Value(s.distanceM),
          caloriesKcal: Value(s.caloriesKcal),
          elevationGainM: Value(s.elevationGainM),
          avgHeartRate: Value(s.avgHeartRate),
          maxHeartRate: Value(s.maxHeartRate),
          steps: Value(s.steps),
          notes: Value(s.notes),
        ),
      );

  @override
  Future<void> addRoutePoints(String sessionId, List<RoutePoint> points) => _db.activityDao.addRoutePoints([
        for (final p in points)
          RoutePointsCompanion.insert(
            id: Value(p.id),
            cardioSessionId: sessionId,
            recordedAt: p.recordedAt.toUtc(),
            latitude: p.latitude,
            longitude: p.longitude,
            altitudeM: Value(p.altitudeM),
            speedMps: Value(p.speedMps),
            accuracyM: Value(p.accuracyM),
            heartRate: Value(p.heartRate),
          ),
      ]);

  @override
  Future<void> deleteCardio(String id) => _db.activityDao.deleteCardio(id);

  @override
  Future<void> saveDay(DayActivity d) => _db.activityDao.upsertDay(
        DailyActivityCompanion.insert(
          day: d.day,
          steps: Value(d.steps),
          distanceM: Value(d.distanceM),
          floors: Value(d.floors),
          activeKcal: Value(d.activeKcal),
          exerciseMin: Value(d.exerciseMin),
          restingHeartRate: Value(d.restingHeartRate),
          avgHeartRate: Value(d.avgHeartRate),
          hrvMs: Value(d.hrvMs),
          vo2Max: Value(d.vo2Max),
          sleepMinutes: Value(d.sleepMinutes),
          source: Value(d.source),
        ),
      );

  @override
  Stream<List<DayActivity>> watchDays(DateTime from, DateTime to) =>
      _db.activityDao.watchDays(DayActivity.keyFor(from), DayActivity.keyFor(to)).map((rows) => [
            for (final r in rows)
              DayActivity(
                day: r.day,
                steps: r.steps,
                distanceM: r.distanceM,
                floors: r.floors,
                activeKcal: r.activeKcal,
                exerciseMin: r.exerciseMin,
                restingHeartRate: r.restingHeartRate,
                avgHeartRate: r.avgHeartRate,
                hrvMs: r.hrvMs,
                vo2Max: r.vo2Max,
                sleepMinutes: r.sleepMinutes,
                source: r.source,
              ),
          ]);

  static CardioSession _cardio(CardioSessionRow r) => CardioSession(
        id: r.id,
        type: r.type,
        source: r.source,
        startedAt: r.startedAt,
        endedAt: r.endedAt,
        durationSec: r.durationSec,
        distanceM: r.distanceM,
        caloriesKcal: r.caloriesKcal,
        elevationGainM: r.elevationGainM,
        avgHeartRate: r.avgHeartRate,
        maxHeartRate: r.maxHeartRate,
        steps: r.steps,
        notes: r.notes,
      );
}
