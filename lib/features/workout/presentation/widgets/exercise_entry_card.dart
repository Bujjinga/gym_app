import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/domain/pulse_enums.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/utils/unit_conversion.dart';
import '../../../../l10n/enum_labels.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../exercises/domain/exercise.dart';
import '../../application/active_workout_controller.dart';
import '../../domain/exercise_entry.dart';
import '../../domain/set_entry.dart';

/// One exercise in the active workout: header with actions, "last time"
/// hint, set rows and "Add set".
class ExerciseEntryCard extends ConsumerWidget {
  const ExerciseEntryCard({
    super.key,
    required this.entry,
    required this.exercise,
    required this.lastTime,
    required this.unit,
    required this.manual,
    required this.isLast,
    required this.swipeToComplete,
  });

  final ExerciseEntry entry;
  final Exercise? exercise;
  final List<SetEntry> lastTime;
  final WeightUnit unit;
  final bool manual;
  final bool isLast;

  /// Swipe gesture on set rows (touch devices, live workouts).
  final bool swipeToComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final working = lastTime.where((s) => s.type != SetType.warmup).toList();
    final best = working.isEmpty ? null : working.reduce((a, b) => (b.weightKg ?? 0) > (a.weightKg ?? 0) ? b : a);

    return Padding(
      padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
      child: GlassCard(
        blur: false,
        padding: EdgeInsets.zero,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Superset marker: a coloured bar shared by grouped entries.
              if (entry.supersetGroup != null)
                Container(width: 4, color: c.zones[(entry.supersetGroup! - 1) % c.zones.length]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(PulseMetrics.space16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(exercise?.name ?? '…', style: text.titleMedium),
                                if (exercise != null)
                                  Text(
                                    [
                                      l10n.muscle(exercise!.primaryMuscle),
                                      if (entry.supersetGroup != null) l10n.superset,
                                    ].join(' · '),
                                    style: text.bodySmall,
                                  ),
                              ],
                            ),
                          ),
                          _EntryMenu(entry: entry, isLast: isLast),
                        ],
                      ),
                      if (best != null)
                        Padding(
                          padding: const EdgeInsets.only(top: PulseMetrics.space4),
                          child: Text(
                            l10n.lastTime(Fmt.set(best.weightKg, best.reps, unit)),
                            style: text.labelMedium?.copyWith(color: c.accentEnd),
                          ),
                        ),
                      if (entry.notes != null)
                        Padding(
                          padding: const EdgeInsets.only(top: PulseMetrics.space4),
                          child: Text(entry.notes!, style: text.bodySmall?.copyWith(fontStyle: FontStyle.italic)),
                        ),
                      const SizedBox(height: PulseMetrics.space12),
                      DefaultTextStyle(
                        style: text.labelSmall!,
                        child: Row(
                          children: [
                            const SizedBox(width: 44, child: Text('#')),
                            Expanded(child: Text(l10n.weightUnitName(unit))),
                            Expanded(child: Text(l10n.reps)),
                            SizedBox(width: 56, child: Text(l10n.rpe)),
                            const SizedBox(width: 44),
                          ],
                        ),
                      ),
                      for (final (i, set) in entry.sets.indexed)
                        _SetRow(
                          key: ValueKey(set.id),
                          entryId: entry.id,
                          set: set,
                          number: i + 1,
                          unit: unit,
                          swipe: swipeToComplete && !manual,
                        ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () => ref.read(activeWorkoutProvider.notifier).addSet(entry.id),
                          icon: const Icon(Icons.add_rounded),
                          label: Text(l10n.addSet),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EntryMenu extends ConsumerWidget {
  const _EntryMenu({required this.entry, required this.isLast});

  final ExerciseEntry entry;
  final bool isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final ctrl = ref.read(activeWorkoutProvider.notifier);
    return PopupMenuButton<String>(
      tooltip: l10n.moreActions,
      onSelected: (v) async {
        switch (v) {
          case 'superset':
            ctrl.toggleSupersetWithNext(entry.id);
          case 'notes':
            final notes = await _askText(context, l10n.exerciseNotes, entry.notes ?? '');
            if (notes != null) ctrl.setEntryNotes(entry.id, notes);
          case 'remove':
            ctrl.removeEntry(entry.id);
          default:
            ctrl.setEntryRest(entry.id, int.parse(v));
        }
      },
      itemBuilder: (_) => [
        if (!isLast) PopupMenuItem(value: 'superset', child: Text(l10n.supersetWithNext)),
        PopupMenuItem(value: 'notes', child: Text(l10n.exerciseNotes)),
        const PopupMenuDivider(),
        for (final s in const [30, 60, 90, 120, 180, 240])
          CheckedPopupMenuItem(
            value: '$s',
            checked: entry.restSeconds == s,
            child: Text('${l10n.rest} ${Fmt.clock(Duration(seconds: s))}'),
          ),
        const PopupMenuDivider(),
        PopupMenuItem(value: 'remove', child: Text(l10n.removeExercise)),
      ],
    );
  }
}

/// Free-text prompt used for notes.
Future<String?> _askText(BuildContext context, String title, String initial) {
  final controller = TextEditingController(text: initial);
  final l10n = AppLocalizations.of(context);
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: TextField(controller: controller, autofocus: true, maxLines: 4, minLines: 2),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
        FilledButton(onPressed: () => Navigator.pop(ctx, controller.text), child: Text(l10n.save)),
      ],
    ),
  ).whenComplete(controller.dispose);
}

class _SetRow extends ConsumerStatefulWidget {
  const _SetRow({
    super.key,
    required this.entryId,
    required this.set,
    required this.number,
    required this.unit,
    required this.swipe,
  });

  final String entryId;
  final SetEntry set;
  final int number;
  final WeightUnit unit;
  final bool swipe;

  @override
  ConsumerState<_SetRow> createState() => _SetRowState();
}

class _SetRowState extends ConsumerState<_SetRow> {
  late final _weight =
      TextEditingController(text: widget.set.weightKg == null ? '' : Fmt.weightValue(widget.set.weightKg!, widget.unit));
  late final _reps = TextEditingController(text: widget.set.reps?.toString() ?? '');
  late final _rpe = TextEditingController(text: widget.set.rpe == null ? '' : Fmt.number(widget.set.rpe!));

  @override
  void dispose() {
    _weight.dispose();
    _reps.dispose();
    _rpe.dispose();
    super.dispose();
  }

  void _update(SetEntry Function(SetEntry s) change) =>
      ref.read(activeWorkoutProvider.notifier).updateSet(widget.entryId, widget.set.id, change);

  double? _num(String v) => double.tryParse(v.replaceAll(',', '.'));

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final s = widget.set;
    final ctrl = ref.read(activeWorkoutProvider.notifier);
    final numberStyle = PulseTypography.number(fontSize: 17, color: c.textPrimary, fontWeight: FontWeight.w700);
    final decimals = [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
    const field = InputDecoration(
      isDense: true,
      hintText: '–',
      border: InputBorder.none,
      filled: false,
      contentPadding: EdgeInsets.symmetric(vertical: PulseMetrics.space8),
    );
    final typeLabel = switch (s.type) {
      SetType.warmup => l10n.setWarmupShort,
      SetType.drop => l10n.setDropShort,
      SetType.failure => l10n.setFailureShort,
      SetType.working => '${widget.number}',
    };

    final row = AnimatedContainer(
      duration: context.motion.fast,
      color: s.isCompleted ? c.success.withValues(alpha: 0.10) : c.surfaceRaised,
      padding: const EdgeInsets.symmetric(vertical: PulseMetrics.space4),
      child: Row(
        children: [
          SizedBox(
            width: 44,
            child: PopupMenuButton<Object>(
              tooltip: l10n.setType,
              onSelected: (v) =>
                  v is SetType ? _update((x) => x.copyWith(type: v)) : ctrl.removeSet(widget.entryId, s.id),
              itemBuilder: (_) => [
                for (final t in SetType.values)
                  CheckedPopupMenuItem(value: t, checked: s.type == t, child: Text(l10n.setTypeName(t))),
                const PopupMenuDivider(),
                PopupMenuItem(value: 'delete', child: Text(l10n.delete)),
              ],
              child: Center(
                child: Text(typeLabel,
                    style: numberStyle.copyWith(color: s.type == SetType.working ? c.textSecondary : c.warning)),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _weight,
              style: numberStyle,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: decimals,
              decoration: field,
              onChanged: (v) {
                final n = _num(v);
                _update((x) => x.copyWith(weightKg: n == null ? null : Units.weightToKg(n, widget.unit)));
              },
            ),
          ),
          Expanded(
            child: TextField(
              controller: _reps,
              style: numberStyle,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: field,
              onChanged: (v) => _update((x) => x.copyWith(reps: int.tryParse(v))),
            ),
          ),
          SizedBox(
            width: 56,
            child: TextField(
              controller: _rpe,
              style: numberStyle.copyWith(color: c.textSecondary),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: decimals,
              decoration: field,
              onChanged: (v) => _update((x) => x.copyWith(rpe: _num(v)?.clamp(1, 10).toDouble())),
            ),
          ),
          SizedBox(
            width: 44,
            child: Semantics(
              button: true,
              checked: s.isCompleted,
              label: '${l10n.completeSet} ${widget.number}',
              excludeSemantics: true,
              child: InkResponse(
                radius: 22,
                onTap: () => ctrl.toggleSetComplete(widget.entryId, s.id),
                child: Center(child: AnimatedCheckmark(checked: s.isCompleted)),
              ),
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: PulseMetrics.space4),
      child: widget.swipe
          ? SwipeToComplete(
              actionLabel: '${l10n.completeSet} ${widget.number}',
              enabled: !s.isCompleted,
              onCompleted: () => ctrl.toggleSetComplete(widget.entryId, s.id),
              child: row,
            )
          : ClipRRect(borderRadius: BorderRadius.circular(context.metrics.radiusSm), child: row),
    );
  }
}
