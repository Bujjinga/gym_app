import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../../domain/pulse_enums.dart';
import '../tokens/tokens.dart';

/// Front and back body diagram with muscle groups lit by intensity (0–1).
/// Animates in whenever the intensities change.
class MuscleMap extends StatelessWidget {
  const MuscleMap({super.key, required this.intensities, required this.semanticLabel, this.height = 220});

  final Map<MuscleGroup, double> intensities;

  /// e.g. "Chest, triceps and shoulders worked".
  final String semanticLabel;
  final double height;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    // Full-body work lights everything at half strength.
    final full = (intensities[MuscleGroup.fullBody] ?? 0) * 0.5;
    final effective = {
      for (final m in MuscleGroup.values)
        if (m != MuscleGroup.fullBody) m: ((intensities[m] ?? 0) > full ? intensities[m]! : full).clamp(0.0, 1.0),
    };
    return Semantics(
      label: semanticLabel,
      image: true,
      excludeSemantics: true,
      child: TweenAnimationBuilder<double>(
        key: ValueKey(Object.hashAllUnordered(effective.entries.map((e) => Object.hash(e.key, e.value)))),
        tween: Tween(begin: 0, end: 1),
        duration: context.reduceMotion ? Duration.zero : const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        builder: (context, t, _) => CustomPaint(
          size: Size(height * 200 / 220, height),
          painter: _MuscleMapPainter(
            intensities: {for (final e in effective.entries) e.key: e.value * t},
            body: c.surfaceRaised,
            outline: c.glassBorder,
            idle: c.textMuted.withValues(alpha: 0.18),
            hot: c.accentStart,
            hotter: c.ringMove.first,
          ),
        ),
      ),
    );
  }
}

typedef _Region = (MuscleGroup, double cx, double cy, double w, double h);

class _MuscleMapPainter extends CustomPainter {
  _MuscleMapPainter({
    required this.intensities,
    required this.body,
    required this.outline,
    required this.idle,
    required this.hot,
    required this.hotter,
  });

  final Map<MuscleGroup, double> intensities;
  final Color body, outline, idle, hot, hotter;

  // Regions in a 100 × 220 figure box; pairs are mirrored left/right.
  static const List<_Region> _front = [
    (MuscleGroup.traps, 40, 34, 10, 6), (MuscleGroup.traps, 60, 34, 10, 6),
    (MuscleGroup.shoulders, 26, 43, 15, 15), (MuscleGroup.shoulders, 74, 43, 15, 15),
    (MuscleGroup.chest, 41, 53, 18, 14), (MuscleGroup.chest, 59, 53, 18, 14),
    (MuscleGroup.biceps, 22, 63, 8, 18), (MuscleGroup.biceps, 78, 63, 8, 18),
    (MuscleGroup.forearms, 18, 96, 7, 24), (MuscleGroup.forearms, 82, 96, 7, 24),
    (MuscleGroup.abs, 50, 83, 14, 34),
    (MuscleGroup.obliques, 37, 85, 7, 26), (MuscleGroup.obliques, 63, 85, 7, 26),
    (MuscleGroup.quads, 41, 142, 13, 40), (MuscleGroup.quads, 59, 142, 13, 40),
    (MuscleGroup.adductors, 47.5, 128, 5, 20), (MuscleGroup.adductors, 52.5, 128, 5, 20),
    (MuscleGroup.calves, 40, 186, 8, 26), (MuscleGroup.calves, 60, 186, 8, 26),
  ];
  static const List<_Region> _back = [
    (MuscleGroup.traps, 50, 42, 24, 18),
    (MuscleGroup.shoulders, 26, 43, 15, 15), (MuscleGroup.shoulders, 74, 43, 15, 15),
    (MuscleGroup.lats, 38, 67, 13, 30), (MuscleGroup.lats, 62, 67, 13, 30),
    (MuscleGroup.back, 50, 63, 10, 20),
    (MuscleGroup.lowerBack, 50, 97, 18, 12),
    (MuscleGroup.triceps, 22, 63, 8, 18), (MuscleGroup.triceps, 78, 63, 8, 18),
    (MuscleGroup.forearms, 18, 96, 7, 24), (MuscleGroup.forearms, 82, 96, 7, 24),
    (MuscleGroup.glutes, 41, 119, 16, 16), (MuscleGroup.glutes, 59, 119, 16, 16),
    (MuscleGroup.hamstrings, 41, 152, 13, 34), (MuscleGroup.hamstrings, 59, 152, 13, 34),
    (MuscleGroup.calves, 40, 186, 11, 26), (MuscleGroup.calves, 60, 186, 11, 26),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.height / 220;
    _figure(canvas, Offset.zero, s, _front);
    _figure(canvas, Offset(100 * s, 0), s, _back);
  }

  void _figure(Canvas canvas, Offset origin, double s, List<_Region> regions) {
    canvas.save();
    canvas.translate(origin.dx, origin.dy);
    canvas.scale(s);
    final silhouette = Path()
      ..addOval(Rect.fromCircle(center: const Offset(50, 16), radius: 11))
      ..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(44, 25, 12, 8), const Radius.circular(3)))
      ..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(29, 33, 42, 80), const Radius.circular(14)))
      ..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(15, 36, 14, 48), const Radius.circular(7)))
      ..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(71, 36, 14, 48), const Radius.circular(7)))
      ..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(12, 82, 13, 40), const Radius.circular(6)))
      ..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(75, 82, 13, 40), const Radius.circular(6)))
      ..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(31, 108, 18, 104), const Radius.circular(9)))
      ..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(51, 108, 18, 104), const Radius.circular(9)));
    canvas.drawPath(silhouette, Paint()..color = body);
    canvas.drawPath(
      silhouette,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1 / s
        ..color = outline,
    );
    for (final (muscle, cx, cy, w, h) in regions) {
      final v = intensities[muscle] ?? 0;
      final rect = Rect.fromCenter(center: Offset(cx, cy), width: w, height: h);
      final color = v <= 0 ? idle : Color.lerp(hot, hotter, v)!.withValues(alpha: lerpDouble(0.35, 0.95, v));
      if (v > 0.5) {
        canvas.drawOval(
          rect.inflate(2),
          Paint()
            ..color = color.withValues(alpha: 0.35 * v)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
        );
      }
      canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular((w < h ? w : h) / 2)), Paint()..color = color);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_MuscleMapPainter old) => old.intensities != intensities || old.body != body;
}
