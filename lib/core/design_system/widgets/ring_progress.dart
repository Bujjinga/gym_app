import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import '../../platform/haptics.dart';
import '../tokens/tokens.dart';

/// A single activity ring: gradient sweep stroke with a glowing tip.
///
/// [value] is progress toward the goal (1.0 = goal, can exceed 1). When the
/// value crosses 1 the ring overshoots and settles (bouncy spring), bursts
/// particles from the tip and fires a success haptic.
class RingProgress extends StatefulWidget {
  const RingProgress({
    super.key,
    required this.value,
    required this.colors,
    this.size = 160,
    this.strokeWidth = 16,
    this.onGoalClosed,
    this.child,
    this.semanticLabel,
  });

  final double value;

  /// Two-color gradient for the stroke (start → tip).
  final List<Color> colors;
  final double size;
  final double strokeWidth;
  final VoidCallback? onGoalClosed;
  final Widget? child;
  final String? semanticLabel;

  @override
  State<RingProgress> createState() => _RingProgressState();
}

class _RingProgressState extends State<RingProgress> with TickerProviderStateMixin {
  late final AnimationController _progress = AnimationController.unbounded(vsync: this);
  late final AnimationController _burst =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
  bool _pendingCelebration = false;

  @override
  void initState() {
    super.initState();
    _progress.addListener(_checkGoal);
    // Entry animation from empty; no celebration for an already-closed ring.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _animateTo(widget.value, MotionPreset.smooth);
    });
  }

  @override
  void didUpdateWidget(RingProgress old) {
    super.didUpdateWidget(old);
    if (old.value == widget.value) return;
    final closing = old.value < 1 && widget.value >= 1;
    if (closing) _pendingCelebration = true;
    _animateTo(widget.value, closing ? MotionPreset.bouncy : MotionPreset.smooth);
  }

  void _animateTo(double target, MotionPreset preset) {
    if (context.reduceMotion) {
      _progress.value = target;
      return;
    }
    _progress.animateWith(SpringSimulation(preset.spring, _progress.value, target, _progress.velocity));
  }

  void _checkGoal() {
    if (!_pendingCelebration || _progress.value < 1) return;
    _pendingCelebration = false;
    Haptics.success();
    widget.onGoalClosed?.call();
    if (!context.reduceMotion) _burst.forward(from: 0);
  }

  @override
  void dispose() {
    _progress.dispose();
    _burst.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      value: '${(widget.value * 100).round()}%',
      child: RepaintBoundary(
        child: SizedBox.square(
          dimension: widget.size,
          child: CustomPaint(
            painter: _RingPainter(
              progress: _progress,
              burst: _burst,
              colors: widget.colors,
              strokeWidth: widget.strokeWidth,
            ),
            child: widget.child == null ? null : Center(child: widget.child),
          ),
        ),
      ),
    );
  }
}

class _Particle {
  _Particle(math.Random r)
      : angle = r.nextDouble() * 2 * math.pi,
        speed = 0.4 + r.nextDouble() * 0.6,
        size = 2 + r.nextDouble() * 3,
        colorT = r.nextDouble();

  final double angle;
  final double speed;
  final double size;
  final double colorT;
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.progress,
    required this.burst,
    required this.colors,
    required this.strokeWidth,
  }) : super(repaint: Listenable.merge([progress, burst]));

  final Animation<double> progress;
  final Animation<double> burst;
  final List<Color> colors;
  final double strokeWidth;

  static final _particles = List.generate(18, (_) => _Particle(math.Random(7)));
  static const _start = -math.pi / 2;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final p = math.max(0.0, progress.value);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = colors.first.withValues(alpha: 0.16),
    );
    if (p > 0.001) {
      final sweep = 2 * math.pi * math.min(p, 1);
      final arc = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          colors: colors,
          endAngle: math.max(sweep, 0.01),
          transform: const GradientRotation(_start),
        ).createShader(rect);
      canvas.drawArc(rect, _start, sweep, false, arc);

      final tipAngle = _start + 2 * math.pi * p;
      final tip = center + Offset(math.cos(tipAngle), math.sin(tipAngle)) * radius;
      if (p > 1) {
        // Overlap lap: shadow under the tip so the second lap reads as on top.
        final overlap = 2 * math.pi * (p - 1);
        canvas.drawCircle(
          tip + Offset(math.cos(tipAngle + math.pi / 2), math.sin(tipAngle + math.pi / 2)) * 2,
          strokeWidth / 2,
          Paint()
            ..color = Colors.black.withValues(alpha: 0.45)
            ..maskFilter = MaskFilter.blur(BlurStyle.normal, strokeWidth * 0.3),
        );
        canvas.drawArc(
          rect,
          _start,
          overlap,
          false,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..strokeCap = StrokeCap.round
            ..color = colors.last,
        );
      }
      // Glow at the tip.
      canvas.drawCircle(
        tip,
        strokeWidth * 0.75,
        Paint()
          ..color = colors.last.withValues(alpha: 0.55)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, strokeWidth * 0.6),
      );
      canvas.drawCircle(tip, strokeWidth / 2, Paint()..color = colors.last);
    }

    // Goal-close particle burst from the top of the ring.
    final b = burst.value;
    if (b > 0 && b < 1) {
      final origin = center + Offset(0, -radius);
      final eased = Curves.easeOutCubic.transform(b);
      for (final particle in _particles) {
        final dir = Offset(math.cos(particle.angle), math.sin(particle.angle));
        final pos = origin + dir * (particle.speed * eased * strokeWidth * 4);
        canvas.drawCircle(
          pos,
          particle.size * (1 - b * 0.6),
          Paint()..color = Color.lerp(colors.first, colors.last, particle.colorT)!.withValues(alpha: 1 - b),
        );
      }
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.colors != colors || old.strokeWidth != strokeWidth;
}
