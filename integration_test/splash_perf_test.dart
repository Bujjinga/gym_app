import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/app/app.dart';
import 'package:integration_test/integration_test.dart';

import 'demo_data.dart';

/// Frame timings for the splash intro and its dissolve into Home. Profile mode:
///   flutter drive --profile --driver=test_driver/perf_driver.dart \
///     --target=integration_test/splash_perf_test.dart -d DEVICE
/// Summary: `build/splash.timeline_summary.json`.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('splash', (tester) async {
    final container = await demoContainer();
    await binding.traceAction(reportKey: 'splash', () async {
      await tester.pumpWidget(UncontrolledProviderScope(container: container, child: const PulseApp()));
      for (var f = 0; f < 260; f++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
    });
  });
}
