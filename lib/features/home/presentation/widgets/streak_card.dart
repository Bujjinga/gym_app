import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../application/home_providers.dart';

class StreakCard extends ConsumerWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final streak = ref.watch(trainingStreakProvider);
    return GlassCard(
      semanticLabel: '${l10n.streakTitle}: ${l10n.streakDays(streak)}',
      child: ExcludeSemantics(
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: c.ringMove)),
              child: Icon(Icons.local_fire_department_rounded, color: c.onAccent, size: 30),
            ),
            const SizedBox(width: PulseMetrics.space16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.streakTitle, style: text.labelMedium),
                  if (streak > 0)
                    RollingNumber(value: streak, style: PulseTypography.number(fontSize: 34, color: c.textPrimary)),
                  Text(l10n.streakDays(streak), style: streak > 0 ? text.bodySmall : text.titleSmall),
                  if (streak == 0) Text(l10n.streakBody, style: text.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
