import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'pulse_shaders.dart';

/// Wraps a subtree so a descendant (the Start Workout button) can send a
/// ripple distortion through it via `RippleDistortion.maybeOf(context)`.
///
/// Impeller: real shader distortion. Other backends (e.g. Windows/Skia): an
/// expanding accent ring instead. Reduced motion: no ripple.
class RippleDistortion extends StatefulWidget {
  const RippleDistortion({super.key, required this.child});

  final Widget child;

  static RippleDistortionState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<RippleDistortionState>();

  @override
  State<RippleDistortion> createState() => RippleDistortionState();
}

class RippleDistortionState extends State<RippleDistortion> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 750));
  ui.FragmentProgram? _program;
  ui.FragmentShader? _shader;
  Offset _center = Offset.zero;

  static final _identity = ui.ImageFilter.matrix(Matrix4.identity().storage);

  @override
  void initState() {
    super.initState();
    PulseShaders.ripple.then((p) {
      if (mounted) setState(() => (_program = p, _shader = p.fragmentShader()));
    }, onError: (Object _) {});
  }

  /// Starts a ripple at [globalPosition].
  void trigger(Offset globalPosition) {
    if (context.reduceMotion) return;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;
    _center = box.globalToLocal(globalPosition);
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    _shader?.dispose();
    super.dispose();
  }

  bool get _useShader => _program != null && ui.ImageFilter.isShaderFilterSupported;

  @override
  Widget build(BuildContext context) {
    final accent = context.colors.accentEnd;
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        final active = _controller.isAnimating;
        final t = Curves.easeOutCubic.transform(_controller.value);
        ui.ImageFilter filter = _identity;
        if (active && _useShader) {
          final size = (context.findRenderObject() as RenderBox?)?.size ?? Size.zero;
          final dpr = MediaQuery.devicePixelRatioOf(context);
          final shader = _shader!
            ..setFloat(0, size.width * dpr)
            ..setFloat(1, size.height * dpr)
            ..setFloat(2, _center.dx)
            ..setFloat(3, _center.dy)
            ..setFloat(4, t)
            ..setFloat(5, dpr);
          filter = ui.ImageFilter.shader(shader);
        }
        // Keep the same tree shape every frame so child state is never lost.
        return CustomPaint(
          foregroundPainter: active && !_useShader ? _RingPainter(_center, t, accent) : null,
          child: ImageFiltered(
            enabled: active && _useShader,
            imageFilter: filter,
            child: child,
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.center, this.t, this.color);

  final Offset center;
  final double t;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = t * size.longestSide * 0.9;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = color.withValues(alpha: (1 - t) * 0.6),
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.t != t || old.center != center;
}
