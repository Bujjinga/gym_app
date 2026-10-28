import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Host side of integration_test/screenshots_test.dart: saves each capture
/// as `screenshots/<size>/<name>.png`.
Future<void> main() => integrationDriver(
      onScreenshot: (name, bytes, [args]) async {
        File('screenshots/$name.png')
          ..createSync(recursive: true)
          ..writeAsBytesSync(bytes);
        return true;
      },
    );
