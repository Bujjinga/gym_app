import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/domain/pulse_enums.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../application/onboarding_controller.dart';
import 'step_scaffold.dart';

/// Goal and experience are both single-choice card lists.
class GoalStep extends ConsumerWidget {
  const GoalStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final goal = ref.watch(onboardingControllerProvider).value?.goal;
    final options = [
      (TrainingGoal.buildMuscle, Icons.fitness_center_rounded, l10n.goalBuildMuscle, l10n.goalBuildMuscleBody),
      (TrainingGoal.loseFat, Icons.local_fire_department_rounded, l10n.goalLoseFat, l10n.goalLoseFatBody),
      (TrainingGoal.endurance, Icons.directions_run_rounded, l10n.goalEndurance, l10n.goalEnduranceBody),
      (TrainingGoal.generalFitness, Icons.favorite_rounded, l10n.goalGeneral, l10n.goalGeneralBody),
    ];
    return StepScaffold(
      title: l10n.goalTitle,
      primaryLabel: l10n.next,
      onPrimary: goal == null ? null : onNext,
      secondaryLabel: l10n.skip,
      onSecondary: onNext,
      child: Column(
        children: [
          for (final (value, icon, title, body) in options)
            ChoiceCard(
              icon: icon,
              title: title,
              body: body,
              selected: goal == value,
              onTap: () => ref.read(onboardingControllerProvider.notifier).edit((p) => p.copyWith(goal: value)),
            ),
        ],
      ),
    );
  }
}

class ExperienceStep extends ConsumerWidget {
  const ExperienceStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final level = ref.watch(onboardingControllerProvider).value?.experience;
    final options = [
      (ExperienceLevel.beginner, Icons.spa_rounded, l10n.expBeginner, l10n.expBeginnerBody),
      (ExperienceLevel.intermediate, Icons.trending_up_rounded, l10n.expIntermediate, l10n.expIntermediateBody),
      (ExperienceLevel.advanced, Icons.bolt_rounded, l10n.expAdvanced, l10n.expAdvancedBody),
    ];
    return StepScaffold(
      title: l10n.experienceTitle,
      primaryLabel: l10n.next,
      onPrimary: level == null ? null : onNext,
      secondaryLabel: l10n.skip,
      onSecondary: onNext,
      child: Column(
        children: [
          for (final (value, icon, title, body) in options)
            ChoiceCard(
              icon: icon,
              title: title,
              body: body,
              selected: level == value,
              onTap: () => ref.read(onboardingControllerProvider.notifier).edit((p) => p.copyWith(experience: value)),
            ),
        ],
      ),
    );
  }
}
