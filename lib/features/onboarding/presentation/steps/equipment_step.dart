import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/domain/pulse_enums.dart';
import '../../../../l10n/enum_labels.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../application/onboarding_controller.dart';
import 'step_scaffold.dart';

/// Multi-select of available equipment.
class EquipmentStep extends ConsumerWidget {
  const EquipmentStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selected = ref.watch(onboardingControllerProvider).value?.equipment.toSet() ?? <Equipment>{};
    return StepScaffold(
      title: l10n.equipmentTitle,
      subtitle: l10n.equipmentBody,
      primaryLabel: l10n.next,
      onPrimary: onNext,
      child: Wrap(
        spacing: PulseMetrics.space8,
        runSpacing: PulseMetrics.space8,
        children: [
          for (final e in Equipment.values)
            FilterChip(
              label: Text(l10n.equipmentName(e)),
              selected: selected.contains(e),
              onSelected: (on) {
                Haptics.selection();
                ref.read(onboardingControllerProvider.notifier).edit((p) {
                  final next = {...p.equipment};
                  on ? next.add(e) : next.remove(e);
                  return p.copyWith(equipment: [for (final x in Equipment.values) if (next.contains(x)) x]);
                });
              },
            ),
        ],
      ),
    );
  }
}
