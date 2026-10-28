import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Segmented progress bar for paged flows (onboarding). Segments up to
/// [step] (0-based) fill with the accent gradient.
class StepProgressBar extends StatelessWidget {
  const StepProgressBar({super.key, required this.step, required this.count, required this.semanticLabel});

  final int step;
  final int count;

  /// e.g. "Step 2 of 5".
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      label: semanticLabel,
      excludeSemantics: true,
      child: Row(
        children: [
          for (var i = 0; i < count; i++)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: i == count - 1 ? 0 : PulseMetrics.space4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: SizedBox(
                    height: 6,
                    child: ColoredBox(
                      color: c.glassBorder,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(end: i <= step ? 1 : 0),
                        duration: context.motion.slow,
                        curve: MotionPreset.smooth.curve,
                        builder: (context, t, _) => FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: t,
                          child: DecoratedBox(decoration: BoxDecoration(gradient: c.accentGradient)),
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
