import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'ring_progress.dart';

/// The three concentric daily rings: Move (outer), Exercise, Steps (inner).
/// Values are progress toward each goal (1.0 = closed).
class ActivityRings extends StatelessWidget {
  const ActivityRings({
    super.key,
    required this.move,
    required this.exercise,
    required this.steps,
    required this.semanticLabel,
    this.size = 200,
    this.onGoalClosed,
  });

  final double move;
  final double exercise;
  final double steps;

  /// Spoken summary, e.g. "Move 80%, Exercise 45%, Steps 100%".
  final String semanticLabel;
  final double size;

  /// Called with the ring index (0 move, 1 exercise, 2 steps) when it closes.
  final ValueChanged<int>? onGoalClosed;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final stroke = size * 0.095;
    final step = (stroke + size * 0.02) * 2;
    final rings = [(move, c.ringMove), (exercise, c.ringExercise), (steps, c.ringSteps)];
    return Semantics(
      label: semanticLabel,
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            for (var i = 0; i < rings.length; i++)
              RingProgress(
                value: rings[i].$1,
                colors: rings[i].$2,
                size: size - step * i,
                strokeWidth: stroke,
                onGoalClosed: onGoalClosed == null ? null : () => onGoalClosed!(i),
              ),
          ],
        ),
      ),
    );
  }
}
