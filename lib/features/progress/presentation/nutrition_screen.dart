import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/ids.dart';
import '../../../core/utils/nutrition_targets.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../nutrition/data/drift_nutrition_repository.dart';
import '../../nutrition/domain/meal_entry.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/progress_providers.dart';
import 'progress_labels.dart';

/// Today's calories and macros against targets, with meals by type.
class NutritionScreen extends ConsumerWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final p = ref.watch(userProfileProvider).value;
    final meals = ref.watch(mealsTodayProvider).value ?? const [];
    final t = macroTargets(
      weightKg: p?.weightKg,
      heightCm: p?.heightCm,
      age: p?.ageOn(DateTime.now()),
      sex: p?.sex,
      trainingDaysPerWeek: p?.trainingDaysPerWeek,
      goal: p?.goal,
    );
    final kcal = meals.fold(0, (a, m) => a + m.calories);
    double sum(double Function(MealEntry m) f) => meals.fold(0.0, (a, m) => a + f(m));
    Widget bar(String label, double value, int target, Color color) => Padding(
          padding: const EdgeInsets.only(top: PulseMetrics.space12),
          child: Semantics(
            label: '$label ${value.round()} of $target ${l10n.gramsUnit}',
            excludeSemantics: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(child: Text(label, style: text.labelMedium)),
                  Text(l10n.ofTarget('${value.round()}', '$target ${l10n.gramsUnit}'), style: text.labelMedium),
                ]),
                const SizedBox(height: PulseMetrics.space4),
                TweenAnimationBuilder<double>(
                  tween: Tween(end: target == 0 ? 0 : (value / target).clamp(0, 1)),
                  duration: context.motion.slow,
                  builder: (context, v, _) => ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(value: v, minHeight: 8, color: color, backgroundColor: c.glassBorder),
                  ),
                ),
              ],
            ),
          ),
        );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.nutrition)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showAdaptiveSheet<void>(context: context, title: l10n.addFood, builder: (_) => const _MealForm()),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.addFood),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(PulseMetrics.space16, 0, PulseMetrics.space16, 96),
        children: [
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    RollingNumber(value: kcal, style: text.displaySmall),
                    Text(' / ${t.kcal} ${l10n.kcalUnit}', style: text.titleMedium),
                  ],
                ),
                bar(l10n.protein, sum((m) => m.proteinG), t.proteinG, c.ringMove.first),
                bar(l10n.carbs, sum((m) => m.carbsG), t.carbsG, c.accentEnd),
                bar(l10n.fat, sum((m) => m.fatG), t.fatG, c.warning),
              ],
            ),
          ),
          if (meals.isEmpty)
            EmptyState(icon: Icons.restaurant_rounded, title: l10n.noMeals, message: l10n.noMealsBody)
          else
            for (final type in MealType.values)
              if (meals.any((m) => m.meal == type)) ...[
                SectionHeader(title: mealLabel(l10n, type)),
                for (final m in meals.where((m) => m.meal == type))
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(m.name),
                    subtitle: Text('P ${m.proteinG.round()} · C ${m.carbsG.round()} · F ${m.fatG.round()} ${l10n.gramsUnit}'),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text('${m.calories} ${l10n.kcalUnit}', style: text.titleSmall),
                      IconButton(
                        tooltip: l10n.delete,
                        icon: const Icon(Icons.delete_outline_rounded),
                        onPressed: () => ref.read(nutritionRepositoryProvider).deleteMeal(m.id),
                      ),
                    ]),
                  ),
              ],
        ],
      ),
    );
  }
}

class _MealForm extends ConsumerStatefulWidget {
  const _MealForm();

  @override
  ConsumerState<_MealForm> createState() => _MealFormState();
}

class _MealFormState extends ConsumerState<_MealForm> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _kcal = TextEditingController();
  final _p = TextEditingController();
  final _c = TextEditingController();
  final _f = TextEditingController();
  MealType _meal = switch (DateTime.now().hour) { < 11 => MealType.breakfast, < 15 => MealType.lunch, < 21 => MealType.dinner, _ => MealType.snack };

  @override
  void dispose() {
    for (final c in [_name, _kcal, _p, _c, _f]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final digits = [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
    double g(TextEditingController c) => double.tryParse(c.text.replaceAll(',', '.')) ?? 0;
    Widget num(TextEditingController c, String label, String suffix, {bool required = false}) => Expanded(
          child: TextFormField(
            controller: c,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: digits,
            decoration: InputDecoration(labelText: label, suffixText: suffix),
            validator: required ? (v) => (int.tryParse(v ?? '') ?? -1) >= 0 ? null : l10n.invalidNumber(0, 5000) : null,
          ),
        );
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(spacing: PulseMetrics.space8, children: [
            for (final m in MealType.values)
              ChoiceChip(label: Text(mealLabel(l10n, m)), selected: _meal == m, onSelected: (_) => setState(() => _meal = m)),
          ]),
          const SizedBox(height: PulseMetrics.space12),
          TextFormField(
            controller: _name,
            autofocus: true,
            decoration: InputDecoration(labelText: l10n.foodName),
            validator: (v) => (v?.trim().isEmpty ?? true) ? l10n.nameRequired : null,
          ),
          const SizedBox(height: PulseMetrics.space12),
          Row(children: [num(_kcal, l10n.calories, l10n.kcalUnit, required: true)]),
          const SizedBox(height: PulseMetrics.space12),
          Row(children: [
            num(_p, l10n.protein, l10n.gramsUnit),
            const SizedBox(width: PulseMetrics.space8),
            num(_c, l10n.carbs, l10n.gramsUnit),
            const SizedBox(width: PulseMetrics.space8),
            num(_f, l10n.fat, l10n.gramsUnit),
          ]),
          const SizedBox(height: PulseMetrics.space24),
          PrimaryButton(
            label: l10n.save,
            expand: true,
            onPressed: () async {
              if (!_form.currentState!.validate()) return;
              await ref.read(nutritionRepositoryProvider).saveMeal(MealEntry(
                    id: newId(),
                    loggedAt: DateTime.now(),
                    meal: _meal,
                    name: _name.text.trim(),
                    calories: int.parse(_kcal.text),
                    proteinG: g(_p),
                    carbsG: g(_c),
                    fatG: g(_f),
                  ));
              Haptics.success();
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
