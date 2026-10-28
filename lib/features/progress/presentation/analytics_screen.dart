import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/analytics.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/unit_conversion.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../activity/data/drift_activity_repository.dart';
import '../../activity/domain/day_activity.dart';
import '../../exercises/application/exercise_providers.dart';
import '../../home/application/home_providers.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../../workout/application/workout_providers.dart';
import '../application/progress_providers.dart';

final _yearOfDays = StreamProvider.autoDispose<List<DayActivity>>((ref) {
  final now = DateTime.now();
  return ref.watch(activityRepositoryProvider).watchDays(DateTime(now.year - 1, now.month, now.day), now);
});

/// Charts over a selectable time range; fl_chart animates between ranges.
class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen> {
  TimeRange _range = TimeRange.month;
  String? _exerciseId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final now = DateTime.now();
    final p = ref.watch(userProfileProvider).value;
    final wUnit = p?.weightUnit ?? WeightUnit.kg;
    final dUnit = p?.distanceUnit ?? DistanceUnit.km;
    final sessions = (ref.watch(workoutHistoryProvider).value ?? const []).where((s) => s.endedAt != null).toList();
    final cardio = ref.watch(cardioHistoryProvider).value ?? const [];
    final days = ref.watch(_yearOfDays).value ?? const [];
    final weights = ref.watch(measurementsProvider(MeasurementType.weight)).value ?? const [];
    final starts = bucketStarts(_range, now);
    String label(int i) => switch (_range) {
          TimeRange.year => DateFormat.MMM().format(starts[i]).substring(0, 1),
          TimeRange.week => DateFormat.E().format(starts[i]).substring(0, 1),
          _ => i % (_range == TimeRange.month ? 7 : 4) == 0 ? DateFormat.Md().format(starts[i]) : '',
        };
    List<double> sums<T>(Iterable<T> items, DateTime Function(T) at, double Function(T) v) =>
        bucketSums(_range, now, items, at, v);

    // Exercises trained in this range, for the strength chart.
    final ids = <String>{for (final s in sessions) ...s.entries.map((e) => e.exerciseId)};
    final history = _exerciseId == null ? null : ref.watch(exerciseHistoryProvider(_exerciseId!)).value;
    final names = ref.watch(exercisesByIdsProvider((ids.toList()..sort()).join(','))).value ?? const {};

    return Scaffold(
      appBar: AppBar(title: Text(l10n.analytics)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(PulseMetrics.space16, 0, PulseMetrics.space16, PulseMetrics.space48),
        children: [
          FilterChipRow<TimeRange>(
            options: TimeRange.values,
            selected: {_range},
            labelOf: (r) => switch (r) {
              TimeRange.week => l10n.rangeWeek,
              TimeRange.month => l10n.rangeMonth,
              TimeRange.threeMonths => l10n.range3Months,
              TimeRange.year => l10n.rangeYear,
            },
            onChanged: (s) => setState(() => _range = s.first),
          ),
          _BarChartCard(
            title: '${l10n.chartVolume} (${wUnit.name})',
            values: sums(sessions, (s) => s.startedAt, (s) => Units.weightFromKg(s.totalVolumeKg, wUnit)),
            label: label,
            colors: [c.accentStart, c.accentEnd],
          ),
          _BarChartCard(
            title: l10n.chartFrequency,
            values: sums(sessions, (s) => s.startedAt, (_) => 1),
            label: label,
            colors: c.ringMove,
          ),
          _BarChartCard(
            title: l10n.chartSteps,
            values: sums(days, (d) => DateTime.parse(d.day), (d) => d.steps.toDouble()),
            label: label,
            colors: c.ringSteps,
          ),
          _BarChartCard(
            title: '${l10n.chartDistance} (${dUnit.name})',
            values: sums(cardio, (s) => s.startedAt, (s) => Units.distanceFromMeters(s.distanceM, dUnit)),
            label: label,
            colors: [c.accentEnd, c.ringSteps.last],
          ),
          _LineChartCard(
            title: '${l10n.chartWeight} (${wUnit.name})',
            points: [
              for (final w in weights.where((w) => !w.measuredAt.toLocal().isBefore(starts.first)))
                (w.measuredAt, Units.weightFromKg(w.value, wUnit)),
            ],
          ),
          if (ids.isNotEmpty) ...[
            SectionHeader(title: l10n.chartStrength),
            DropdownButton<String>(
              value: _exerciseId,
              hint: Text(l10n.chooseExercise),
              isExpanded: true,
              items: [for (final id in ids) DropdownMenuItem(value: id, child: Text(names[id]?.name ?? '…'))],
              onChanged: (id) => setState(() => _exerciseId = id),
            ),
            if (history != null)
              _LineChartCard(
                title: '${l10n.estimatedOneRm} (${wUnit.name})',
                points: [
                  for (final h in history.where((h) => !h.date.toLocal().isBefore(starts.first)))
                    (h.date, Units.weightFromKg(h.bestOneRepMax, wUnit)),
                ],
              ),
          ],
        ],
      ),
    );
  }
}

class _BarChartCard extends StatelessWidget {
  const _BarChartCard({required this.title, required this.values, required this.label, required this.colors});

  final String title;
  final List<double> values;
  final String Function(int i) label;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final max = values.fold(0.0, (m, v) => v > m ? v : m);
    final total = values.fold(0.0, (a, v) => a + v);
    return Padding(
      padding: const EdgeInsets.only(top: PulseMetrics.space16),
      child: GlassCard(
        blur: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(child: Text(title, style: text.titleSmall)),
            Text(Fmt.number(total), style: text.titleSmall),
          ]),
          const SizedBox(height: PulseMetrics.space12),
          Semantics(
            label: '$title: ${values.map((v) => Fmt.number(v)).join(', ')}',
            excludeSemantics: true,
            child: SizedBox(
              height: 140,
              child: max == 0
                  ? Center(child: Text(l10n.noDataBody, style: text.bodySmall, textAlign: TextAlign.center))
                  : BarChart(
                      BarChartData(
                        maxY: max * 1.15,
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        barTouchData: const BarTouchData(enabled: true),
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(),
                          rightTitles: const AxisTitles(),
                          topTitles: const AxisTitles(),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 20,
                              getTitlesWidget: (v, _) => Text(label(v.toInt()), style: text.labelSmall),
                            ),
                          ),
                        ),
                        barGroups: [
                          for (final (i, v) in values.indexed)
                            BarChartGroupData(x: i, barRods: [
                              BarChartRodData(
                                toY: v,
                                width: values.length > 20 ? 5 : 12,
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: colors),
                              ),
                            ]),
                        ],
                      ),
                      duration: context.motion.slow,
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _LineChartCard extends StatelessWidget {
  const _LineChartCard({required this.title, required this.points});

  final String title;
  final List<(DateTime, double)> points;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: PulseMetrics.space16),
      child: GlassCard(
        blur: false,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: text.titleSmall),
          const SizedBox(height: PulseMetrics.space12),
          Semantics(
            label: '$title: ${points.map((p) => Fmt.number(p.$2)).join(', ')}',
            excludeSemantics: true,
            child: SizedBox(
              height: 140,
              child: points.length < 2
                  ? Center(child: Text(l10n.noDataBody, style: text.bodySmall, textAlign: TextAlign.center))
                  : LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        titlesData: const FlTitlesData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [for (final p in points) FlSpot(p.$1.millisecondsSinceEpoch.toDouble(), p.$2)],
                            isCurved: true,
                            barWidth: 3,
                            gradient: c.accentGradient,
                            dotData: const FlDotData(show: true),
                          ),
                        ],
                      ),
                      duration: context.motion.slow,
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
