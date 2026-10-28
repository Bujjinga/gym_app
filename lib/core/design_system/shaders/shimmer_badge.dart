import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'pulse_shaders.dart';

/// Sweeps a shader-driven highlight across [child] (e.g. a "NEW PR" badge).
class ShimmerBadge extends StatefulWidget {
  const ShimmerBadge({super.key, required this.child, this.active = true});

  final Widget child;

  /// Set false once the badge is no longer "new".
  final bool active;

  @override
  State<ShimmerBadge> createState() => _ShimmerBadgeState();
}

class _ShimmerBadgeState extends State<ShimmerBadge> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2400));
  ui.FragmentProgram? _program;

  @override
  void initState() {
    super.initState();
    PulseShaders.shimmer.then((p) {
      if (mounted) setState(() => _program = p);
    }, onError: (Object _) {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  @override
  void didUpdateWidget(ShimmerBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sync();
  }

  void _sync() {
    final run = widget.active && !context.reduceMotion;
    if (run && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!run) {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (context, child) => ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (rect) {
            final p = _program;
            // Sweep occupies the first 60% of each cycle; the rest is a pause.
            final progress = (_controller.value / 0.6).clamp(0.0, 1.0);
            if (p == null || !_controller.isAnimating) {
              return const LinearGradient(colors: [Colors.transparent, Colors.transparent]).createShader(rect);
            }
            return p.fragmentShader()
              ..setFloat(0, rect.width)
              ..setFloat(1, rect.height)
              ..setFloat(2, progress)
              ..setFloat(3, 1)
              ..setFloat(4, 1)
              ..setFloat(5, 1)
              ..setFloat(6, 0.6);
          },
          child: child,
        ),
      ),
    );
  }
}
