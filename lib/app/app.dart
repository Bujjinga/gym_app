import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/design_system/design_system.dart';
import '../l10n/gen/app_localizations.dart';
import '../features/security/presentation/lock_screen.dart';
import 'router.dart';
import 'splash_screen.dart';
import 'theme_mode_controller.dart';

/// Root widget: theme, localization and router, under the splash intro and
/// the app lock.
class PulseApp extends ConsumerWidget {
  const PulseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: PulseTheme.light(),
      darkTheme: PulseTheme.dark(),
      themeMode: ref.watch(themeModeControllerProvider),
      routerConfig: ref.watch(routerProvider),
      builder: (context, child) => SplashOverlay(child: AppLockGate(child: BackdropGroup(child: child!))),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
