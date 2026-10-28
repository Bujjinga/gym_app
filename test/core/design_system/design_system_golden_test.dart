import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/design_system/design_system.dart';

/// Goldens for core components in both themes. Regenerate with
/// `flutter test --update-goldens test/core/design_system`.
void main() {
  Widget board(ThemeData theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PrimaryButton(label: 'Start', icon: Icons.bolt_rounded, onPressed: () {}),
                    const SizedBox(width: 12),
                    SecondaryButton(label: 'Later', onPressed: () {}),
                    const SizedBox(width: 12),
                    const PrimaryButton(label: 'Off', onPressed: null),
                  ],
                ),
                const SizedBox(height: 16),
                const SectionHeader(title: 'Today'),
                const SizedBox(
                  width: 220,
                  child: StatTile(icon: Icons.directions_walk_rounded, label: 'Steps', value: 8432, delta: '+12%'),
                ),
                const SizedBox(height: 16),
                FilterChipRow<String>(
                  options: const ['Week', 'Month', 'Year'],
                  selected: const {'Month'},
                  labelOf: (s) => s,
                  onChanged: (_) {},
                ),
                const SizedBox(height: 16),
                const AnimatedCheckmark(checked: true),
                const SizedBox(height: 16),
                const StepProgressBar(step: 1, count: 4, semanticLabel: 'Step 2 of 4'),
              ],
            ),
          ),
        ),
      );

  for (final (name, theme) in [('dark', PulseTheme.dark()), ('light', PulseTheme.light())]) {
    testWidgets('core components – $name', (tester) async {
      tester.view.physicalSize = const Size(800, 600);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(board(theme));
      await tester.pumpAndSettle();
      await expectLater(find.byType(Scaffold), matchesGoldenFile('goldens/core_components_$name.png'));
    });
  }

  testWidgets('empty state – dark', (tester) async {
    tester.view.physicalSize = const Size(400, 400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: PulseTheme.dark(),
      home: const Scaffold(
        body: EmptyState(icon: Icons.inbox_rounded, title: 'No workouts yet', message: 'Start your first session.'),
      ),
    ));
    await tester.pumpAndSettle();
    await expectLater(find.byType(Scaffold), matchesGoldenFile('goldens/empty_state_dark.png'));
  });
}
