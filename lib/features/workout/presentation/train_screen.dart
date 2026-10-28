import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/design_system/widgets/tab_page.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../plans/application/plan_providers.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/active_workout_controller.dart';
import '../application/workout_providers.dart';

/// Train tab: start (phone) or log (desktop) a workout, the active program,
/// templates, the exercise library and workout history.
class TrainScreen extends ConsumerWidget {
  const TrainScreen({super.key});

  /// Starts a workout (unless one is already running) and opens it.
  static Future<void> startAndOpen(BuildContext context, WidgetRef ref, Future<void> Function() start) async {
    if (ref.read(activeWorkoutProvider).value == null) await start();
    if (context.mounted) const ActiveWorkoutRoute().push<void>(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final live = ref.watch(platformCapabilitiesProvider).hasLiveWorkout;
    final unit = ref.watch(userProfileProvider).value?.weightUnit ?? WeightUnit.kg;
    final active = ref.watch(activeWorkoutProvider).value;
    final next = ref.watch(nextWorkoutProvider).value;
    final templates = ref.watch(workoutTemplatesProvider).value ?? const [];
    final history = (ref.watch(workoutHistoryProvider).value ?? const []).where((s) => s.endedAt != null).take(20).toList();
    final ctrl = ref.read(activeWorkoutProvider.notifier);
    final startLabel = live ? l10n.startNow : l10n.logNow;

    return Scaffold(
      body: TabPage(
        title: l10n.tabTrain,
        children: [
          if (active != null)
            GlassCard(
              onTap: () => const ActiveWorkoutRoute().push<void>(context),
              semanticLabel: l10n.resumeWorkout,
              child: Row(
                children: [
                  Icon(Icons.play_circle_fill_rounded, color: c.accentText, size: 36),
                  const SizedBox(width: PulseMetrics.space16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.workoutInProgress, style: text.labelMedium),
                        Text(active.session.name, style: text.titleMedium),
                      ],
                    ),
                  ),
                  Text(l10n.resumeWorkout, style: text.labelLarge?.copyWith(color: c.accentText)),
                ],
              ),
            )
          else
            PrimaryButton(
              label: live ? l10n.trainStartEmpty : l10n.trainLogPast,
              icon: live ? Icons.play_arrow_rounded : Icons.edit_note_rounded,
              expand: true,
              onPressed: () => startAndOpen(
                context,
                ref,
                () => ctrl.startEmpty(name: l10n.workoutDefaultName, manual: !live),
              ),
            ),
          SectionHeader(
            title: l10n.activeProgram,
            actionLabel: l10n.programs,
            onAction: () => const ProgramsRoute().push<void>(context),
          ),
          if (next == null)
            GlassCard(
              blur: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.noPlanTitle, style: text.titleMedium),
                  const SizedBox(height: PulseMetrics.space4),
                  Text(l10n.noPlanBody, style: text.bodyMedium),
                  const SizedBox(height: PulseMetrics.space12),
                  SecondaryButton(
                    label: l10n.browsePrograms,
                    icon: Icons.view_list_rounded,
                    onPressed: () => const ProgramsRoute().push<void>(context),
                  ),
                ],
              ),
            )
          else
            GlassCard(
              blur: false,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(next.plan.name, style: text.labelMedium),
                        Text(next.isToday ? next.day.name : l10n.plannedNext(next.day.name), style: text.titleMedium),
                        Text(l10n.exercisesCount(next.day.exercises.length), style: text.bodySmall),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    label: startLabel,
                    icon: live ? Icons.play_arrow_rounded : Icons.edit_note_rounded,
                    onPressed: () => startAndOpen(context, ref, () => ctrl.startFromPlanDay(next.day, manual: !live)),
                  ),
                ],
              ),
            ),
          SectionHeader(title: l10n.templates),
          if (templates.isEmpty)
            Text(l10n.noTemplates, style: text.bodyMedium)
          else
            for (final t in templates)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.bookmark_rounded, color: c.accentEnd),
                title: Text(t.name),
                subtitle: Text(l10n.exercisesCount(t.exercises.length)),
                trailing: TextButton(
                  onPressed: () => startAndOpen(context, ref, () => ctrl.startFromTemplate(t, manual: !live)),
                  child: Text(startLabel),
                ),
              ),
          SectionHeader(title: l10n.exerciseLibrary),
          GlassCard(
            blur: false,
            onTap: () => const ExerciseLibraryRoute().push<void>(context),
            semanticLabel: l10n.exerciseLibrary,
            child: Row(
              children: [
                Icon(Icons.menu_book_rounded, color: c.accentText),
                const SizedBox(width: PulseMetrics.space16),
                Expanded(child: Text(l10n.searchExercises, style: text.titleSmall)),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
          SectionHeader(title: l10n.history),
          if (history.isEmpty)
            Text(l10n.noWorkoutsYetBody, style: text.bodyMedium)
          else
            for (final (i, s) in history.indexed)
              StaggeredEntry(
                index: i,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(s.name),
                  subtitle: Text(
                    '${DateFormat.MMMEd().format(s.startedAt.toLocal())} · '
                    '${s.duration?.inMinutes ?? 0} ${l10n.minUnit} · ${Fmt.weight(s.totalVolumeKg, unit)}',
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => WorkoutSummaryRoute(id: s.id).push<void>(context),
                ),
              ),
        ],
      ),
    );
  }
}
