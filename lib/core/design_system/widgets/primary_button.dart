import 'package:flutter/material.dart';

import '../../platform/haptics.dart';
import '../animations/press_scale.dart';
import '../tokens/tokens.dart';

/// Main call-to-action: accent-gradient pill with press-scale and a light
/// haptic. `onPressed: null` renders the disabled state.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.loading = false,
    this.expand = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool loading;

  /// Stretch to the available width.
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final enabled = onPressed != null && !loading;
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(color: c.onAccent, fontWeight: FontWeight.w700);
    final content = Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loading)
          SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2.4, color: c.onAccent))
        else if (icon != null)
          Icon(icon, size: 20, color: c.onAccent),
        if (loading || icon != null) const SizedBox(width: PulseMetrics.space8),
        Flexible(child: Text(label, style: textStyle, overflow: TextOverflow.ellipsis)),
      ],
    );
    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      excludeSemantics: true,
      child: PressScale(
        enabled: enabled,
        child: AnimatedOpacity(
          opacity: enabled || loading ? 1 : 0.4,
          duration: context.motion.fast,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: c.accentGradient,
              borderRadius: BorderRadius.circular(999),
              boxShadow: enabled ? context.shadows.glow(c.accentEnd) : null,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                customBorder: const StadiumBorder(),
                onTap: enabled
                    ? () {
                        Haptics.tap();
                        onPressed!();
                      }
                    : null,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 52, minWidth: 52),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space24, vertical: 14),
                    child: content,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
