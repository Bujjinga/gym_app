import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/app/app.dart';
import 'package:gym_app/features/workout/application/active_workout_controller.dart';
import 'package:gym_app/features/workout/application/live_workout_presence.dart';
import 'package:integration_test/integration_test.dart';
import 'package:live_activities/live_activities.dart';

import 'demo_data.dart';

/// Checks that need a real device or simulator:
///   flutter test integration_test/device_checks_test.dart -d "iPhone 17 Pro Max"
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> pumpFor(WidgetTester tester, int frames) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  testWidgets('a11y guidelines hold with five weeks of data and real fonts', (tester) async {
    final semantics = tester.ensureSemantics();
    final container = await demoContainer();
    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const PulseApp()));
    await pumpFor(tester, 30);
    await GoogleFonts.pendingFonts();

    for (final tab in ['Home', 'Train', 'Activity', 'Progress', 'Profile']) {
      await tester.tap(find.bySemanticsLabel(tab).first);
      await pumpFor(tester, 20); // Home never settles (animated background)
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline), reason: '$tab tap targets');
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline), reason: '$tab tap targets');
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline), reason: '$tab labels');
      await expectLater(tester, meetsGuideline(textContrastGuideline), reason: '$tab contrast');
    }
    semantics.dispose();
  });

  testWidgets('a live workout shows a Live Activity and removes it when finished', (tester) async {
    final container = await demoContainer();
    startLiveWorkoutPresence(container);
    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const PulseApp()));
    await pumpFor(tester, 10);

    await container.read(activeWorkoutProvider.notifier).startEmpty(name: 'Push');
    await tester.runAsync(() => Future<void>.delayed(const Duration(seconds: 2)));
    final live = LiveActivities();
    expect(await live.getAllActivitiesIds(), hasLength(1));

    await container.read(activeWorkoutProvider.notifier).discard();
    await tester.runAsync(() => Future<void>.delayed(const Duration(seconds: 2)));
    expect(await live.getAllActivitiesIds(), isEmpty);
  }, skip: !Platform.isIOS);
}
