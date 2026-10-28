import 'package:flutter/material.dart';

import '../../platform/haptics.dart';
import '../animations/press_scale.dart';
import '../tokens/tokens.dart';

/// Secondary action: translucent glass pill with a hairline border.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.label, required this.onPressed, this.icon, this.expand = false});

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final enabled = onPressed != null;
    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      excludeSemantics: true,
      child: PressScale(
        enabled: enabled,
        child: AnimatedOpacity(
          opacity: enabled ? 1 : 0.4,
          duration: context.motion.fast,
          child: Material(
            color: c.glassFill,
            shape: StadiumBorder(side: BorderSide(color: c.glassBorder)),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: enabled
                  ? () {
                      Haptics.tap();
                      onPressed!();
                    }
                  : null,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48, minWidth: 48),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space16, vertical: 12),
                  child: Row(
                    mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, size: 20, color: c.textPrimary),
                        const SizedBox(width: PulseMetrics.space8),
                      ],
                      Flexible(
                        child: Text(label,
                            style: Theme.of(context).textTheme.labelLarge, overflow: TextOverflow.ellipsis),
                      ),
                    ],
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
