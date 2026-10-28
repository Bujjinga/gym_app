import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'platform_capabilities.dart';

part 'platform_providers.g.dart';

/// Device capabilities for widgets; tests override this to simulate any
/// platform.
@Riverpod(keepAlive: true)
PlatformCapabilities platformCapabilities(Ref ref) => PlatformCapabilities.current();
