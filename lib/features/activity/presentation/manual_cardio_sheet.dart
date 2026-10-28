import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/cardio_calculations.dart';
import '../../../core/utils/ids.dart';
import '../../../core/utils/unit_conversion.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../achievements/application/achievement_engine.dart';
import '../../achievements/domain/achievement_catalog.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../data/drift_activity_repository.dart';
import '../domain/cardio_session.dart';
import 'activity_labels.dart';

/// Manual cardio entry (all platforms): type, date, duration, distance and
/// optional calories (estimated from MET when left empty).
Future<void> showManualCardioSheet(BuildContext context) => showAdaptiveSheet<void>(
      context: context,
      title: AppLocalizations.of(context).logCardio,
      builder: (_) => const _ManualCardioForm(),
    );

class _ManualCardioForm extends ConsumerStatefulWidget {
  const _ManualCardioForm();

  @override
  ConsumerState<_ManualCardioForm> createState() => _ManualCardioFormState();
}

class _ManualCardioFormState extends ConsumerState<_ManualCardioForm> {
  final _form = GlobalKey<FormState>();
  final _minutes = TextEditingController(text: '30');
  final _distance = TextEditingController();
  final _calories = TextEditingController();
  CardioType _type = CardioType.walk;
  DateTime _date = DateTime.now();

  @override
  void dispose() {
    _minutes.dispose();
    _distance.dispose();
    _calories.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    final l10n = AppLocalizations.of(context);
    final profile = await ref.read(profileRepositoryProvider).get();
    final minutes = int.parse(_minutes.text);
    final distance = Units.distanceToMeters(double.tryParse(_distance.text.replaceAll(',', '.')) ?? 0, profile.distanceUnit);
    final calories = double.tryParse(_calories.text) ??
        Cardio.sessionCalories(type: _type, distanceM: distance, durationSec: minutes * 60, weightKg: profile.weightKg);
    final start = _date.subtract(Duration(minutes: minutes));
    await ref.read(activityRepositoryProvider).saveCardio(CardioSession(
          id: newId(),
          type: _type,
          source: CardioSource.manual,
          startedAt: start,
          endedAt: _date,
          durationSec: minutes * 60,
          distanceM: distance,
          caloriesKcal: calories,
        ));
    await ref.read(achievementEngineProvider).award(xp: XpRewards.cardio(distanceM: distance));
    Haptics.success();
    if (!mounted) return;
    Navigator.of(context).pop();
    PulseToast.show(context, l10n.activitySaved, kind: ToastKind.success);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final unit = ref.watch(userProfileProvider).value?.distanceUnit ?? DistanceUnit.km;
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: PulseMetrics.space8,
            runSpacing: PulseMetrics.space8,
            children: [
              for (final t in CardioType.values)
                ChoiceChip(
                  avatar: Icon(cardioTypeIcon(t), size: 18),
                  label: Text(cardioTypeLabel(l10n, t)),
                  selected: _type == t,
                  onSelected: (_) => setState(() => _type = t),
                ),
            ],
          ),
          const SizedBox(height: PulseMetrics.space16),
          SecondaryButton(
            label: '${l10n.date}: ${DateFormat.yMMMd().add_jm().format(_date)}',
            icon: Icons.event_rounded,
            onPressed: () async {
              final d = await showDatePicker(context: context, initialDate: _date, firstDate: DateTime(2000), lastDate: DateTime.now());
              if (d == null || !context.mounted) return;
              final t = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(_date));
              setState(() => _date = DateTime(d.year, d.month, d.day, t?.hour ?? _date.hour, t?.minute ?? _date.minute));
            },
          ),
          const SizedBox(height: PulseMetrics.space12),
          TextFormField(
            controller: _minutes,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(labelText: l10n.minutesLabel),
            validator: (v) => (int.tryParse(v ?? '') ?? 0) > 0 ? null : l10n.invalidDuration,
          ),
          const SizedBox(height: PulseMetrics.space12),
          TextFormField(
            controller: _distance,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
            decoration: InputDecoration(labelText: l10n.distance, suffixText: unit.name),
          ),
          const SizedBox(height: PulseMetrics.space12),
          TextFormField(
            controller: _calories,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(labelText: l10n.caloriesOptional, suffixText: l10n.kcalUnit),
          ),
          const SizedBox(height: PulseMetrics.space24),
          PrimaryButton(label: l10n.save, onPressed: _save, expand: true),
        ],
      ),
    );
  }
}
