import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

/// Host side of integration_test/perf_test.dart: writes frame timing
/// summaries to `build/<key>.timeline_summary.json`.
Future<void> main() => integrationDriver(
      responseDataCallback: (data) async {
        for (final MapEntry(:key, :value) in (data ?? const <String, dynamic>{}).entries) {
          final summary = driver.TimelineSummary.summarize(driver.Timeline.fromJson(value as Map<String, dynamic>));
          await summary.writeTimelineToFile(key, pretty: true, includeSummary: true);
        }
      },
    );
