import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../achievements/data/drift_progress_repository.dart';
import '../../achievements/domain/personal_record.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../../workout/application/workout_providers.dart';

final _allRecords = StreamProvider.autoDispose<List<PersonalRecord>>((ref) => ref.watch(progressRepositoryProvider).watchRecords());

/// Best record per exercise and type.
class RecordsScreen extends ConsumerWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final unit = ref.watch(userProfileProvider).value?.weightUnit ?? WeightUnit.kg;
    final records = ref.watch(_allRecords).value ?? const [];
    final best = <String, Map<RecordType, PersonalRecord>>{};
    for (final r in records) {
      final m = best.putIfAbsent(r.exerciseId, () => {});
      if ((m[r.type]?.value ?? -1) < r.value) m[r.type] = r;
    }
    final names = ref.watch(exercisesByIdsProvider((best.keys.toList()..sort()).join(','))).value ?? const {};
    final ordered = best.keys.toList()..sort((a, b) => (names[a]?.name ?? '').compareTo(names[b]?.name ?? ''));
    String fmt(PersonalRecord r) => switch (r.type) {
          RecordType.maxReps => '${r.value.round()} ${l10n.reps}',
          RecordType.maxWeight => Fmt.set(r.value, r.reps, unit),
          _ => Fmt.weight(r.value, unit),
        };

    return Scaffold(
      appBar: AppBar(title: Text(l10n.recordsBoard)),
      body: ordered.isEmpty
          ? EmptyState(icon: Icons.emoji_events_rounded, title: l10n.recordsBoard, message: l10n.noRecords)
          : ListView.builder(
              padding: const EdgeInsets.all(PulseMetrics.space16),
              itemCount: ordered.length,
              itemBuilder: (context, i) {
                final types = best[ordered[i]]!;
                return StaggeredEntry(
                  index: i,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
                    child: GlassCard(
                      blur: false,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(names[ordered[i]]?.name ?? '…', style: text.titleMedium),
                        const SizedBox(height: PulseMetrics.space8),
                        for (final t in RecordType.values)
                          if (types[t] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: PulseMetrics.space4),
                              child: Row(children: [
                                Icon(Icons.emoji_events_rounded, size: 16, color: c.warning),
                                const SizedBox(width: PulseMetrics.space8),
                                Expanded(child: Text(l10n.recordTypeName(t), style: text.bodyMedium)),
                                Text(fmt(types[t]!), style: text.titleSmall),
                                const SizedBox(width: PulseMetrics.space8),
                                Text(DateFormat.yMMMd().format(types[t]!.achievedAt.toLocal()), style: text.labelSmall),
                              ]),
                            ),
                      ]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
