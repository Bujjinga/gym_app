import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/domain/pulse_enums.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/utils/plate_calculator.dart';
import '../../../../core/utils/strength_calculations.dart';
import '../../../../l10n/gen/app_localizations.dart';

/// Plate calculator sheet (values in the user's unit).
Future<void> showPlateCalculator(BuildContext context, WeightUnit unit) => showAdaptiveSheet<void>(
      context: context,
      title: AppLocalizations.of(context).plateCalculator,
      builder: (_) => _PlateCalculator(unit: unit),
    );

/// Epley / Brzycki one-rep-max estimator sheet.
Future<void> showOneRepMaxCalculator(BuildContext context, WeightUnit unit) => showAdaptiveSheet<void>(
      context: context,
      title: AppLocalizations.of(context).oneRepMax,
      builder: (_) => _OneRepMax(unit: unit),
    );

final _decimals = [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
double? _parse(String v) => double.tryParse(v.replaceAll(',', '.'));

class _PlateCalculator extends StatefulWidget {
  const _PlateCalculator({required this.unit});

  final WeightUnit unit;

  @override
  State<_PlateCalculator> createState() => _PlateCalculatorState();
}

class _PlateCalculatorState extends State<_PlateCalculator> {
  late final _target = TextEditingController(text: widget.unit == WeightUnit.kg ? '100' : '225');
  late double _bar = widget.unit == WeightUnit.kg ? 20 : 45;

  @override
  void dispose() {
    _target.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final kg = widget.unit == WeightUnit.kg;
    final target = _parse(_target.text) ?? 0;
    final load = PlateCalculator.calculate(
      target: target,
      bar: _bar,
      plates: kg ? PlateCalculator.kgPlates : PlateCalculator.lbPlates,
    );
    final u = widget.unit.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _target,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: _decimals,
          decoration: InputDecoration(labelText: l10n.plateTarget, suffixText: u),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: PulseMetrics.space12),
        Text(l10n.plateBar, style: text.labelMedium),
        Wrap(
          spacing: PulseMetrics.space8,
          children: [
            for (final b in kg ? const [20.0, 15.0, 10.0] : const [45.0, 35.0, 25.0])
              ChoiceChip(label: Text('${Fmt.number(b)} $u'), selected: _bar == b, onSelected: (_) => setState(() => _bar = b)),
          ],
        ),
        const SizedBox(height: PulseMetrics.space16),
        Text(l10n.platePerSide, style: text.labelMedium),
        const SizedBox(height: PulseMetrics.space8),
        Semantics(
          label: '${l10n.platePerSide}: ${load.perSide.map(Fmt.number).join(', ')} $u',
          excludeSemantics: true,
          child: SizedBox(
            height: 96,
            child: Row(
              children: [
                Container(width: 24, height: 12, color: c.textMuted),
                for (final p in load.perSide)
                  Container(
                    margin: const EdgeInsets.only(left: 2),
                    width: 18,
                    height: 40 + 50 * (p / (kg ? 25 : 45)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(gradient: c.accentGradient, borderRadius: BorderRadius.circular(4)),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(Fmt.number(p, decimals: 2), style: text.labelSmall?.copyWith(color: c.onAccent)),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if ((load.achieved - target).abs() > 1e-6 && target > _bar)
          Text(l10n.plateRemainder('${Fmt.number(load.achieved, decimals: 2)} $u'),
              style: text.bodySmall?.copyWith(color: c.warning)),
      ],
    );
  }
}

class _OneRepMax extends StatefulWidget {
  const _OneRepMax({required this.unit});

  final WeightUnit unit;

  @override
  State<_OneRepMax> createState() => _OneRepMaxState();
}

class _OneRepMaxState extends State<_OneRepMax> {
  final _weight = TextEditingController();
  final _reps = TextEditingController(text: '5');

  @override
  void dispose() {
    _weight.dispose();
    _reps.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final w = _parse(_weight.text) ?? 0;
    final r = int.tryParse(_reps.text) ?? 0;
    final u = widget.unit.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _weight,
                autofocus: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: _decimals,
                decoration: InputDecoration(labelText: l10n.weight1rmHint, suffixText: u),
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(width: PulseMetrics.space12),
            SizedBox(
              width: 96,
              child: TextField(
                controller: _reps,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: l10n.reps),
                onChanged: (_) => setState(() {}),
              ),
            ),
          ],
        ),
        const SizedBox(height: PulseMetrics.space16),
        Row(
          children: [
            // The formulas are unit-agnostic, so they run on the displayed unit directly.
            Expanded(child: StatTile(icon: Icons.functions_rounded, label: l10n.epley, value: Strength.epley(w, r), unit: u, fractionDigits: 1)),
            const SizedBox(width: PulseMetrics.space12),
            Expanded(
              child: StatTile(icon: Icons.calculate_rounded, label: l10n.brzycki, value: Strength.brzycki(w, r), unit: u, fractionDigits: 1),
            ),
          ],
        ),
      ],
    );
  }
}
