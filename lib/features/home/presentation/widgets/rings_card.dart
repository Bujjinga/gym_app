import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../profile/data/drift_profile_repository.dart';
import '../../application/home_providers.dart';

/// Today's Move / Exercise / Steps rings with a value legend.
class RingsCard extends ConsumerWidget {
  const RingsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final p = ref.watch(userProfileProvider).value;
    final day = ref.watch(todayActivityProvider).value;
    final kcal = day?.activeKcal.round() ?? 0;
    final int minutes = (day?.exerciseMin ?? 0) + ref.watch(todayWorkoutMinutesProvider);
    final steps = day?.steps ?? 0;
    final moveGoal = p?.moveGoalKcal ?? 500;
    final exerciseGoal = p?.exerciseGoalMin ?? 30;
    final stepsGoal = p?.stepsGoal ?? 10000;
    double frac(num v, num goal) => goal <= 0 ? 0 : v / goal;
    final move = frac(kcal, moveGoal), exercise = frac(minutes, exerciseGoal), stepsF = frac(steps, stepsGoal);

    Widget legend(Color color, String label, int value, int goal, String unit) => Padding(
          padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
          child: Row(
            children: [
              Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: PulseMetrics.space8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: text.labelMedium),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        RollingNumber(value: value, style: PulseTypography.number(fontSize: 20, color: c.textPrimary)),
                        Flexible(child: Text(' / $goal $unit', style: text.bodySmall, overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.ringsTitle, style: text.titleMedium),
          const SizedBox(height: PulseMetrics.space16),
          Row(
            children: [
              ActivityRings(
                move: move,
                exercise: exercise,
                steps: stepsF,
                size: 148,
                semanticLabel:
                    l10n.ringsSemantics((move * 100).round(), (exercise * 100).round(), (stepsF * 100).round()),
              ),
              const SizedBox(width: PulseMetrics.space24),
              Expanded(
                child: Column(
                  children: [
                    legend(c.ringMove.first, l10n.ringMove, kcal, moveGoal, l10n.kcalUnit),
                    legend(c.ringExercise.first, l10n.ringExercise, minutes, exerciseGoal, l10n.minUnit),
                    legend(c.ringSteps.first, l10n.ringSteps, steps, stepsGoal, ''),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
