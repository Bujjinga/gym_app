import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/app/app.dart';
import 'package:gym_app/app/router.dart';
import 'package:gym_app/features/activity/data/drift_activity_repository.dart';
import 'package:integration_test/integration_test.dart';

import 'demo_data.dart';

/// Store screenshots with demo data. Run on each store device size, e.g.:
///   flutter drive --driver=test_driver/screenshot_driver.dart \
///     --target=integration_test/screenshots_test.dart -d "iPhone 17 Pro Max"
/// Images land in `screenshots/<width>x<height>/`.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('store screenshots', (tester) async {
    final container = await demoContainer();
    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const PulseApp()));
    final size = tester.view.physicalSize;
    final folder = '${size.width.round()}x${size.height.round()}';
    final router = container.read(routerProvider);
    if (Platform.isAndroid) await binding.convertFlutterSurfaceToImage();

    // Home animates forever, so wait a fixed time instead of settling.
    Future<void> shot(String name) async {
      for (var i = 0; i < 30; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await GoogleFonts.pendingFonts();
      await tester.pump(const Duration(milliseconds: 300));
      await binding.takeScreenshot('$folder/$name');
    }

    await shot('01_home');
    // Via the router, so it works with the bottom bar, rail and sidebar layouts alike.
    for (final (i, (tab, location)) in [
      ('train', const TrainRoute().location),
      ('activity', const ActivityRoute().location),
      ('progress', const ProgressRoute().location),
    ].indexed) {
      router.go(location);
      await shot('0${i + 2}_$tab');
    }
    router.push<void>(const AnalyticsRoute().location);
    await shot('05_analytics');
    final run = (await container.read(activityRepositoryProvider).watchCardio().first).first;
    router.pop();
    router.push<void>(CardioDetailRoute(id: run.id).location);
    await shot('06_run');
    router.pop();
    router.push<void>(const MonthlyRecapRoute().location);
    await shot('07_recap');
  });
}
