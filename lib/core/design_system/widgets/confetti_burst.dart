import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Physics confetti: pieces launch upward from [origin] (fractional position
/// in the box), spread, tumble and fall under gravity. Plays once on mount.
class ConfettiBurst extends StatefulWidget {
  const ConfettiBurst({super.key, this.origin = const Alignment(0, 0.1), this.count = 160});

  final Alignment origin;
  final int count;

  @override
  State<ConfettiBurst> createState() => _ConfettiBurstState();
}

class _ConfettiBurstState extends State<ConfettiBurst> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3200))
    ..forward();
  late final List<_Piece> _pieces;

  @override
  void initState() {
    super.initState();
    final r = math.Random();
    _pieces = List.generate(widget.count, (_) => _Piece(r));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final palette = [c.accentStart, c.accentEnd, ...c.ringMove, c.ringSteps.last, c.warning];
    return IgnorePointer(
      child: RepaintBoundary(
        child: CustomPaint(
          size: Size.infinite,
          painter: _ConfettiPainter(_controller, _pieces, palette, widget.origin),
        ),
      ),
    );
  }
}

class _Piece {
  _Piece(math.Random r)
      : vx = (r.nextDouble() - 0.5) * 1.6,
        vy = -(0.9 + r.nextDouble() * 0.9),
        spin = (r.nextDouble() - 0.5) * 20,
        wobble = r.nextDouble() * math.pi * 2,
        w = 6 + r.nextDouble() * 6,
        h = 4 + r.nextDouble() * 8,
        circle = r.nextDouble() < 0.25,
        colorIndex = r.nextInt(1 << 16),
        delay = r.nextDouble() * 0.12;

  final double vx, vy, spin, wobble, w, h, delay;
  final bool circle;
  final int colorIndex;
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter(this.animation, this.pieces, this.palette, this.origin) : super(repaint: animation);

  final Animation<double> animation;
  final List<_Piece> pieces;
  final List<Color> palette;
  final Alignment origin;

  @override
  void paint(Canvas canvas, Size size) {
    final start = origin.alongSize(size);
    final scale = size.height;
    const gravity = 1.6; // in "screen heights" per s²
    const drag = 0.6;
    final paint = Paint();
    for (final p in pieces) {
      final t = (animation.value * 3.2 - p.delay).clamp(0.0, 3.2); // seconds
      if (t <= 0) continue;
      // Velocity decays with drag; gravity pulls down.
      final decay = (1 - math.exp(-drag * t)) / drag;
      final x = start.dx + p.vx * decay * scale * 0.6 + math.sin(p.wobble + t * 6) * 6;
      final y = start.dy + p.vy * decay * scale * 0.6 + 0.5 * gravity * t * t * scale * 0.25;
      final fade = (1 - (t - 2.4) / 0.8).clamp(0.0, 1.0);
      if (fade <= 0) continue;
      paint.color = palette[p.colorIndex % palette.length].withValues(alpha: fade);
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p.spin * t);
      if (p.circle) {
        canvas.drawCircle(Offset.zero, p.w / 2.5, paint);
      } else {
        // Scale X by cos to fake a 3D flip as the piece tumbles.
        canvas.scale(math.cos(p.wobble + t * 8), 1);
        canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: p.w, height: p.h), paint);
      }
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => false;
}
