import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/router.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/platform/platform_providers.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../plans/application/plan_providers.dart';
import '../../../workout/application/active_workout_controller.dart';
import '../../../workout/application/workout_providers.dart';
import '../../../workout/presentation/train_screen.dart';

/// Next workout from the active program with one-tap start (or log on desktop).
class PlannedWorkoutCard extends ConsumerWidget {
  const PlannedWorkoutCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final next = ref.watch(nextWorkoutProvider).value;
    final live = ref.watch(platformCapabilitiesProvider).hasLiveWorkout;

    if (next == null) {
      return GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.plannedTitle, style: text.labelMedium),
            const SizedBox(height: PulseMetrics.space4),
            Text(l10n.noPlanTitle, style: text.titleMedium),
            Text(l10n.noPlanBody, style: text.bodySmall),
            const SizedBox(height: PulseMetrics.space12),
            SecondaryButton(
              label: l10n.browsePrograms,
              icon: Icons.view_list_rounded,
              onPressed: () => const ProgramsRoute().push<void>(context),
            ),
          ],
        ),
      );
    }

    final ids = (next.day.exercises.map((e) => e.exerciseId).toSet().toList()..sort()).join(',');
    final names = ref.watch(exercisesByIdsProvider(ids)).value ?? const {};
    final preview = next.day.exercises.take(3).map((e) => names[e.exerciseId]?.name).nonNulls.join(' · ');
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(next.isToday ? l10n.plannedTitle : l10n.plannedNext(next.day.name), style: text.labelMedium),
          const SizedBox(height: PulseMetrics.space4),
          Text(next.day.name, style: text.headlineSmall),
          Text('${next.plan.name} · ${l10n.exercisesCount(next.day.exercises.length)}', style: text.bodySmall),
          if (preview.isNotEmpty) ...[
            const SizedBox(height: PulseMetrics.space8),
            Text(preview, style: text.bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
          const SizedBox(height: PulseMetrics.space16),
          PrimaryButton(
            label: live ? l10n.startNow : l10n.logNow,
            icon: live ? Icons.play_arrow_rounded : Icons.edit_note_rounded,
            expand: true,
            onPressed: () => TrainScreen.startAndOpen(
              context,
              ref,
              () => ref.read(activeWorkoutProvider.notifier).startFromPlanDay(next.day, manual: !live),
            ),
          ),
        ],
      ),
    );
  }
}
