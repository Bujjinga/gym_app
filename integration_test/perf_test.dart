import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/app/app.dart';
import 'package:gym_app/app/router.dart';
import 'package:integration_test/integration_test.dart';

import 'demo_data.dart';

/// Frame timings for the heaviest scrolls (Home over the animated mesh, the
/// 226-exercise library, analytics charts). Run in profile mode:
///   flutter drive --profile --driver=test_driver/perf_driver.dart \
///     --target=integration_test/perf_test.dart -d macos
/// Summaries: `build/<screen>.timeline_summary.json` (look at the 90th/99th
/// percentile build and raster times; under 8 ms keeps 120 Hz smooth).
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('scroll performance', (tester) async {
    final container = await demoContainer();
    await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const PulseApp()));
    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    final router = container.read(routerProvider);

    Future<void> fling(String key) => binding.traceAction(reportKey: key, () async {
          final list = find.byType(Scrollable).first;
          for (var i = 0; i < 3; i++) {
            await tester.fling(list, const Offset(0, -900), 2500);
            await tester.pumpAndSettle();
            await tester.fling(list, const Offset(0, 900), 2500);
            await tester.pumpAndSettle();
          }
        });

    // Home never settles (mesh background), so scroll it with fixed pumps.
    await binding.traceAction(reportKey: 'home', () async {
      final list = find.byType(Scrollable).first;
      for (var i = 0; i < 3; i++) {
        await tester.fling(list, const Offset(0, -900), 2500);
        for (var f = 0; f < 60; f++) {
          await tester.pump(const Duration(milliseconds: 16));
        }
        await tester.fling(list, const Offset(0, 900), 2500);
        for (var f = 0; f < 60; f++) {
          await tester.pump(const Duration(milliseconds: 16));
        }
      }
    });

    router.push<void>(const ExerciseLibraryRoute().location);
    await tester.pumpAndSettle();
    await fling('exercise_library');
    router.pop();
    router.push<void>(const AnalyticsRoute().location);
    await tester.pumpAndSettle();
    await fling('analytics');
  });
}
