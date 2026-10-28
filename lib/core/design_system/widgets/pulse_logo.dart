import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// The PULSE heartbeat mark, drawn in code so it can be animated.
/// [beat] (0…1) swells and brightens it, e.g. driven by a repeating controller.
class PulseLogo extends StatelessWidget {
  const PulseLogo({super.key, this.width = 120, this.beat = 0});

  final double width;
  final double beat;

  /// Same points as tool/make_icon.swift, in a unit square, left to right.
  static const points = [
    (0.0, 0.5), (0.28, 0.5), (0.36, 0.36), (0.46, 0.80), (0.56, 0.12), (0.65, 0.62), (0.72, 0.5), (1.0, 0.5),
  ];

  /// Height-to-width ratio of the mark.
  static const aspect = 0.62;

  /// Stroke width for a mark [width] wide (matches the icon artwork).
  static double strokeFor(double width) => width * 0.075 / 0.72;

  static Path path(Rect rect) {
    final path = Path();
    for (final (i, (x, y)) in points.indexed) {
      final p = Offset(rect.left + x * rect.width, rect.top + (1 - y) * rect.height);
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    return path;
  }

  /// Gradient stroke paint for the mark.
  static Paint stroke(Rect rect, Color start, Color end, double width) => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = width
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..shader = LinearGradient(colors: [start, end]).createShader(rect);

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return CustomPaint(
      size: Size(width * 1.3, width * aspect * 1.6),
      painter: _LogoPainter(beat: beat, start: c.accentStart, end: c.accentEnd),
    );
  }
}

class _LogoPainter extends CustomPainter {
  _LogoPainter({required this.beat, required this.start, required this.end});

  final double beat;
  final Color start;
  final Color end;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width / 1.3;
    canvas.translate(size.width / 2, size.height / 2);
    canvas.scale(1 + 0.12 * beat);
    final rect = Rect.fromCenter(center: Offset.zero, width: width, height: width * PulseLogo.aspect);
    final path = PulseLogo.path(rect);
    final w = PulseLogo.strokeFor(width);
    canvas.drawPath(
      path,
      PulseLogo.stroke(rect, start, end, w * 1.4)
        ..color = Color.fromRGBO(0, 0, 0, 0.4 + 0.6 * beat) // alpha only; the shader gives the colour
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6 + 10 * math.max(0, beat)),
    );
    canvas.drawPath(path, PulseLogo.stroke(rect, start, end, w));
  }

  @override
  bool shouldRepaint(_LogoPainter old) => old.beat != beat || old.start != start || old.end != end;
}
