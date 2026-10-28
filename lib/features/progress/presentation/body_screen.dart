import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/ids.dart';
import '../../../core/utils/unit_conversion.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../body/data/drift_body_repository.dart';
import '../../body/domain/body_measurement.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../../profile/domain/user_profile.dart';
import '../application/progress_providers.dart';
import 'progress_labels.dart';

/// Weight, body fat and circumferences with a trend line (7-entry moving average).
class BodyScreen extends ConsumerStatefulWidget {
  const BodyScreen({super.key});

  @override
  ConsumerState<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends ConsumerState<BodyScreen> {
  MeasurementType _type = MeasurementType.weight;

  /// Canonical value (kg / % / cm) → display value and unit.
  static (double, String) display(MeasurementType t, double v, UserProfile? p) => switch (t) {
        MeasurementType.weight => (Units.weightFromKg(v, p?.weightUnit ?? WeightUnit.kg), (p?.weightUnit ?? WeightUnit.kg).name),
        MeasurementType.bodyFat => (v, '%'),
        _ => p?.distanceUnit == DistanceUnit.mi ? (Units.cmToIn(v), 'in') : (v, 'cm'),
      };

  static double toCanonical(MeasurementType t, double v, UserProfile? p) => switch (t) {
        MeasurementType.weight => Units.weightToKg(v, p?.weightUnit ?? WeightUnit.kg),
        MeasurementType.bodyFat => v,
        _ => p?.distanceUnit == DistanceUnit.mi ? Units.inToCm(v) : v,
      };

  Future<void> _add(UserProfile? profile) async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController();
    final unit = display(_type, 0, profile).$2;
    final value = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(measurementLabel(l10n, _type)),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
          decoration: InputDecoration(labelText: l10n.value, suffixText: unit),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, double.tryParse(controller.text.replaceAll(',', '.'))),
            child: Text(l10n.save),
          ),
        ],
      ),
    );
    controller.dispose();
    if (value == null || value <= 0) return;
    final canonical = toCanonical(_type, value, profile);
    await ref.read(bodyRepositoryProvider).saveMeasurement(
          BodyMeasurement(id: newId(), type: _type, value: canonical, measuredAt: DateTime.now()),
        );
    // Latest weight also drives calorie estimates.
    if (_type == MeasurementType.weight) {
      final repo = ref.read(profileRepositoryProvider);
      await repo.save((await repo.get()).copyWith(weightKg: canonical));
    }
    Haptics.success();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final profile = ref.watch(userProfileProvider).value;
    final entries = ref.watch(measurementsProvider(_type)).value ?? const [];
    final values = [for (final e in entries) display(_type, e.value, profile).$1];
    final unit = display(_type, 0, profile).$2;
    final avg = [
      for (var i = 0; i < values.length; i++)
        values.sublist((i - 6).clamp(0, i), i + 1).reduce((a, b) => a + b) / (i - (i - 6).clamp(0, i) + 1),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.bodyAndWeight)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _add(profile),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.addEntry),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(PulseMetrics.space16, 0, PulseMetrics.space16, 96),
        children: [
          FilterChipRow<MeasurementType>(
            options: MeasurementType.values,
            selected: {_type},
            labelOf: (t) => measurementLabel(l10n, t),
            onChanged: (s) => setState(() => _type = s.first),
          ),
          const SizedBox(height: PulseMetrics.space12),
          if (entries.isEmpty)
            EmptyState(icon: Icons.monitor_weight_rounded, title: l10n.noEntries, message: l10n.noEntriesBody)
          else ...[
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      RollingNumber(value: values.last, fractionDigits: 1, style: text.displaySmall),
                      Text(' $unit', style: text.titleMedium),
                    ],
                  ),
                  const SizedBox(height: PulseMetrics.space16),
                  Semantics(
                    label: '${l10n.trend}: ${values.map(Fmt.number).join(', ')} $unit',
                    excludeSemantics: true,
                    child: SizedBox(
                      height: 180,
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [for (final (i, v) in values.indexed) FlSpot(i.toDouble(), v)],
                              color: c.textMuted,
                              barWidth: 1.5,
                              dotData: const FlDotData(show: true),
                            ),
                            LineChartBarData(
                              spots: [for (final (i, v) in avg.indexed) FlSpot(i.toDouble(), v)],
                              isCurved: true,
                              barWidth: 3,
                              gradient: c.accentGradient,
                              dotData: const FlDotData(show: false),
                            ),
                          ],
                        ),
                        duration: context.motion.slow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: PulseMetrics.space8),
            for (final e in entries.reversed)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('${Fmt.number(display(_type, e.value, profile).$1)} $unit'),
                subtitle: Text(DateFormat.yMMMd().add_jm().format(e.measuredAt.toLocal())),
                trailing: IconButton(
                  tooltip: l10n.delete,
                  icon: const Icon(Icons.delete_outline_rounded),
                  onPressed: () => ref.read(bodyRepositoryProvider).deleteMeasurement(e.id),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
