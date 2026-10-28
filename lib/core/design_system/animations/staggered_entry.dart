import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../tokens/tokens.dart';

/// Staggered list entry: item [index] fades and rises in slightly after the
/// previous one. Reduced motion: fade only, no delay.
class StaggeredEntry extends StatelessWidget {
  const StaggeredEntry({super.key, required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final motion = context.motion;
    // Cap the delay so long lists don't wait seconds for their last items.
    final delay = motion.stagger * index.clamp(0, 12);
    final animated = child.animate(delay: delay).fadeIn(duration: motion.medium, curve: Curves.easeOut);
    if (motion.reduced) return animated;
    return animated.slideY(begin: 0.08, end: 0, duration: motion.slow, curve: MotionPreset.smooth.curve);
  }
}
