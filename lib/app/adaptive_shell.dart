import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/design_system/design_system.dart';
import '../core/platform/platform_providers.dart';
import '../features/workout/application/active_workout_controller.dart';
import '../features/workout/presentation/train_screen.dart';
import '../l10n/gen/app_localizations.dart';
import 'branch_container.dart';
import 'pulse_sidebar.dart';
import 'router.dart';

/// Responsive app frame:
/// - < 600px: glass bottom tab bar + floating Start Workout button
/// - 600–1100px: NavigationRail
/// - > 1100px: collapsible sidebar
/// Cmd/Ctrl+1…5 switch tabs and Cmd/Ctrl+N starts a workout on every layout.
class AdaptiveShell extends ConsumerWidget {
  const AdaptiveShell({super.key, required this.navigationShell, required this.children});

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  static const trainBranch = 1;

  void _go(int index) =>
      navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final caps = ref.watch(platformCapabilitiesProvider);
    final items = [
      PulseNavItem(icon: Icons.home_outlined, selectedIcon: Icons.home_rounded, label: l10n.tabHome),
      PulseNavItem(icon: Icons.fitness_center_outlined, selectedIcon: Icons.fitness_center_rounded, label: l10n.tabTrain),
      PulseNavItem(
          icon: Icons.directions_run_outlined, selectedIcon: Icons.directions_run_rounded, label: l10n.tabActivity),
      PulseNavItem(icon: Icons.insights_outlined, selectedIcon: Icons.insights_rounded, label: l10n.tabProgress),
      PulseNavItem(icon: Icons.person_outline_rounded, selectedIcon: Icons.person_rounded, label: l10n.tabProfile),
    ];
    final index = navigationShell.currentIndex;
    final width = MediaQuery.sizeOf(context).width;
    final body = BranchContainer(currentIndex: index, children: children);
    // Workout logging lives under Train; the button routes there. Desktop has
    // no live mode, so its button logs a finished workout instead.
    // A running workout turns the button into "Resume".
    final live = caps.hasLiveWorkout;
    final active = ref.watch(activeWorkoutProvider).value != null;
    void startWorkout() => active ? const ActiveWorkoutRoute().push<void>(context) : _go(trainBranch);
    final actionLabel = active ? l10n.resumeWorkout : (live ? l10n.startWorkout : l10n.logWorkout);
    final actionIcon = active || live ? Icons.play_arrow_rounded : Icons.edit_note_rounded;
    void newWorkout() => TrainScreen.startAndOpen(
          context,
          ref,
          () => ref.read(activeWorkoutProvider.notifier).startEmpty(name: l10n.workoutDefaultName, manual: !live),
        );

    final Widget layout;
    if (width < PulseMetrics.compactMax) {
      layout = Scaffold(
        extendBody: true,
        body: body,
        floatingActionButton: StartWorkoutButton(label: actionLabel, icon: actionIcon, onPressed: startWorkout),
        bottomNavigationBar: PulseBottomNav(items: items, currentIndex: index, onSelected: _go),
      );
    } else if (width < PulseMetrics.mediumMax) {
      layout = Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: index,
              onDestinationSelected: _go,
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: PulseMetrics.space16),
                child: StartWorkoutButton(
                    label: actionLabel, icon: actionIcon, onPressed: startWorkout, compact: true),
              ),
              destinations: [
                for (final item in items)
                  NavigationRailDestination(
                    icon: Icon(item.icon),
                    selectedIcon: Icon(item.selectedIcon),
                    label: Text(item.label),
                  ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: body),
          ],
        ),
      );
    } else {
      layout = Scaffold(
        body: Row(
          children: [
            PulseSidebar(
              items: items,
              currentIndex: index,
              onSelected: _go,
              actionLabel: actionLabel,
              actionIcon: actionIcon,
              onAction: startWorkout,
            ),
            Expanded(child: body),
          ],
        ),
      );
    }

    final meta = caps.usesMetaForShortcuts;
    const digits = [
      LogicalKeyboardKey.digit1,
      LogicalKeyboardKey.digit2,
      LogicalKeyboardKey.digit3,
      LogicalKeyboardKey.digit4,
      LogicalKeyboardKey.digit5,
    ];
    return RippleDistortion(
      child: CallbackShortcuts(
        bindings: {
          for (var i = 0; i < digits.length; i++)
            SingleActivator(digits[i], meta: meta, control: !meta): () => _go(i),
          SingleActivator(LogicalKeyboardKey.keyN, meta: meta, control: !meta): newWorkout,
        },
        child: Focus(autofocus: true, child: layout),
      ),
    );
  }
}
