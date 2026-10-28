import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/unit_conversion.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/exercise_providers.dart';
import '../data/drift_exercise_repository.dart';
import '../domain/exercise.dart';

/// Full-screen exercise detail (phones). The Hero flies in from the list.
class ExerciseDetailScreen extends StatelessWidget {
  const ExerciseDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) => Scaffold(body: ExerciseDetailView(id: id, standalone: true));
}

/// Exercise content: muscles, cues, mistakes, history and records. Used as
/// a full screen and as the detail pane of the desktop library.
class ExerciseDetailView extends ConsumerWidget {
  const ExerciseDetailView({super.key, required this.id, this.standalone = false});

  final String id;

  /// Shows a back button and Hero header when it is its own route.
  final bool standalone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final exercise = ref.watch(exerciseByIdProvider(id));
    return switch (exercise) {
      AsyncData(value: final e?) => _Content(exercise: e, standalone: standalone),
      AsyncData() || AsyncError() => EmptyState(
          icon: Icons.search_off_rounded,
          title: l10n.noExercisesFound,
          message: l10n.noExercisesFoundBody,
        ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

class _Content extends ConsumerWidget {
  const _Content({required this.exercise, required this.standalone});

  final Exercise exercise;
  final bool standalone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final e = exercise;
    final unit = ref.watch(userProfileProvider).value?.weightUnit ?? WeightUnit.kg;
    final history = ref.watch(exerciseHistoryProvider(e.id)).value ?? const [];
    final records = ref.watch(exerciseRecordsProvider(e.id)).value ?? const [];

    Future<void> toggleFavorite() async {
      Haptics.selection();
      await ref.read(exerciseRepositoryProvider).setFavorite(e.id, favorite: !e.isFavorite);
      ref.invalidate(exerciseByIdProvider(e.id));
    }

    final header = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [c.accentEnd.withValues(alpha: 0.28), c.background],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(PulseMetrics.space24, 72, PulseMetrics.space24, PulseMetrics.space16),
      alignment: Alignment.bottomLeft,
      child: Text(e.name, style: text.headlineMedium),
    );

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 180,
          automaticallyImplyLeading: standalone,
          backgroundColor: c.background,
          actions: [
            IconButton(
              tooltip: e.isFavorite ? l10n.removeFromFavorites : l10n.addToFavorites,
              icon: Icon(e.isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
                  color: e.isFavorite ? c.warning : null),
              onPressed: toggleFavorite,
            ),
            if (e.isCustom)
              IconButton(
                tooltip: l10n.delete,
                icon: const Icon(Icons.delete_outline_rounded),
                onPressed: () async {
                  await ref.read(exerciseRepositoryProvider).deleteCustom(e.id);
                  if (context.mounted && standalone) context.pop();
                },
              ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: standalone
                ? PulseHero(tag: 'exercise-${e.id}', fromRadius: context.metrics.radiusMd, child: header)
                : header,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(PulseMetrics.space24, 0, PulseMetrics.space24, PulseMetrics.space48),
          sliver: SliverList.list(
            children: [
              Wrap(
                spacing: PulseMetrics.space8,
                runSpacing: PulseMetrics.space8,
                children: [
                  Chip(label: Text(l10n.muscle(e.primaryMuscle))),
                  Chip(label: Text(l10n.equipmentName(e.equipment))),
                  Chip(label: Text(l10n.difficultyName(e.difficulty))),
                ],
              ),
              SectionHeader(title: l10n.musclesWorked),
              Center(
                child: MuscleMap(
                  intensities: {e.primaryMuscle: 1, for (final m in e.secondaryMuscles) m: 0.5},
                  semanticLabel: [e.primaryMuscle, ...e.secondaryMuscles].map(l10n.muscle).join(', '),
                ),
              ),
              if (e.instructions.isNotEmpty) ...[
                SectionHeader(title: l10n.howTo),
                for (final (i, step) in e.instructions.indexed)
                  Padding(
                    padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: c.accentStart.withValues(alpha: 0.18),
                          child: Text('${i + 1}', style: text.labelMedium?.copyWith(color: c.accentText)),
                        ),
                        const SizedBox(width: PulseMetrics.space12),
                        Expanded(child: Text(step, style: text.bodyLarge)),
                      ],
                    ),
                  ),
              ],
              if (e.mistakes.isNotEmpty) ...[
                SectionHeader(title: l10n.commonMistakes),
                for (final m in e.mistakes)
                  Padding(
                    padding: const EdgeInsets.only(bottom: PulseMetrics.space8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, size: 20, color: c.warning),
                        const SizedBox(width: PulseMetrics.space12),
                        Expanded(child: Text(m, style: text.bodyMedium)),
                      ],
                    ),
                  ),
              ],
              SectionHeader(title: l10n.yourHistory),
              if (history.length < 2)
                Text(l10n.noHistoryForExercise, style: text.bodyMedium)
              else
                GlassCard(
                  blur: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.estimatedOneRm, style: text.labelMedium),
                      const SizedBox(height: PulseMetrics.space12),
                      Semantics(
                        label: '${l10n.estimatedOneRm}: '
                            '${history.map((h) => Fmt.weight(h.bestOneRepMax, unit)).join(', ')}',
                        excludeSemantics: true,
                        child: SizedBox(
                          height: 160,
                          child: LineChart(
                            LineChartData(
                              gridData: const FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                              titlesData: const FlTitlesData(show: false),
                              lineTouchData: LineTouchData(
                                touchTooltipData: LineTouchTooltipData(
                                  getTooltipItems: (spots) => [
                                    for (final s in spots)
                                      LineTooltipItem(
                                        '${DateFormat.MMMd().format(history[s.x.toInt()].date.toLocal())}\n'
                                        '${Fmt.weightValue(Units.weightToKg(s.y, unit), unit)} ${unit.name}',
                                        text.labelMedium!,
                                      ),
                                  ],
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    for (final (i, h) in history.indexed)
                                      FlSpot(i.toDouble(), Units.weightFromKg(h.bestOneRepMax, unit)),
                                  ],
                                  isCurved: true,
                                  barWidth: 3,
                                  gradient: c.accentGradient,
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [c.accentEnd.withValues(alpha: 0.25), c.accentEnd.withValues(alpha: 0)],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            duration: context.motion.slow,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (records.isNotEmpty) ...[
                SectionHeader(title: l10n.personalRecords),
                for (final type in RecordType.values)
                  if (records.where((r) => r.type == type).isNotEmpty)
                    () {
                      final best = records.where((r) => r.type == type).reduce((a, b) => b.value > a.value ? b : a);
                      final value = type == RecordType.maxReps
                          ? '${l10n.reps}: ${best.value.round()}'
                          : Fmt.weight(best.value, unit) +
                              (type == RecordType.maxWeight && best.reps != null ? ' × ${best.reps}' : '');
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.emoji_events_rounded, color: c.warning),
                        title: Text(l10n.recordTypeName(type)),
                        subtitle: Text(DateFormat.yMMMd().format(best.achievedAt.toLocal())),
                        trailing: Text(value, style: text.titleSmall),
                      );
                    }(),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
