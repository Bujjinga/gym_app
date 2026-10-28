import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../coach/application/coach_providers.dart';
import '../../../coach/domain/coach_service.dart';

/// Recovery score ring, "ready to train" verdict and the coach's top tips.
class RecoveryCard extends ConsumerWidget {
  const RecoveryCard({super.key});

  static String tipText(AppLocalizations l10n, CoachTip tip) => switch (tip) {
        CoachTip.sleepMore => l10n.tipSleepMore,
        CoachTip.hrvLow => l10n.tipHrvLow,
        CoachTip.restingHrHigh => l10n.tipRestingHrHigh,
        CoachTip.loadSpike => l10n.tipLoadSpike,
        CoachTip.deload => l10n.tipDeload,
        CoachTip.connectHealth => l10n.tipConnectHealth,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final report = ref.watch(coachReportProvider).value;
    if (report == null) return const GlassCard(child: SizedBox(height: 96));
    final score = report.recoveryScore;
    final (verdict, colors) = switch (report.readiness) {
      Readiness.ready => (l10n.readyToTrain, c.ringExercise),
      Readiness.light => (l10n.trainLight, c.ringSteps),
      Readiness.rest => (l10n.restDay, c.ringMove),
      null => (l10n.recoveryUnknown, c.ringExercise),
    };
    return GlassCard(
      semanticLabel: [l10n.recoveryTitle, if (score != null) l10n.recoveryScore(score), verdict].join(', '),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExcludeSemantics(
            child: RingProgress(
              value: (score ?? 0) / 100,
              colors: colors,
              size: 84,
              strokeWidth: 10,
              child: Text(score?.toString() ?? '–', style: PulseTypography.number(fontSize: 26, color: c.textPrimary)),
            ),
          ),
          const SizedBox(width: PulseMetrics.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExcludeSemantics(child: Text(l10n.recoveryTitle, style: text.labelMedium)),
                ExcludeSemantics(child: Text(verdict, style: text.titleMedium)),
                for (final tip in report.tips.take(2)) ...[
                  const SizedBox(height: PulseMetrics.space8),
                  Text(tipText(l10n, tip), style: text.bodySmall),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
