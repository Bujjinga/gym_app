import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/app/app.dart';
import 'package:gym_app/core/database/app_database.dart';
import 'package:gym_app/core/database/database_provider.dart';
import 'package:gym_app/core/domain/pulse_enums.dart';
import 'package:gym_app/features/profile/data/drift_profile_repository.dart';
import 'package:gym_app/features/profile/domain/user_profile.dart';

/// Accessibility audit of every tab, light and dark: tap target sizes,
/// labels on tappable things, text contrast — with Reduce Motion on, which
/// must also let every screen settle (no endless animations).
void main() {
  const tabs = ['Home', 'Train', 'Activity', 'Progress', 'Profile'];

  for (final (theme, textScale) in [(AppThemeMode.dark, 1.0), (AppThemeMode.light, 1.0), (AppThemeMode.dark, 2.0)]) {
    testWidgets('all tabs pass a11y guidelines with reduced motion (${theme.name}, text ×$textScale)', (tester) async {
      final semantics = tester.ensureSemantics();
      tester.view.physicalSize = const Size(400, 860);
      tester.view.devicePixelRatio = 1;
      // At 200 % text any layout overflow throws and fails the test.
      tester.platformDispatcher.textScaleFactorTestValue = textScale;
      tester.platformDispatcher.accessibilityFeaturesTestValue = const FakeAccessibilityFeatures(disableAnimations: true);
      addTearDown(() {
        tester.view.reset();
        tester.platformDispatcher.clearAllTestValues();
      });

      await tester.pumpWidget(ProviderScope(
        overrides: [
          userProfileProvider.overrideWith(
              (ref) => Stream.value(UserProfile(id: 'test', onboardingComplete: true, themeMode: theme))),
          appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory())),
        ],
        child: const PulseApp(),
      ));

      // Splash → home redirect and data arriving.
      for (var i = 0; i < 3; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      for (final tab in tabs) {
        await tester.tap(find.bySemanticsLabel(tab).first);
        // Reduced motion: everything must come to rest.
        await tester.pumpAndSettle(const Duration(milliseconds: 100), EnginePhase.sendSemanticsUpdate, const Duration(seconds: 10));
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline), reason: '$tab tap targets');
        await expectLater(tester, meetsGuideline(iOSTapTargetGuideline), reason: '$tab tap targets');
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline), reason: '$tab labels');
        await expectLater(tester, meetsGuideline(textContrastGuideline), reason: '$tab contrast');
      }

      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
      semantics.dispose();
    });
  }
}
