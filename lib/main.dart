import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/quick_actions_setup.dart';
import 'core/database/seed/seed_service.dart';
import 'core/platform/desktop_window.dart';
import 'features/activity/application/step_counter_service.dart';
import 'features/health/data/health_sync_service.dart';
import 'features/home/application/home_widget_sync.dart';
import 'features/reminders/application/reminder_scheduler.dart';
import 'features/workout/application/live_workout_presence.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDesktopWindow();
  final container = ProviderContainer();
  // Seed in the background so startup isn't blocked; failures are reported, not fatal.
  unawaited(container.read(seedDatabaseProvider.future).catchError((Object e, StackTrace st) {
    FlutterError.reportError(FlutterErrorDetails(exception: e, stack: st, library: 'seed'));
  }));
  unawaited(container.read(stepCounterProvider).start());
  unawaited(container.read(healthSyncProvider).syncRecentDays());
  // System integration; each one is a no-op where the platform can't do it.
  startReminders(container);
  startLiveWorkoutPresence(container);
  startHomeWidgetSync(container);
  startQuickActions(container);
  runApp(UncontrolledProviderScope(container: container, child: const PulseApp()));
}
