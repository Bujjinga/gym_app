import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Activity rings with live sliders; pushing a ring past 100% triggers the
/// overshoot, particle burst and success haptic.
class RingsSection extends StatefulWidget {
  const RingsSection({super.key});

  @override
  State<RingsSection> createState() => _RingsSectionState();
}

class _RingsSectionState extends State<RingsSection> {
  double _move = 0.62;
  double _exercise = 0.4;
  double _steps = 0.85;

  static const _names = ['Move', 'Exercise', 'Steps'];

  void _setAll(double move, double exercise, double steps) => setState(() {
        _move = move;
        _exercise = exercise;
        _steps = steps;
      });

  Widget _slider(String label, double value, ValueChanged<double> onChanged) => Row(
        children: [
          SizedBox(width: 72, child: Text(label)),
          Expanded(
            child: Slider(value: value, max: 1.6, label: '${(value * 100).round()}%', onChanged: onChanged),
          ),
          SizedBox(width: 48, child: Text('${(value * 100).round()}%', textAlign: TextAlign.end)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final rings = ActivityRings(
      move: _move,
      exercise: _exercise,
      steps: _steps,
      size: 200,
      semanticLabel: 'Move ${(_move * 100).round()}%, Exercise ${(_exercise * 100).round()}%, '
          'Steps ${(_steps * 100).round()}%',
      onGoalClosed: (i) => PulseToast.show(context, '${_names[i]} goal closed!', kind: ToastKind.success),
    );
    final controls = Column(
      children: [
        _slider('Move', _move, (v) => setState(() => _move = v)),
        _slider('Exercise', _exercise, (v) => setState(() => _exercise = v)),
        _slider('Steps', _steps, (v) => setState(() => _steps = v)),
        const SizedBox(height: PulseMetrics.space8),
        Wrap(
          spacing: PulseMetrics.space12,
          runSpacing: PulseMetrics.space12,
          children: [
            PrimaryButton(
              label: 'Close all rings',
              icon: Icons.celebration_rounded,
              onPressed: () => _setAll(1.05, 1.0, 1.12),
            ),
            SecondaryButton(label: 'Reset', onPressed: () => _setAll(0.3, 0.2, 0.5)),
          ],
        ),
      ],
    );
    return GallerySection(
      title: 'Activity rings',
      note: 'Gradient sweep, glowing tip, spring overshoot and particle burst when a goal closes.',
      child: LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth > 600
            ? Row(children: [rings, const SizedBox(width: PulseMetrics.space32), Expanded(child: controls)])
            : Column(children: [rings, const SizedBox(height: PulseMetrics.space16), controls]),
      ),
    );
  }
}
