import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/design_system/widgets/tab_page.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/home_providers.dart';
import '../domain/dashboard_layout.dart';
import 'widgets/activity_stats_card.dart';
import 'widgets/planned_workout_card.dart';
import 'widgets/records_card.dart';
import 'widgets/recovery_card.dart';
import 'widgets/rings_card.dart';
import 'widgets/streak_card.dart';
import 'widgets/weekly_card.dart';

/// Home dashboard over the animated mesh background. Cards can be reordered
/// and hidden ("Customize"); wide windows lay them out in columns.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _editing = false;

  Future<void> _save(DashboardLayout layout) async {
    final repo = ref.read(profileRepositoryProvider);
    await repo.save((await repo.get()).copyWith(dashboardCards: layout.toStored()));
  }

  String _greeting(AppLocalizations l10n) {
    final h = DateTime.now().hour;
    final g = h < 12 ? l10n.greetingMorning : (h < 18 ? l10n.greetingAfternoon : l10n.greetingEvening);
    final name = ref.watch(userProfileProvider).value?.displayName;
    return name == null || name.isEmpty ? g : l10n.greetingWithName(g, name);
  }

  static Widget _card(DashboardCard card) => switch (card) {
        DashboardCard.rings => const RingsCard(),
        DashboardCard.recovery => const RecoveryCard(),
        DashboardCard.stats => const ActivityStatsCard(),
        DashboardCard.planned => const PlannedWorkoutCard(),
        DashboardCard.weekly => const WeeklyCard(),
        DashboardCard.streak => const StreakCard(),
        DashboardCard.records => const RecordsCard(),
      };

  String _cardName(AppLocalizations l10n, DashboardCard card) => switch (card) {
        DashboardCard.rings => l10n.ringsTitle,
        DashboardCard.recovery => l10n.recoveryTitle,
        DashboardCard.stats => l10n.statSteps,
        DashboardCard.planned => l10n.plannedTitle,
        DashboardCard.weekly => l10n.weeklyTitle,
        DashboardCard.streak => l10n.streakTitle,
        DashboardCard.records => l10n.recordsTitle,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final layout = ref.watch(dashboardLayoutProvider);
    final width = MediaQuery.sizeOf(context).width;
    final columns = width < 700 ? 1 : (width < PulseMetrics.mediumMax ? 2 : 3);

    final action = TextButton.icon(
      onPressed: () => setState(() => _editing = !_editing),
      icon: Icon(_editing ? Icons.check_rounded : Icons.dashboard_customize_rounded),
      label: Text(_editing ? l10n.doneEditing : l10n.customize),
    );

    Widget body;
    if (_editing) {
      body = TabPage(
        title: _greeting(l10n),
        actions: [action],
        children: [
          ReorderableListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            onReorderItem: (a, b) => _save(layout.move(a, b)),
            children: [
              for (final card in layout.order)
                ListTile(
                  key: ValueKey(card),
                  leading: const Icon(Icons.drag_indicator_rounded),
                  title: Text(_cardName(l10n, card)),
                  trailing: Switch(
                    value: !layout.hidden.contains(card),
                    onChanged: (_) => _save(layout.toggle(card)),
                  ),
                ),
            ],
          ),
        ],
      );
    } else {
      final visible = layout.visible;
      final cols = [
        for (var c = 0; c < columns; c++)
          [
            for (var i = c; i < visible.length; i += columns)
              Padding(
                padding: const EdgeInsets.only(bottom: PulseMetrics.space16),
                child: StaggeredEntry(index: i, child: _card(visible[i])),
              ),
          ],
      ];
      body = TabPage(
        title: _greeting(l10n),
        actions: [action],
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final (i, col) in cols.indexed) ...[
                if (i > 0) const SizedBox(width: PulseMetrics.space16),
                Expanded(child: Column(children: col)),
              ],
            ],
          ),
        ],
      );
    }

    return Scaffold(backgroundColor: Colors.transparent, body: MeshGradientBackground(child: body));
  }
}
