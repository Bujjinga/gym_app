import 'package:drift/native.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/app/app.dart';
import 'package:gym_app/app/pulse_sidebar.dart';
import 'package:gym_app/core/database/app_database.dart';
import 'package:gym_app/core/database/database_provider.dart';
import 'package:gym_app/features/profile/data/drift_profile_repository.dart';
import 'package:gym_app/features/profile/domain/user_profile.dart';
import 'package:gym_app/core/design_system/design_system.dart';

Future<void> _pumpAt(WidgetTester tester, Size size) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  // Shell tests only need a profile; real drift I/O never completes under the fake test clock.
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        // Onboarded profile; DB-backed providers use a throwaway in-memory database.
        userProfileProvider.overrideWith((ref) => Stream.value(const UserProfile(id: 'test', onboardingComplete: true))),
        appDatabaseProvider.overrideWithValue(AppDatabase(NativeDatabase.memory())),
      ],
      child: const PulseApp(),
    ),
  );
  // The Home mesh background animates forever, so pump frames instead of settling.
  // Past the staggered card entrances (≤ ~1.2 s); pump, not settle (Home animates forever).
  // Cards mount as data arrives, each starting its own entry delay, so pump a few rounds.
  for (var i = 0; i < 5; i++) {
    await tester.pump(const Duration(seconds: 1));
  }
}

/// Unmounts the app inside the test body so drift's stream-close timers
/// fire before flutter_test checks for pending timers.
void _shellTest(String description, Future<void> Function(WidgetTester tester) body) =>
    testWidgets(description, (tester) async {
      await body(tester);
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
    });

void main() {
  _shellTest('phone width uses bottom nav + start button', (tester) async {
    await _pumpAt(tester, const Size(400, 800));
    expect(find.byType(PulseBottomNav), findsOneWidget);
    expect(find.byType(StartWorkoutButton), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
  });

  _shellTest('tablet width uses NavigationRail', (tester) async {
    await _pumpAt(tester, const Size(900, 800));
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(PulseBottomNav), findsNothing);
  });

  _shellTest('desktop width uses the sidebar', (tester) async {
    await _pumpAt(tester, const Size(1400, 900));
    expect(find.byType(PulseSidebar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
  });

  _shellTest('desktop platform offers "Log workout" instead of a live start', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    await _pumpAt(tester, const Size(1400, 900));
    expect(find.bySemanticsLabel('Log workout'), findsOneWidget);
    expect(find.bySemanticsLabel('Start workout'), findsNothing);
    debugDefaultTargetPlatformOverride = null;
  });

  _shellTest('tapping a tab switches branch', (tester) async {
    await _pumpAt(tester, const Size(400, 800));
    await tester.tap(find.bySemanticsLabel('Profile'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Appearance'), findsOneWidget);
  });
}
