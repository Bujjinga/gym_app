import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/timezone.dart' as tz;

import '../domain/reminder_plan.dart';

part 'notification_service.g.dart';

@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) => NotificationService();

/// Thin wrapper over flutter_local_notifications for all four platforms.
/// Every call is best-effort: a missing permission or unsupported platform
/// silently does nothing.
class NotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();
  Future<bool>? _ready;

  static const goalReachedId = 400;
  static const liveWorkoutId = 500;

  static const _reminders = NotificationDetails(
    android: AndroidNotificationDetails('reminders', 'Reminders', channelDescription: 'Workout, streak and goal reminders'),
    iOS: DarwinNotificationDetails(),
    macOS: DarwinNotificationDetails(),
  );

  Future<bool> _init() => _ready ??= () async {
        try {
          return await _plugin.initialize(
                settings: const InitializationSettings(
                  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
                  // Permission is asked from Settings/onboarding, not at launch.
                  iOS: DarwinInitializationSettings(
                      requestAlertPermission: false, requestBadgePermission: false, requestSoundPermission: false),
                  macOS: DarwinInitializationSettings(
                      requestAlertPermission: false, requestBadgePermission: false, requestSoundPermission: false),
                  windows: WindowsInitializationSettings(
                      appName: 'PULSE', appUserModelId: 'io.pulse.app', guid: '5d3c1b8e-7a4f-4e2b-9c61-2f0a8d4e6b17'),
                ),
              ) ??
              false;
        } catch (e) {
          debugPrint('Notifications unavailable: $e');
          return false;
        }
      }();

  /// Asks the OS for permission (no-op where none is needed). Returns whether granted.
  Future<bool> requestPermission() async {
    if (!await _init()) return false;
    final granted = switch (defaultTargetPlatform) {
      TargetPlatform.android => await _plugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission(),
      TargetPlatform.iOS => await _plugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, sound: true),
      TargetPlatform.macOS => await _plugin
          .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, sound: true),
      _ => true,
    };
    return granted ?? false;
  }

  /// Replaces every pending reminder with [plan]; [text] gives (title, body).
  Future<void> schedule(List<PlannedReminder> plan, (String, String) Function(PlannedReminder r) text) async {
    if (!await _init()) return;
    try {
      await _plugin.cancelAllPendingNotifications();
      for (final r in plan) {
        final (title, body) = text(r);
        await _plugin.zonedSchedule(
          id: r.id,
          title: title,
          body: body,
          // A one-shot absolute instant, so UTC is exact without a tz database.
          scheduledDate: tz.TZDateTime.from(r.at, tz.UTC),
          notificationDetails: _reminders,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
      }
    } catch (e) {
      debugPrint('Scheduling reminders failed: $e');
    }
  }

  Future<void> cancelReminders() async {
    if (await _init()) await _plugin.cancelAllPendingNotifications();
  }

  Future<void> show(int id, String title, String body) async {
    if (!await _init()) return;
    await _plugin.show(id: id, title: title, body: body, notificationDetails: _reminders);
  }

  /// Android "workout in progress" notification: a running clock since
  /// [startedAt], or a countdown to [restEndsAt] while resting.
  Future<void> showLiveWorkout({
    required String title,
    required String body,
    required DateTime startedAt,
    DateTime? restEndsAt,
  }) async {
    if (!await _init()) return;
    await _plugin.show(
      id: liveWorkoutId,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          'live_workout',
          'Workout in progress',
          channelDescription: 'Shows the running workout and rest timer',
          importance: Importance.low,
          priority: Priority.low,
          ongoing: true,
          autoCancel: false,
          onlyAlertOnce: true,
          showWhen: true,
          usesChronometer: true,
          chronometerCountDown: restEndsAt != null,
          when: (restEndsAt ?? startedAt).millisecondsSinceEpoch,
        ),
      ),
    );
  }

  Future<void> cancel(int id) async {
    if (await _init()) await _plugin.cancel(id: id);
  }
}
