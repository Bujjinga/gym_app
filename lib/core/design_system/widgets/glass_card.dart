import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../animations/press_scale.dart';
import '../tokens/tokens.dart';

/// Frosted glass surface: backdrop blur + translucent gradient fill + hairline
/// border. Set [blur] false inside long scrolling lists to save GPU time.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.blur = true,
    this.radius,
    this.semanticLabel,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final bool blur;
  final double? radius;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final r = BorderRadius.circular(radius ?? context.metrics.radiusLg);
    Widget body = Container(
      padding: padding ?? EdgeInsets.all(context.metrics.md),
      decoration: BoxDecoration(
        borderRadius: r,
        border: Border.all(color: c.glassBorder),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [c.glassFill, c.glassFill.withValues(alpha: c.glassFill.a * 0.4)],
        ),
      ),
      child: child,
    );
    if (onTap != null) {
      body = Material(
        type: MaterialType.transparency,
        child: InkWell(borderRadius: r, onTap: onTap, child: body),
      );
    }
    body = ClipRRect(
      borderRadius: r,
      child: blur
          // Grouped: cards on a page share one backdrop read (PulseApp's BackdropGroup)
          // instead of each sampling the animated background separately.
          ? BackdropFilter.grouped(filter: ui.ImageFilter.blur(sigmaX: 24, sigmaY: 24), child: body)
          : body,
    );
    body = DecoratedBox(
      decoration: BoxDecoration(borderRadius: r, boxShadow: context.shadows.card),
      child: body,
    );
    if (onTap != null) body = PressScale(pressedScale: 0.98, child: body);
    return Semantics(container: true, label: semanticLabel, button: onTap != null, child: body);
  }
}
