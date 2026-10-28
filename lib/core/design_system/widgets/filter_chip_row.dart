import 'package:flutter/material.dart';

import '../../platform/haptics.dart';
import '../tokens/tokens.dart';

/// Horizontally scrolling chip row. Single-select unless [multiSelect].
class FilterChipRow<T> extends StatelessWidget {
  const FilterChipRow({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    required this.labelOf,
    this.multiSelect = false,
  });

  final List<T> options;
  final Set<T> selected;
  final ValueChanged<Set<T>> onChanged;
  final String Function(T) labelOf;
  final bool multiSelect;

  void _toggle(T option) {
    Haptics.selection();
    if (multiSelect) {
      final next = {...selected};
      next.contains(option) ? next.remove(option) : next.add(option);
      onChanged(next);
    } else {
      onChanged({option});
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: PulseMetrics.space4),
      child: Row(
        children: [
          for (final option in options)
            Padding(
              padding: const EdgeInsets.only(right: PulseMetrics.space8),
              child: Semantics(
                selected: selected.contains(option),
                button: true,
                label: labelOf(option),
                excludeSemantics: true,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    customBorder: const StadiumBorder(),
                    onTap: () => _toggle(option),
                    child: AnimatedContainer(
                      duration: context.motion.medium,
                      curve: MotionPreset.snappy.curve,
                      constraints: const BoxConstraints(minHeight: 40),
                      padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space16, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        gradient: selected.contains(option) ? c.accentGradient : null,
                        color: selected.contains(option) ? null : c.glassFill,
                        border: Border.all(color: selected.contains(option) ? Colors.transparent : c.glassBorder),
                      ),
                      child: Text(
                        labelOf(option),
                        style: text.labelLarge?.copyWith(
                          color: selected.contains(option) ? c.onAccent : c.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
