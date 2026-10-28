import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../workout/application/active_workout_controller.dart';
import '../../workout/application/workout_providers.dart';
import '../../workout/presentation/train_screen.dart';
import '../application/plan_providers.dart';
import '../data/drift_plan_repository.dart';

/// A program's days and exercises, with "Make active" and per-day start.
class PlanDetailScreen extends ConsumerWidget {
  const PlanDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final plan = ref.watch(planByIdProvider(id)).value;
    if (plan == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final live = ref.watch(platformCapabilitiesProvider).hasLiveWorkout;
    final ids = (<String>{for (final d in plan.days) ...d.exercises.map((e) => e.exerciseId)}.toList()..sort()).join(',');
    final names = ref.watch(exercisesByIdsProvider(ids)).value ?? const {};
    // ISO weekday 1 = Monday; 2024-01-01 was a Monday.
    String weekday(int d) => DateFormat.EEEE().format(DateTime(2024, 1, d));

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ListView(
        padding: const EdgeInsets.all(PulseMetrics.space16),
        children: [
          if (plan.description != null) Text(plan.description!, style: text.bodyLarge),
          const SizedBox(height: PulseMetrics.space16),
          if (!plan.active)
            PrimaryButton(
              label: l10n.setActive,
              icon: Icons.check_circle_rounded,
              expand: true,
              onPressed: () async {
                await ref.read(planRepositoryProvider).setActive(plan.id);
                Haptics.success();
                ref.invalidate(planByIdProvider(id));
              },
            ),
          for (final day in plan.days) ...[
            SectionHeader(
              title: day.weekday == null ? day.name : '${day.name} · ${weekday(day.weekday!)}',
              actionLabel: live ? l10n.startNow : l10n.logNow,
              onAction: () => TrainScreen.startAndOpen(
                context,
                ref,
                () => ref.read(activeWorkoutProvider.notifier).startFromPlanDay(day, manual: !live),
              ),
            ),
            GlassCard(
              blur: false,
              child: Column(
                children: [
                  for (final e in day.exercises)
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(names[e.exerciseId]?.name ?? '…'),
                      trailing: Text(
                        '${e.sets} × ${e.reps}${e.repsMax == null ? '' : '–${e.repsMax}'}',
                        style: PulseTypography.number(fontSize: 15, color: context.colors.textSecondary),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
