import 'package:flutter/material.dart';

import '../../platform/haptics.dart';
import '../animations/press_scale.dart';
import '../shaders/ripple_distortion.dart';
import '../tokens/tokens.dart';

/// Floating "Start workout" button. Tapping sends a ripple distortion through
/// the nearest [RippleDistortion] ancestor before calling [onPressed].
class StartWorkoutButton extends StatelessWidget {
  const StartWorkoutButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.compact = false,
    this.icon = Icons.play_arrow_rounded,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData icon;

  /// Icon-only round button (NavigationRail / collapsed sidebar).
  final bool compact;

  void _tap(BuildContext context) {
    final box = context.findRenderObject() as RenderBox?;
    if (box != null) {
      RippleDistortion.maybeOf(context)?.trigger(box.localToGlobal(box.size.center(Offset.zero)));
    }
    Haptics.tap();
    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final child = DecoratedBox(
      decoration: BoxDecoration(
        gradient: c.accentGradient,
        borderRadius: BorderRadius.circular(999),
        boxShadow: context.shadows.glow(c.accentEnd, strength: 1.2),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: () => _tap(context),
          child: SizedBox(
            height: 56,
            width: compact ? 56 : null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: compact ? 0 : PulseMetrics.space24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: c.onAccent, size: 28),
                  if (!compact) ...[
                    const SizedBox(width: PulseMetrics.space8),
                    Flexible(
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: c.onAccent,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: Tooltip(
        message: compact ? label : '',
        child: PressScale(pressedScale: 0.92, child: child),
      ),
    );
  }
}
