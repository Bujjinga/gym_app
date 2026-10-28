import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/domain/pulse_enums.dart';
import '../../../../core/utils/unit_conversion.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../application/onboarding_controller.dart';
import 'step_scaffold.dart';

/// Optional body stats and unit preferences. Values are entered in the
/// chosen units and stored metric.
class BodyStep extends ConsumerStatefulWidget {
  const BodyStep({super.key, required this.onNext, this.isLast = false});

  final VoidCallback onNext;
  final bool isLast;

  @override
  ConsumerState<BodyStep> createState() => _BodyStepState();
}

class _BodyStepState extends ConsumerState<BodyStep> {
  final _form = GlobalKey<FormState>();
  final _height = TextEditingController();
  final _weight = TextEditingController();
  final _birthYear = TextEditingController();

  @override
  void dispose() {
    _height.dispose();
    _weight.dispose();
    _birthYear.dispose();
    super.dispose();
  }

  String? Function(String?) _range(AppLocalizations l10n, num min, num max) => (v) {
        if (v == null || v.trim().isEmpty) return null; // optional
        final n = num.tryParse(v.replaceAll(',', '.'));
        return n == null || n < min || n > max ? l10n.invalidNumber(min.round(), max.round()) : null;
      };

  void _submit() {
    if (!_form.currentState!.validate()) return;
    double? parse(TextEditingController c) => double.tryParse(c.text.replaceAll(',', '.'));
    ref.read(onboardingControllerProvider.notifier).edit((p) {
      final metricHeight = p.distanceUnit == DistanceUnit.km;
      final h = parse(_height);
      final w = parse(_weight);
      return p.copyWith(
        heightCm: h == null ? null : (metricHeight ? h : Units.inToCm(h)),
        weightKg: w == null ? null : Units.weightToKg(w, p.weightUnit),
        birthYear: int.tryParse(_birthYear.text),
      );
    });
    widget.onNext();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = ref.watch(onboardingControllerProvider).value!;
    final notifier = ref.read(onboardingControllerProvider.notifier);
    final metric = p.distanceUnit == DistanceUnit.km;
    final kg = p.weightUnit == WeightUnit.kg;
    final digits = [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
    return StepScaffold(
      title: l10n.bodyTitle,
      subtitle: l10n.bodyBody,
      primaryLabel: widget.isLast ? l10n.finish : l10n.next,
      onPrimary: _submit,
      child: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.units, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: PulseMetrics.space8),
            Wrap(
              spacing: PulseMetrics.space12,
              runSpacing: PulseMetrics.space8,
              children: [
                SegmentedButton<WeightUnit>(
                  segments: [
                    ButtonSegment(value: WeightUnit.kg, label: Text(l10n.unitKg)),
                    ButtonSegment(value: WeightUnit.lb, label: Text(l10n.unitLb)),
                  ],
                  selected: {p.weightUnit},
                  onSelectionChanged: (s) => notifier.edit((p) => p.copyWith(weightUnit: s.first)),
                ),
                SegmentedButton<DistanceUnit>(
                  segments: [
                    ButtonSegment(value: DistanceUnit.km, label: Text(l10n.unitKm)),
                    ButtonSegment(value: DistanceUnit.mi, label: Text(l10n.unitMi)),
                  ],
                  selected: {p.distanceUnit},
                  onSelectionChanged: (s) => notifier.edit((p) => p.copyWith(distanceUnit: s.first)),
                ),
              ],
            ),
            const SizedBox(height: PulseMetrics.space24),
            TextFormField(
              controller: _height,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: digits,
              decoration: InputDecoration(labelText: l10n.height, suffixText: metric ? l10n.unitCm : l10n.unitIn),
              validator: metric ? _range(l10n, 100, 250) : _range(l10n, 40, 100),
            ),
            const SizedBox(height: PulseMetrics.space12),
            TextFormField(
              controller: _weight,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: digits,
              decoration: InputDecoration(labelText: l10n.weight, suffixText: kg ? l10n.unitKg : l10n.unitLb),
              validator: kg ? _range(l10n, 30, 300) : _range(l10n, 66, 660),
            ),
            const SizedBox(height: PulseMetrics.space12),
            TextFormField(
              controller: _birthYear,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: l10n.birthYear),
              validator: _range(l10n, 1920, DateTime.now().year - 10),
            ),
            const SizedBox(height: PulseMetrics.space24),
            Text(l10n.sex, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: PulseMetrics.space8),
            Wrap(
              spacing: PulseMetrics.space8,
              runSpacing: PulseMetrics.space8,
              children: [
                for (final (value, label) in [
                  (Sex.female, l10n.sexFemale),
                  (Sex.male, l10n.sexMale),
                  (Sex.other, l10n.sexOther),
                  (Sex.preferNotToSay, l10n.sexPreferNot),
                ])
                  ChoiceChip(
                    label: Text(label),
                    selected: p.sex == value,
                    onSelected: (_) => notifier.edit((p) => p.copyWith(sex: value)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
