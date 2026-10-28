import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Hero for card → full-screen detail flights. The shuttle morphs the corner
/// radius from the card's to [toRadius] and cross-fades the two layouts, so
/// mismatched card/detail content never "pops".
class PulseHero extends StatelessWidget {
  const PulseHero({super.key, required this.tag, required this.child, this.fromRadius, this.toRadius = 0});

  final Object tag;
  final Widget child;

  /// Corner radius of the card end; defaults to `metrics.radiusLg`.
  final double? fromRadius;
  final double toRadius;

  @override
  Widget build(BuildContext context) {
    final start = fromRadius ?? context.metrics.radiusLg;
    return Hero(
      tag: tag,
      flightShuttleBuilder: (flightContext, animation, direction, fromContext, toContext) {
        final fromHero = fromContext.widget as Hero;
        final toHero = toContext.widget as Hero;
        final curved = CurvedAnimation(parent: animation, curve: MotionPreset.smooth.curve);
        // During a pop the animation runs 1→0, so "to" is always the detail.
        final cardChild = direction == HeroFlightDirection.push ? fromHero.child : toHero.child;
        final detailChild = direction == HeroFlightDirection.push ? toHero.child : fromHero.child;
        return AnimatedBuilder(
          animation: curved,
          builder: (context, _) {
            final t = curved.value;
            return ClipRRect(
              borderRadius: BorderRadius.circular(start + (toRadius - start) * t),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Opacity(opacity: 1 - t, child: cardChild),
                  Opacity(opacity: t, child: detailChild),
                ],
              ),
            );
          },
        );
      },
      child: Material(type: MaterialType.transparency, child: child),
    );
  }
}
