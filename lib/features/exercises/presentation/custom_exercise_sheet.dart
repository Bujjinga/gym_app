import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/ids.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../data/drift_exercise_repository.dart';
import '../domain/exercise.dart';

/// Creates a custom exercise (sheet on phones, dialog on desktop).
Future<void> showCustomExerciseSheet(BuildContext context) => showAdaptiveSheet<void>(
      context: context,
      title: AppLocalizations.of(context).createExercise,
      builder: (_) => const _CustomExerciseForm(),
    );

class _CustomExerciseForm extends ConsumerStatefulWidget {
  const _CustomExerciseForm();

  @override
  ConsumerState<_CustomExerciseForm> createState() => _CustomExerciseFormState();
}

class _CustomExerciseFormState extends ConsumerState<_CustomExerciseForm> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  MuscleGroup _muscle = MuscleGroup.chest;
  Equipment _equipment = Equipment.dumbbell;
  Difficulty _difficulty = Difficulty.beginner;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    await ref.read(exerciseRepositoryProvider).saveCustom(Exercise(
          id: newId(),
          name: _name.text.trim(),
          primaryMuscle: _muscle,
          equipment: _equipment,
          difficulty: _difficulty,
          // Isolation is the safest generic pattern for a user-defined move.
          movementPattern: MovementPattern.isolation,
          isCustom: true,
        ));
    Haptics.success();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _name,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(labelText: l10n.exerciseName),
            validator: (v) => (v?.trim().isEmpty ?? true) ? l10n.nameRequired : null,
          ),
          const SizedBox(height: PulseMetrics.space16),
          DropdownButtonFormField<MuscleGroup>(
            initialValue: _muscle,
            decoration: InputDecoration(labelText: l10n.primaryMuscle),
            items: [for (final m in MuscleGroup.values) DropdownMenuItem(value: m, child: Text(l10n.muscle(m)))],
            onChanged: (m) => setState(() => _muscle = m!),
          ),
          const SizedBox(height: PulseMetrics.space16),
          DropdownButtonFormField<Equipment>(
            initialValue: _equipment,
            decoration: InputDecoration(labelText: l10n.equipment),
            items: [
              for (final e in Equipment.values) DropdownMenuItem(value: e, child: Text(l10n.equipmentName(e))),
            ],
            onChanged: (e) => setState(() => _equipment = e!),
          ),
          const SizedBox(height: PulseMetrics.space16),
          DropdownButtonFormField<Difficulty>(
            initialValue: _difficulty,
            decoration: InputDecoration(labelText: l10n.difficulty),
            items: [
              for (final d in Difficulty.values) DropdownMenuItem(value: d, child: Text(l10n.difficultyName(d))),
            ],
            onChanged: (d) => setState(() => _difficulty = d!),
          ),
          const SizedBox(height: PulseMetrics.space24),
          PrimaryButton(label: l10n.save, onPressed: _save, expand: true),
        ],
      ),
    );
  }
}
