import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../tokens/tokens.dart';
import 'pulse_shaders.dart';

/// Slowly drifting mesh-gradient backdrop (fragment shader) behind [child].
/// Static under reduced motion; plain gradient if shaders can't load.
class MeshGradientBackground extends StatefulWidget {
  const MeshGradientBackground({super.key, required this.child});

  final Widget child;

  @override
  State<MeshGradientBackground> createState() => _MeshGradientBackgroundState();
}

class _MeshGradientBackgroundState extends State<MeshGradientBackground>
    with SingleTickerProviderStateMixin {
  final _time = ValueNotifier<double>(0);
  late final Ticker _ticker = createTicker((elapsed) {
    _time.value = elapsed.inMicroseconds / 1e6;
  });
  ui.FragmentProgram? _program;

  @override
  void initState() {
    super.initState();
    PulseShaders.meshGradient.then((p) {
      if (mounted) setState(() => _program = p);
    }, onError: (Object _) {/* fallback gradient stays */});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.reduceMotion) {
      if (_ticker.isActive) _ticker.stop();
    } else if (!_ticker.isActive) {
      _ticker.start();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    _time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final strength = isDark ? 0.22 : 0.32;
    return CustomPaint(
      painter: _MeshPainter(
        program: _program,
        time: _time,
        base: c.background,
        a: c.accentStart.withValues(alpha: strength),
        b: c.accentEnd.withValues(alpha: strength),
        c: c.ringSteps.last.withValues(alpha: strength * 0.8),
      ),
      child: widget.child,
    );
  }
}

class _MeshPainter extends CustomPainter {
  _MeshPainter({
    required this.program,
    required this.time,
    required this.base,
    required this.a,
    required this.b,
    required this.c,
  }) : super(repaint: time);

  final ui.FragmentProgram? program;
  final ValueNotifier<double> time;
  final Color base, a, b, c;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final p = program;
    if (p == null) {
      canvas.drawRect(
        rect,
        Paint()
          ..shader = LinearGradient(
            colors: [Color.alphaBlend(a, base), base, Color.alphaBlend(b, base)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(rect),
      );
      return;
    }
    final shader = p.fragmentShader()
      ..setFloat(0, size.width)
      ..setFloat(1, size.height)
      ..setFloat(2, time.value);
    var i = 3;
    for (final color in [a, b, c, base]) {
      shader
        ..setFloat(i++, color.r)
        ..setFloat(i++, color.g)
        ..setFloat(i++, color.b)
        ..setFloat(i++, color.a);
    }
    canvas.drawRect(rect, Paint()..shader = shader);
    shader.dispose();
  }

  @override
  bool shouldRepaint(_MeshPainter old) =>
      old.program != program || old.base != base || old.a != a || old.b != b || old.c != c;
}
