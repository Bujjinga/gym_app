import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../platform/haptics.dart';
import '../theme/pulse_typography.dart';
import '../tokens/tokens.dart';

/// Circular rest countdown. Driven by wall-clock [endsAt] so it stays correct
/// after the app is backgrounded. Ticks a haptic for each of the last 3
/// seconds, then morphs into a "GO" state with a success haptic.
class RestTimer extends StatefulWidget {
  const RestTimer({
    super.key,
    required this.endsAt,
    required this.total,
    required this.goLabel,
    required this.semanticLabel,
    this.onFinished,
    this.size = 220,
  });

  final DateTime endsAt;
  final Duration total;
  final String goLabel;

  /// Builds the spoken label from the remaining time.
  final String Function(Duration remaining) semanticLabel;
  final VoidCallback? onFinished;
  final double size;

  @override
  State<RestTimer> createState() => _RestTimerState();
}

class _RestTimerState extends State<RestTimer> with TickerProviderStateMixin {
  late final Ticker _ticker = createTicker((_) => _tick());
  late final _go = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  Duration _remaining = Duration.zero;
  int _lastSecond = -1;
  bool _finished = false;

  @override
  void initState() {
    super.initState();
    _restart();
  }

  @override
  void didUpdateWidget(RestTimer old) {
    super.didUpdateWidget(old);
    if (old.endsAt != widget.endsAt || old.total != widget.total) _restart();
  }

  void _restart() {
    _finished = false;
    _go.value = 0;
    _lastSecond = -1;
    _tick();
    if (!_finished && !_ticker.isActive) _ticker.start();
  }

  void _tick() {
    final left = widget.endsAt.difference(DateTime.now());
    final remaining = left.isNegative ? Duration.zero : left;
    final second = (remaining.inMilliseconds / 1000).ceil();
    if (second != _lastSecond) {
      if (_lastSecond != -1 && second > 0 && second <= 3) Haptics.tick();
      _lastSecond = second;
    }
    if (remaining == Duration.zero && !_finished) {
      _finished = true;
      if (_ticker.isActive) _ticker.stop();
      Haptics.success();
      _go.forward(from: 0);
      widget.onFinished?.call();
    }
    setState(() => _remaining = remaining);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _go.dispose();
    super.dispose();
  }

  String _format(Duration d) {
    final s = (d.inMilliseconds / 1000).ceil();
    return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final totalMs = math.max(1, widget.total.inMilliseconds);
    final fraction = (_remaining.inMilliseconds / totalMs).clamp(0.0, 1.0);
    final reduced = context.reduceMotion;
    return Semantics(
      label: widget.semanticLabel(_remaining),
      excludeSemantics: true,
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: _go,
          builder: (context, _) {
            final g = MotionPreset.bouncy.curve.transform(_go.value);
            return SizedBox.square(
              dimension: widget.size,
              child: CustomPaint(
                painter: _CountdownPainter(
                  fraction: _finished ? 1 : fraction,
                  go: g,
                  colors: [c.accentStart, c.accentEnd],
                  track: c.glassBorder,
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: context.motion.medium,
                    transitionBuilder: (child, animation) => reduced
                        ? FadeTransition(opacity: animation, child: child)
                        : ScaleTransition(
                            scale: CurvedAnimation(parent: animation, curve: MotionPreset.bouncy.curve),
                            child: FadeTransition(opacity: animation, child: child),
                          ),
                    child: _finished
                        ? Text(
                            widget.goLabel,
                            key: const ValueKey('go'),
                            style: PulseTypography.number(fontSize: widget.size * 0.26, color: c.accentText),
                          )
                        : Text(
                            _format(_remaining),
                            key: const ValueKey('time'),
                            style: PulseTypography.number(fontSize: widget.size * 0.22, color: c.textPrimary),
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CountdownPainter extends CustomPainter {
  _CountdownPainter({required this.fraction, required this.go, required this.colors, required this.track});

  final double fraction;
  final double go; // 0 → 1 morph into the GO state
  final List<Color> colors;
  final Color track;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.shortestSide * (0.06 + 0.03 * go);
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - stroke) / 2 - 8;
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawCircle(center, radius, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = track);
    if (go > 0) {
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = colors.first.withValues(alpha: 0.18 * go.clamp(0, 1))
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 24 * go.clamp(0, 1)),
      );
    }
    final sweep = 2 * math.pi * fraction;
    if (sweep <= 0) return;
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(colors: colors, transform: const GradientRotation(-math.pi / 2)).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(_CountdownPainter old) => old.fraction != fraction || old.go != go || old.colors != colors;
}
