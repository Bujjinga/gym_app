import 'cardio_session.dart';
import 'day_activity.dart';
import 'route_point.dart';

abstract interface class ActivityRepository {
  /// Cardio sessions, newest first, optionally within a date range.
  Stream<List<CardioSession>> watchCardio({DateTime? from, DateTime? to});

  Future<CardioSession?> getCardio(String id);

  /// Route of a session in recording order (for maps and replay).
  Future<List<RoutePoint>> route(String sessionId);

  Future<void> saveCardio(CardioSession session);

  /// Appends GPS points to a session while it is being tracked.
  Future<void> addRoutePoints(String sessionId, List<RoutePoint> points);

  Future<void> deleteCardio(String id);

  /// Creates or replaces the row for [day.day].
  Future<void> saveDay(DayActivity day);

  /// Days between two local dates, inclusive.
  Stream<List<DayActivity>> watchDays(DateTime from, DateTime to);
}
