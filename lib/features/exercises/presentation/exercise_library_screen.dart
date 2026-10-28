import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../l10n/enum_labels.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../application/exercise_providers.dart';
import '../domain/exercise.dart';
import '../domain/exercise_filter.dart';
import 'custom_exercise_sheet.dart';
import 'exercise_detail_screen.dart';

/// Searchable, filterable exercise library. In [pickMode] it is the
/// "Add exercises" picker and pops with the selected ids. On wide screens it
/// shows a master-detail layout. Cmd/Ctrl+F focuses search.
class ExerciseLibraryScreen extends ConsumerStatefulWidget {
  const ExerciseLibraryScreen({super.key, this.pickMode = false});

  final bool pickMode;

  @override
  ConsumerState<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends ConsumerState<ExerciseLibraryScreen> {
  final _search = TextEditingController();
  final _searchFocus = FocusNode();
  final _picked = <String>[];
  String? _selectedId;

  @override
  void dispose() {
    _search.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _setFilter(ExerciseFilter Function(ExerciseFilter f) change) =>
      ref.read(exerciseFilterControllerProvider.notifier).set(change(ref.read(exerciseFilterControllerProvider)));

  void _clearAll() {
    _search.clear();
    ref.read(exerciseFilterControllerProvider.notifier).set(const ExerciseFilter());
  }

  void _onTap(Exercise e, {required bool wide}) {
    if (widget.pickMode) {
      Haptics.selection();
      setState(() => _picked.contains(e.id) ? _picked.remove(e.id) : _picked.add(e.id));
    } else if (wide) {
      setState(() => _selectedId = e.id);
    } else {
      ExerciseDetailRoute(id: e.id).push<void>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final filter = ref.watch(exerciseFilterControllerProvider);
    final exercises = ref.watch(exerciseListProvider);
    final meta = ref.watch(platformCapabilitiesProvider).usesMetaForShortcuts;
    final wide = !widget.pickMode && MediaQuery.sizeOf(context).width >= PulseMetrics.mediumMax;

    final list = Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(PulseMetrics.space16, PulseMetrics.space8, PulseMetrics.space16, 0),
          child: TextField(
            controller: _search,
            focusNode: _searchFocus,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(hintText: l10n.searchExercises, prefixIcon: const Icon(Icons.search_rounded)),
            onChanged: (q) => _setFilter((f) => f.copyWith(query: q)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space16),
          child: FilterChipRow<MuscleGroup?>(
            options: [null, ...MuscleGroup.values],
            selected: {filter.muscle},
            labelOf: (m) => m == null ? l10n.allFilter : l10n.muscle(m),
            onChanged: (s) => _setFilter((f) => f.copyWith(muscle: s.first)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space16),
          child: FilterChipRow<Equipment?>(
            options: [null, ...Equipment.values],
            selected: {filter.equipment},
            labelOf: (e) => e == null ? l10n.allFilter : l10n.equipmentName(e),
            onChanged: (s) => _setFilter((f) => f.copyWith(equipment: s.first)),
          ),
        ),
        Expanded(
          child: switch (exercises) {
            AsyncData(value: final items) when items.isEmpty => EmptyState(
                icon: Icons.search_off_rounded,
                title: l10n.noExercisesFound,
                message: l10n.noExercisesFoundBody,
                actionLabel: l10n.clearFilters,
                onAction: _clearAll,
              ),
            AsyncData(value: final items) => ListView.builder(
                padding: const EdgeInsets.fromLTRB(PulseMetrics.space16, PulseMetrics.space8, PulseMetrics.space16, 96),
                itemCount: items.length,
                itemBuilder: (context, i) => StaggeredEntry(
                  index: i,
                  child: _ExerciseTile(
                    exercise: items[i],
                    picked: widget.pickMode ? _picked.contains(items[i].id) : null,
                    selected: wide && _selectedId == items[i].id,
                    onTap: () => _onTap(items[i], wide: wide),
                  ),
                ),
              ),
            AsyncError() => EmptyState(
                icon: Icons.error_outline_rounded,
                title: l10n.noExercisesFound,
                message: l10n.noExercisesFoundBody,
                isError: true,
              ),
            _ => const Center(child: CircularProgressIndicator()),
          },
        ),
      ],
    );

    return CallbackShortcuts(
      bindings: {SingleActivator(LogicalKeyboardKey.keyF, meta: meta, control: !meta): _searchFocus.requestFocus},
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.pickMode ? l10n.addExercises : l10n.exerciseLibrary),
          actions: [
            IconButton(
              tooltip: l10n.favorites,
              isSelected: filter.favoritesOnly,
              icon: const Icon(Icons.star_border_rounded),
              selectedIcon: Icon(Icons.star_rounded, color: context.colors.warning),
              onPressed: () => _setFilter((f) => f.copyWith(favoritesOnly: !f.favoritesOnly)),
            ),
            if (widget.pickMode)
              Padding(
                padding: const EdgeInsets.only(right: PulseMetrics.space8),
                child: FilledButton(
                  onPressed: _picked.isEmpty ? null : () => context.pop(List<String>.of(_picked)),
                  child: Text(l10n.addCount(_picked.length)),
                ),
              ),
          ],
        ),
        floatingActionButton: widget.pickMode
            ? null
            : FloatingActionButton.extended(
                onPressed: () => showCustomExerciseSheet(context),
                icon: const Icon(Icons.add_rounded),
                label: Text(l10n.customExercise),
              ),
        body: wide
            ? Row(
                children: [
                  SizedBox(width: 440, child: list),
                  const VerticalDivider(width: 1),
                  Expanded(
                    child: _selectedId == null
                        ? EmptyState(
                            icon: Icons.fitness_center_rounded,
                            title: l10n.exerciseLibrary,
                            message: l10n.searchExercises,
                          )
                        : ExerciseDetailView(key: ValueKey(_selectedId), id: _selectedId!),
                  ),
                ],
              )
            : list,
      ),
    );
  }
}

class _ExerciseTile extends StatelessWidget {
  const _ExerciseTile({required this.exercise, required this.onTap, this.picked, this.selected = false});

  final Exercise exercise;
  final VoidCallback onTap;

  /// Non-null in pick mode.
  final bool? picked;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final subtitle = '${l10n.muscle(exercise.primaryMuscle)} · ${l10n.equipmentName(exercise.equipment)}';
    return Padding(
      padding: const EdgeInsets.only(bottom: PulseMetrics.space8),
      child: PulseHero(
        tag: 'exercise-${exercise.id}',
        fromRadius: context.metrics.radiusMd,
        child: Semantics(
          selected: picked ?? selected,
          child: GlassCard(
            blur: false,
            radius: context.metrics.radiusMd,
            padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space16, vertical: PulseMetrics.space12),
            semanticLabel: '${exercise.name}, $subtitle',
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? c.accentStart.withValues(alpha: 0.2) : c.glassFill,
                  ),
                  child: Icon(Icons.fitness_center_rounded, size: 20, color: c.accentText),
                ),
                const SizedBox(width: PulseMetrics.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exercise.name, style: text.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(subtitle, style: text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                if (picked != null)
                  AnimatedCheckmark(checked: picked!, size: 24)
                else if (exercise.isFavorite)
                  Icon(Icons.star_rounded, color: c.warning, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
