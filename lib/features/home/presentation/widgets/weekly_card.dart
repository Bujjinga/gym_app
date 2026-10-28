import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../workout/application/workout_providers.dart';
import '../../application/home_providers.dart';

/// Steps per day for the last week, plus the workout count.
class WeeklyCard extends ConsumerWidget {
  const WeeklyCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final days = ref.watch(weekActivityProvider).value ?? const [];
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    final workouts = (ref.watch(workoutHistoryProvider).value ?? const [])
        .where((s) => s.endedAt != null && s.startedAt.isAfter(weekAgo))
        .length;
    final maxSteps = days.fold(0, (m, d) => d.steps > m ? d.steps : m);
    String label(String key) => DateFormat.E().format(DateTime.parse(key)).substring(0, 1);

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(l10n.weeklyTitle, style: text.titleMedium)),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(l10n.workoutsCount(workouts),
                      style: text.labelMedium?.copyWith(color: c.accentEnd), overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          const SizedBox(height: PulseMetrics.space16),
          Semantics(
            label: l10n.weeklySemantics(
              days.map((d) => '${DateFormat.E().format(DateTime.parse(d.day))} ${d.steps}').join(', '),
            ),
            excludeSemantics: true,
            child: SizedBox(
              height: 140,
              child: BarChart(
                BarChartData(
                  maxY: (maxSteps == 0 ? 1000 : maxSteps * 1.15).toDouble(),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barTouchData: const BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (v, _) => Padding(
                          padding: const EdgeInsets.only(top: PulseMetrics.space4),
                          child: Text(v.toInt() < days.length ? label(days[v.toInt()].day) : '', style: text.labelSmall),
                        ),
                      ),
                    ),
                  ),
                  barGroups: [
                    for (final (i, d) in days.indexed)
                      BarChartGroupData(x: i, barRods: [
                        BarChartRodData(
                          toY: d.steps.toDouble(),
                          width: 14,
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: c.ringSteps,
                          ),
                        ),
                      ]),
                  ],
                ),
                duration: context.motion.slow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
