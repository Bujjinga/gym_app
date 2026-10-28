import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Circle that fills and draws a checkmark stroke-by-stroke when [checked].
class AnimatedCheckmark extends StatelessWidget {
  const AnimatedCheckmark({super.key, required this.checked, this.size = 28});

  final bool checked;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return TweenAnimationBuilder<double>(
      tween: Tween(end: checked ? 1 : 0),
      duration: context.reduceMotion ? Duration.zero : const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
      builder: (context, t, _) => CustomPaint(
        size: Size.square(size),
        painter: _CheckPainter(t: t, fill: c.success, border: c.textMuted, check: c.onAccent),
      ),
    );
  }
}

class _CheckPainter extends CustomPainter {
  _CheckPainter({required this.t, required this.fill, required this.border, required this.check});

  final double t;
  final Color fill, border, check;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final r = size.shortestSide / 2;
    canvas.drawCircle(center, r - 1, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Color.lerp(border, fill, t)!);
    // Fill grows during the first 40%, check draws during the rest.
    final fillT = (t / 0.4).clamp(0.0, 1.0);
    if (fillT > 0) canvas.drawCircle(center, (r - 1) * fillT, Paint()..color = fill);
    final drawT = ((t - 0.3) / 0.7).clamp(0.0, 1.0);
    if (drawT <= 0) return;
    final s = size.shortestSide;
    final path = Path()
      ..moveTo(s * 0.28, s * 0.52)
      ..lineTo(s * 0.44, s * 0.68)
      ..lineTo(s * 0.73, s * 0.36);
    final metric = path.computeMetrics().first;
    final partial = metric.extractPath(0, metric.length * drawT);
    canvas.drawPath(
      partial,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.1
        ..strokeCap = StrokeCap.round
        ..strokeJoin = ui.StrokeJoin.round
        ..color = check,
    );
  }

  @override
  bool shouldRepaint(_CheckPainter old) => old.t != t || old.fill != fill;
}
