import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../platform/haptics.dart';
import '../tokens/tokens.dart';

/// One destination in [PulseBottomNav].
class PulseNavItem {
  const PulseNavItem({required this.icon, required this.selectedIcon, required this.label});

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

/// Glass bottom tab bar with a gradient pill indicator that springs between
/// tabs.
class PulseBottomNav extends StatelessWidget {
  const PulseBottomNav({super.key, required this.items, required this.currentIndex, required this.onSelected});

  final List<PulseNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onSelected;

  static const _pillWidth = 56.0;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: c.surface.withValues(alpha: 0.78),
            border: Border(top: BorderSide(color: c.glassBorder)),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: SizedBox(
              height: 68,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final slot = constraints.maxWidth / items.length;
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: context.motion.slow,
                        curve: MotionPreset.bouncy.springCurve,
                        left: slot * currentIndex + (slot - _pillWidth) / 2,
                        top: 8,
                        width: _pillWidth,
                        height: 32,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            gradient: LinearGradient(colors: [
                              c.accentStart.withValues(alpha: 0.28),
                              c.accentEnd.withValues(alpha: 0.28),
                            ]),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < items.length; i++)
                            Expanded(
                              child: Semantics(
                                selected: i == currentIndex,
                                button: true,
                                label: items[i].label,
                                excludeSemantics: true,
                                child: InkResponse(
                                  onTap: () {
                                    Haptics.selection();
                                    onSelected(i);
                                  },
                                  radius: 36,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 32,
                                        child: Icon(
                                          i == currentIndex ? items[i].selectedIcon : items[i].icon,
                                          color: i == currentIndex ? c.accentText : c.textSecondary,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        items[i].label,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: text.labelSmall?.copyWith(
                                          color: i == currentIndex ? c.textPrimary : c.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
