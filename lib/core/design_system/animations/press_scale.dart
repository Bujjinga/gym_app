import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Press-scale micro-interaction: shrinks slightly while pressed and lifts a
/// little on mouse hover. Reduced motion: dims instead of scaling.
class PressScale extends StatefulWidget {
  const PressScale({super.key, required this.child, this.enabled = true, this.pressedScale = 0.96});

  final Widget child;
  final bool enabled;
  final double pressedScale;

  @override
  State<PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<PressScale> {
  bool _pressed = false;
  bool _hovered = false;

  void _setPressed(bool v) {
    if (widget.enabled && _pressed != v) setState(() => _pressed = v);
  }

  @override
  Widget build(BuildContext context) {
    final reduced = context.reduceMotion;
    final scale = !widget.enabled || reduced
        ? 1.0
        : _pressed
            ? widget.pressedScale
            : (_hovered ? 1.02 : 1.0);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Listener(
        onPointerDown: (_) => _setPressed(true),
        onPointerUp: (_) => _setPressed(false),
        onPointerCancel: (_) => _setPressed(false),
        child: AnimatedOpacity(
          opacity: reduced && _pressed ? 0.7 : 1,
          duration: const Duration(milliseconds: 100),
          child: AnimatedScale(
            scale: scale,
            duration: Duration(milliseconds: _pressed ? 90 : 260),
            curve: _pressed ? Curves.easeOut : MotionPreset.bouncy.curve,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
