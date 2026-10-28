import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../application/plan_providers.dart';

/// All programs (prebuilt and custom); the active one first.
class ProgramsScreen extends ConsumerWidget {
  const ProgramsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final plans = ref.watch(planListProvider).value ?? const [];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.programs)),
      body: ListView.builder(
        padding: const EdgeInsets.all(PulseMetrics.space16),
        itemCount: plans.length,
        itemBuilder: (context, i) {
          final p = plans[i];
          return StaggeredEntry(
            index: i,
            child: Padding(
              padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
              child: GlassCard(
                blur: false,
                semanticLabel: p.name,
                onTap: () => PlanDetailRoute(id: p.id).push<void>(context),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p.name, style: text.titleMedium),
                          if (p.description != null) Text(p.description!, style: text.bodySmall),
                          if (p.weeks != null) Text(l10n.weeksCount(p.weeks!), style: text.labelSmall),
                        ],
                      ),
                    ),
                    if (p.active)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(gradient: c.accentGradient, borderRadius: BorderRadius.circular(999)),
                        child: Text(l10n.activeBadge, style: text.labelSmall?.copyWith(color: c.onAccent)),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
