import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/domain/pulse_enums.dart';
import '../../../../core/utils/unit_conversion.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../profile/data/drift_profile_repository.dart';
import '../../application/home_providers.dart';

/// Steps, distance, floors and active calories for today.
class ActivityStatsCard extends ConsumerWidget {
  const ActivityStatsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final day = ref.watch(todayActivityProvider).value;
    final unit = ref.watch(userProfileProvider).value?.distanceUnit ?? DistanceUnit.km;
    final tiles = [
      StatTile(icon: Icons.directions_walk_rounded, label: l10n.statSteps, value: day?.steps ?? 0, accent: c.ringSteps.first),
      StatTile(
        icon: Icons.route_rounded,
        label: l10n.statDistance,
        value: Units.distanceFromMeters(day?.distanceM ?? 0, unit),
        fractionDigits: 2,
        unit: unit.name,
        accent: c.accentEnd,
      ),
      StatTile(icon: Icons.stairs_rounded, label: l10n.statFloors, value: day?.floors ?? 0, accent: c.ringSteps.last),
      StatTile(
        icon: Icons.local_fire_department_rounded,
        label: l10n.statActiveCalories,
        value: (day?.activeKcal ?? 0).round(),
        unit: l10n.kcalUnit,
        accent: c.ringMove.first,
      ),
    ];
    return LayoutBuilder(
      builder: (context, box) {
        final w = (box.maxWidth - PulseMetrics.space12) / 2;
        return Wrap(
          spacing: PulseMetrics.space12,
          runSpacing: PulseMetrics.space12,
          children: [for (final t in tiles) SizedBox(width: w, child: t)],
        );
      },
    );
  }
}
