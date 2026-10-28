import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/active_workout_controller.dart';
import '../application/active_workout_state.dart';
import 'widgets/exercise_entry_card.dart';
import 'widgets/workout_tools.dart';

/// The workout in progress (live) or being logged after the fact (manual).
/// Space completes the next set on keyboards.
class ActiveWorkoutScreen extends ConsumerWidget {
  const ActiveWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final s = ref.watch(activeWorkoutProvider).value;
    if (s == null) {
      return Scaffold(
        appBar: AppBar(),
        body: EmptyState(icon: Icons.fitness_center_rounded, title: l10n.trainEmptyTitle, message: l10n.noWorkoutsYetBody),
      );
    }
    final ctrl = ref.read(activeWorkoutProvider.notifier);
    final caps = ref.watch(platformCapabilitiesProvider);
    final unit = ref.watch(userProfileProvider).value?.weightUnit ?? WeightUnit.kg;
    final entries = s.session.entries;

    Future<void> finish() async {
      final result = await ctrl.finish();
      if (result != null && context.mounted) {
        WorkoutSummaryRoute(
          id: result.sessionId,
          celebrate: result.records.isNotEmpty || result.achievements.isNotEmpty,
          achievements: result.achievements.join(','),
        ).pushReplacement(context);
      }
    }

    Future<void> discard() async {
      final ok = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.discardConfirmTitle),
          content: Text(l10n.discardConfirmBody),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: context.colors.error),
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.discardWorkout),
            ),
          ],
        ),
      );
      if (ok ?? false) {
        await ctrl.discard();
        if (context.mounted) context.pop();
      }
    }

    Future<void> addExercises() async {
      final ids = await const ExercisePickerRoute().push<List<String>>(context);
      if (ids != null) await ctrl.addExercises(ids);
    }

    return CallbackShortcuts(
      bindings: {const SingleActivator(LogicalKeyboardKey.space): ctrl.completeNextSet},
      child: Focus(
        autofocus: true,
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.session.name),
                if (!s.manual) _ElapsedClock(start: s.session.startedAt),
              ],
            ),
            actions: [
              if (caps.isMobile && !s.manual)
                IconButton(
                  tooltip: l10n.keepAwake,
                  isSelected: s.keepAwake,
                  icon: const Icon(Icons.light_mode_outlined),
                  selectedIcon: const Icon(Icons.light_mode_rounded),
                  onPressed: () => ctrl.setKeepAwake(!s.keepAwake),
                ),
              PopupMenuButton<String>(
                tooltip: l10n.moreActions,
                onSelected: (v) => switch (v) {
                  'plates' => showPlateCalculator(context, unit),
                  '1rm' => showOneRepMaxCalculator(context, unit),
                  _ => discard(),
                },
                itemBuilder: (_) => [
                  PopupMenuItem(value: 'plates', child: Text(l10n.plateCalculator)),
                  PopupMenuItem(value: '1rm', child: Text(l10n.oneRepMax)),
                  const PopupMenuDivider(),
                  PopupMenuItem(value: 'discard', child: Text(l10n.discardWorkout)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: PulseMetrics.space8),
                child: FilledButton(onPressed: entries.isEmpty ? null : finish, child: Text(l10n.finishWorkout)),
              ),
            ],
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Column(
                children: [
                  if (s.manual) _ManualTimes(state: s),
                  Expanded(
                    child: entries.isEmpty
                        ? EmptyState(
                            icon: Icons.add_circle_outline_rounded,
                            title: l10n.emptyWorkoutTitle,
                            message: l10n.emptyWorkoutBody,
                            actionLabel: l10n.addExercise,
                            onAction: addExercises,
                          )
                        : ReorderableListView.builder(
                            buildDefaultDragHandles: false,
                            padding: const EdgeInsets.fromLTRB(
                                PulseMetrics.space16, PulseMetrics.space8, PulseMetrics.space16, 160),
                            itemCount: entries.length,
                            onReorderItem: ctrl.moveEntry,
                            footer: Padding(
                              key: const ValueKey('footer'),
                              padding: const EdgeInsets.only(top: PulseMetrics.space8),
                              child: SecondaryButton(
                                label: l10n.addExercise,
                                icon: Icons.add_rounded,
                                expand: true,
                                onPressed: addExercises,
                              ),
                            ),
                            itemBuilder: (context, i) => ReorderableDelayedDragStartListener(
                              key: ValueKey(entries[i].id),
                              index: i,
                              child: ExerciseEntryCard(
                                entry: entries[i],
                                exercise: s.exercises[entries[i].exerciseId],
                                lastTime: s.lastTime[entries[i].exerciseId] ?? const [],
                                unit: unit,
                                manual: s.manual,
                                isLast: i == entries.length - 1,
                                swipeToComplete: caps.isMobile,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: s.restEndsAt == null ? null : _RestPanel(state: s),
        ),
      ),
    );
  }
}

class _ElapsedClock extends StatelessWidget {
  const _ElapsedClock({required this.start});

  final DateTime start;

  @override
  Widget build(BuildContext context) => StreamBuilder<void>(
        stream: Stream<void>.periodic(const Duration(seconds: 1)),
        builder: (context, _) => Text(
          Fmt.clock(DateTime.now().difference(start)),
          style: PulseTypography.number(fontSize: 13, color: context.colors.accentEnd, fontWeight: FontWeight.w700),
        ),
      );
}

/// Start date/time and duration for logging a past workout.
class _ManualTimes extends ConsumerWidget {
  const _ManualTimes({required this.state});

  final ActiveWorkoutState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final ctrl = ref.read(activeWorkoutProvider.notifier);
    final start = state.session.startedAt;
    final minutes = {15, 30, 45, 60, 75, 90, 105, 120, 150, 180, state.manualDuration.inMinutes}.toList()..sort();
    return Padding(
      padding: const EdgeInsets.fromLTRB(PulseMetrics.space16, PulseMetrics.space8, PulseMetrics.space16, 0),
      child: GlassCard(
        blur: false,
        child: Wrap(
          spacing: PulseMetrics.space12,
          runSpacing: PulseMetrics.space8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SecondaryButton(
              label: '${l10n.date}: ${DateFormat.yMMMd().add_jm().format(start)}',
              icon: Icons.event_rounded,
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: start,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (date == null || !context.mounted) return;
                final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(start));
                ctrl.setManualTimes(
                  start: DateTime(date.year, date.month, date.day, time?.hour ?? start.hour, time?.minute ?? start.minute),
                );
              },
            ),
            DropdownButton<int>(
              value: state.manualDuration.inMinutes,
              underline: const SizedBox(),
              items: [
                for (final m in minutes)
                  DropdownMenuItem(value: m, child: Text('${l10n.duration}: ${Fmt.clock(Duration(minutes: m))}')),
              ],
              onChanged: (m) => ctrl.setManualTimes(duration: Duration(minutes: m!)),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestPanel extends ConsumerWidget {
  const _RestPanel({required this.state});

  final ActiveWorkoutState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final ctrl = ref.read(activeWorkoutProvider.notifier);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(PulseMetrics.space12),
        child: GlassCard(
          child: Row(
            children: [
              RestTimer(
                endsAt: state.restEndsAt!,
                total: state.restTotal,
                size: 88,
                goLabel: l10n.go,
                semanticLabel: (r) => l10n.restSemantics(r.inSeconds),
                // Keep the GO state visible briefly, then close the panel.
                onFinished: () => Timer(const Duration(seconds: 2), () {
                  if (ref.read(activeWorkoutProvider).value?.restEndsAt == state.restEndsAt) ctrl.skipRest();
                }),
              ),
              const SizedBox(width: PulseMetrics.space16),
              Expanded(child: Text(l10n.rest, style: Theme.of(context).textTheme.titleMedium)),
              SecondaryButton(label: l10n.addRest15, onPressed: () => ctrl.addRest(const Duration(seconds: 15))),
              const SizedBox(width: PulseMetrics.space8),
              TextButton(onPressed: ctrl.skipRest, child: Text(l10n.skipRest)),
            ],
          ),
        ),
      ),
    );
  }
}
