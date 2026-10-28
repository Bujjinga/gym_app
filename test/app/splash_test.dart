import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/app/app.dart';
import 'package:gym_app/app/splash_screen.dart';
import 'package:gym_app/core/database/app_database.dart';
import 'package:gym_app/core/database/database_provider.dart';
import 'package:gym_app/features/home/presentation/home_screen.dart';
import 'package:gym_app/features/profile/data/drift_profile_repository.dart';
import 'package:gym_app/features/profile/domain/user_profile.dart';

/// The intro plays over the app (which loads underneath), greets the user,
/// then dissolves away.
void main() {
  Future<void> pumpApp(WidgetTester tester) => tester.pumpWidget(ProviderScope(
        overrides: [
          userProfileProvider.overrideWith(
              (ref) => Stream.value(const UserProfile(id: 'test', onboardingComplete: true, displayName: 'Sam'))),
          appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory())),
        ],
        child: const PulseApp(),
      ));

  final intro = find.byKey(SplashOverlay.introKey);

  Future<void> unmount(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('plays over the loaded app, greets, then dissolves', (tester) async {
    await pumpApp(tester);
    await tester.pump(const Duration(milliseconds: 1500));
    expect(intro, findsOneWidget);
    expect(find.byType(HomeScreen, skipOffstage: false), findsOneWidget); // already built underneath, hidden until the dissolve
    await tester.pump(const Duration(milliseconds: 1300));
    expect(find.textContaining('Sam'), findsWidgets);
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 300));
    }
    expect(intro, findsNothing);
    await unmount(tester);
  });

  testWidgets('reduced motion skips the animation', (tester) async {
    tester.platformDispatcher.accessibilityFeaturesTestValue = const FakeAccessibilityFeatures(disableAnimations: true);
    addTearDown(tester.platformDispatcher.clearAllTestValues);
    await pumpApp(tester);
    for (var i = 0; i < 3; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(intro, findsNothing);
    await unmount(tester);
  });
}
