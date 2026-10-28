import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../application/onboarding_controller.dart';
import 'step_scaffold.dart';

/// Training days per week (1–7).
class ScheduleStep extends ConsumerWidget {
  const ScheduleStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final days = ref.watch(onboardingControllerProvider).value?.trainingDaysPerWeek;
    return StepScaffold(
      title: l10n.scheduleTitle,
      primaryLabel: l10n.next,
      onPrimary: days == null ? null : onNext,
      secondaryLabel: l10n.skip,
      onSecondary: onNext,
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: PulseMetrics.space12,
            runSpacing: PulseMetrics.space12,
            children: [
              for (var n = 1; n <= 7; n++)
                Semantics(
                  button: true,
                  selected: days == n,
                  label: l10n.daysPerWeek(n),
                  excludeSemantics: true,
                  child: PressScale(
                    child: GestureDetector(
                      onTap: () {
                        Haptics.selection();
                        ref.read(onboardingControllerProvider.notifier).edit((p) => p.copyWith(trainingDaysPerWeek: n));
                      },
                      child: AnimatedContainer(
                        duration: context.motion.medium,
                        curve: MotionPreset.snappy.curve,
                        width: 64,
                        height: 64,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: days == n ? c.accentGradient : null,
                          color: days == n ? null : c.glassFill,
                          border: Border.all(color: days == n ? Colors.transparent : c.glassBorder),
                        ),
                        child: Text(
                          '$n',
                          style: PulseTypography.number(fontSize: 24, color: days == n ? c.onAccent : c.textPrimary),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (days != null) ...[
            const SizedBox(height: PulseMetrics.space24),
            Text(l10n.daysPerWeek(days), style: Theme.of(context).textTheme.titleMedium),
          ],
        ],
      ),
    );
  }
}
