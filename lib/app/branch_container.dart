import 'package:flutter/material.dart';

import '../core/design_system/design_system.dart';

/// Keeps every tab's navigator alive and cross-fades between them. Inactive
/// tabs stop their tickers and are hidden from focus and screen readers.
class BranchContainer extends StatelessWidget {
  const BranchContainer({super.key, required this.currentIndex, required this.children});

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final motion = context.motion;
    return Stack(
      fit: StackFit.expand,
      children: [
        for (var i = 0; i < children.length; i++)
          IgnorePointer(
            ignoring: i != currentIndex,
            child: ExcludeFocus(
              excluding: i != currentIndex,
              child: ExcludeSemantics(
                excluding: i != currentIndex,
                child: TickerMode(
                  enabled: i == currentIndex,
                  child: AnimatedOpacity(
                    opacity: i == currentIndex ? 1 : 0,
                    duration: motion.medium,
                    curve: Curves.easeOut,
                    child: AnimatedScale(
                      scale: i == currentIndex || motion.reduced ? 1 : 0.98,
                      duration: motion.medium,
                      curve: MotionPreset.smooth.curve,
                      child: children[i],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
