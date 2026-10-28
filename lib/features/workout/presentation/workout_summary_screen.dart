import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/ids.dart';
import '../../../core/utils/unit_conversion.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../../progress/presentation/achievement_labels.dart';
import '../../progress/presentation/share_card.dart';
import '../application/workout_providers.dart';
import '../data/drift_workout_repository.dart';
import '../domain/planned_exercise.dart';
import '../domain/workout_session.dart';
import '../domain/workout_template.dart';

/// Post-workout summary (also used to view past sessions): stats, muscle
/// heatmap, new PRs, save as template, share. [celebrate] plays the PR
/// celebration once on open.
class WorkoutSummaryScreen extends ConsumerStatefulWidget {
  const WorkoutSummaryScreen({super.key, required this.id, this.celebrate = false, this.achievements = ''});

  final String id;
  final bool celebrate;

  /// Comma-separated achievement keys unlocked by this workout.
  final String achievements;

  @override
  ConsumerState<WorkoutSummaryScreen> createState() => _WorkoutSummaryScreenState();
}

class _WorkoutSummaryScreenState extends ConsumerState<WorkoutSummaryScreen> {
  bool _celebrated = false;

  void _maybeCelebrate(List<String> recordNames) {
    if (!widget.celebrate || _celebrated || (recordNames.isEmpty && widget.achievements.isEmpty)) return;
    _celebrated = true;
    final l10n = AppLocalizations.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final unlocked = widget.achievements.split(',').where((k) => k.isNotEmpty).toList();
      final (title, subtitle, icon) = unlocked.isNotEmpty
          ? achievementInfo(l10n, unlocked.first)
          : (l10n.prUnlockedTitle, recordNames.join(' · '), Icons.emoji_events_rounded);
      showAchievementCelebration(
        context,
        title: unlocked.isNotEmpty ? '${l10n.achievementUnlocked} $title' : title,
        subtitle: subtitle,
        icon: icon,
        shareLabel: l10n.shareCard,
        closeLabel: l10n.close,
        onShare: () => showShareCard(context, ShareCardView(title: title, stats: [(subtitle, '🏅')])),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final session = ref.watch(workoutSessionProvider(widget.id)).value;
    if (session == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final unit = ref.watch(userProfileProvider).value?.weightUnit ?? WeightUnit.kg;
    final ids = (session.entries.map((e) => e.exerciseId).toSet().toList()..sort()).join(',');
    final exercises = ref.watch(exercisesByIdsProvider(ids)).value ?? const {};
    final records = ref.watch(sessionRecordsProvider(widget.id)).value ?? const [];
    final sets = [for (final e in session.entries) ...e.sets.where((s) => s.isCompleted)];
    final minutes = session.duration?.inMinutes ?? 0;

    // Heatmap: working sets per muscle (secondary muscles count half), normalised.
    final load = <MuscleGroup, double>{};
    for (final e in session.entries) {
      final ex = exercises[e.exerciseId];
      final n = e.sets.where((s) => s.isCompleted && s.type != SetType.warmup).length.toDouble();
      if (ex == null || n == 0) continue;
      load[ex.primaryMuscle] = (load[ex.primaryMuscle] ?? 0) + n;
      for (final m in ex.secondaryMuscles) {
        load[m] = (load[m] ?? 0) + n / 2;
      }
    }
    final maxLoad = load.values.fold(0.0, (a, b) => a > b ? a : b);
    final intensities = {for (final e in load.entries) e.key: maxLoad == 0 ? 0.0 : e.value / maxLoad};
    final recordNames = {for (final r in records) exercises[r.exerciseId]?.name ?? ''}.where((n) => n.isNotEmpty).toList();
    _maybeCelebrate(recordNames);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(session.endedAt != null && widget.celebrate ? l10n.summaryTitle : session.name),
            actions: [
              IconButton(
                tooltip: l10n.share,
                icon: const Icon(Icons.ios_share_rounded),
                onPressed: () => showShareCard(
                  context,
                  ShareCardView(title: session.name, stats: [
                    (l10n.duration, '$minutes ${l10n.minUnit}'),
                    (l10n.totalVolume, Fmt.weight(session.totalVolumeKg, unit)),
                    (l10n.setsDone, '${sets.length}'),
                    if (records.isNotEmpty) (l10n.newRecords, '${records.length}'),
                  ]),
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(PulseMetrics.space16, 0, PulseMetrics.space16, PulseMetrics.space48),
            sliver: SliverList.list(
              children: [
                Text(DateFormat.yMMMMEEEEd().add_jm().format(session.startedAt.toLocal()), style: text.bodyMedium),
                const SizedBox(height: PulseMetrics.space16),
                LayoutBuilder(
                  builder: (context, box) {
                    final cols = box.maxWidth > 600 ? 4 : 2;
                    final w = (box.maxWidth - PulseMetrics.space12 * (cols - 1)) / cols;
                    return Wrap(
                      spacing: PulseMetrics.space12,
                      runSpacing: PulseMetrics.space12,
                      children: [
                        SizedBox(width: w, child: StatTile(icon: Icons.timer_rounded, label: l10n.duration, value: minutes, unit: l10n.minUnit)),
                        SizedBox(
                          width: w,
                          child: StatTile(
                            icon: Icons.fitness_center_rounded,
                            label: l10n.totalVolume,
                            value: Units.weightFromKg(session.totalVolumeKg, unit).round(),
                            unit: unit.name,
                            accent: c.accentEnd,
                          ),
                        ),
                        SizedBox(width: w, child: StatTile(icon: Icons.repeat_rounded, label: l10n.setsDone, value: sets.length, accent: c.ringSteps.last)),
                        SizedBox(
                          width: w,
                          child: StatTile(
                            icon: Icons.local_fire_department_rounded,
                            label: l10n.calories,
                            value: (session.caloriesKcal ?? 0).round(),
                            unit: l10n.kcalUnit,
                            accent: c.ringMove.first,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                if (records.isNotEmpty) ...[
                  SectionHeader(title: l10n.newRecords),
                  for (final r in records)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ShimmerBadge(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(gradient: c.accentGradient, borderRadius: BorderRadius.circular(999)),
                          child: Text(l10n.newBadge, style: text.labelSmall?.copyWith(color: c.onAccent)),
                        ),
                      ),
                      title: Text(exercises[r.exerciseId]?.name ?? ''),
                      subtitle: Text(l10n.recordTypeName(r.type)),
                      trailing: Text(
                        r.type == RecordType.maxReps ? '${r.value.round()} ${l10n.reps}' : Fmt.weight(r.value, unit),
                        style: text.titleSmall,
                      ),
                    ),
                ],
                if (load.isNotEmpty) ...[
                  SectionHeader(title: l10n.musclesWorked),
                  Center(
                    child: MuscleMap(
                      intensities: intensities,
                      semanticLabel: load.keys.map(l10n.muscle).join(', '),
                    ),
                  ),
                ],
                SectionHeader(title: l10n.history),
                for (final e in session.entries)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(exercises[e.exerciseId]?.name ?? ''),
                    subtitle: Text(e.sets.map((s) => Fmt.set(s.weightKg, s.reps, unit)).join('  ·  ')),
                  ),
                const SizedBox(height: PulseMetrics.space24),
                Wrap(
                  spacing: PulseMetrics.space12,
                  runSpacing: PulseMetrics.space12,
                  children: [
                    SecondaryButton(
                      label: l10n.saveAsTemplate,
                      icon: Icons.bookmark_add_rounded,
                      onPressed: () async {
                        await ref.read(workoutRepositoryProvider).saveTemplate(_template(session));
                        if (context.mounted) PulseToast.show(context, l10n.templateSaved, kind: ToastKind.success);
                      },
                    ),
                    PrimaryButton(label: l10n.done, onPressed: () => context.pop()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static WorkoutTemplate _template(WorkoutSession s) => WorkoutTemplate(
        id: newId(),
        name: s.name,
        exercises: [
          for (final e in s.entries)
            PlannedExercise(
              exerciseId: e.exerciseId,
              sets: e.sets.length,
              reps: e.sets.map((x) => x.reps ?? 0).fold(0, (a, b) => a > b ? a : b),
              restSeconds: e.restSeconds,
              supersetGroup: e.supersetGroup,
            ),
        ],
      );
}
