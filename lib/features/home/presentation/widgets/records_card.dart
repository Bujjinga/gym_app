import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/domain/pulse_enums.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/enum_labels.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../profile/data/drift_profile_repository.dart';
import '../../../workout/application/workout_providers.dart';
import '../../application/home_providers.dart';

/// The three most recent personal records; ones from the last week shimmer.
class RecordsCard extends ConsumerWidget {
  const RecordsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final records = ref.watch(recentRecordsProvider).value ?? const [];
    final unit = ref.watch(userProfileProvider).value?.weightUnit ?? WeightUnit.kg;
    final ids = (records.map((r) => r.exerciseId).toSet().toList()..sort()).join(',');
    final names = ref.watch(exercisesByIdsProvider(ids)).value ?? const {};
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.recordsTitle, style: text.titleMedium),
          const SizedBox(height: PulseMetrics.space8),
          if (records.isEmpty)
            Text(l10n.noRecords, style: text.bodySmall)
          else
            for (final r in records)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.emoji_events_rounded, color: c.warning),
                title: Text(names[r.exerciseId]?.name ?? '…'),
                subtitle: Text(l10n.recordTypeName(r.type)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (r.achievedAt.isAfter(weekAgo))
                      Padding(
                        padding: const EdgeInsets.only(right: PulseMetrics.space8),
                        child: ShimmerBadge(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(gradient: c.accentGradient, borderRadius: BorderRadius.circular(999)),
                            child: Text(l10n.newBadge, style: text.labelSmall?.copyWith(color: c.onAccent)),
                          ),
                        ),
                      ),
                    Text(
                      r.type == RecordType.maxReps ? '${r.value.round()} ${l10n.reps}' : Fmt.weight(r.value, unit),
                      style: text.titleSmall,
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
