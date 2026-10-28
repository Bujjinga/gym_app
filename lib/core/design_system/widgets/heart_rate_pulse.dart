import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../utils/heart_rate_zones.dart';
import '../theme/pulse_typography.dart';
import '../tokens/tokens.dart';
import 'rolling_number.dart';

/// Live heart-rate card: a scrolling beat waveform paced by the real [bpm],
/// a heart that beats in sync, and a background tint for the current zone.
/// Pass `bpm: null` when no live reading is available (flat line, grey).
class HeartRatePulse extends StatefulWidget {
  const HeartRatePulse({
    super.key,
    required this.bpm,
    required this.maxHeartRate,
    required this.semanticLabel,
    this.zoneLabel,
    this.height = 140,
  });

  final int? bpm;
  final int maxHeartRate;
  final String semanticLabel;

  /// Builds the zone caption, e.g. (3) => "Zone 3". Defaults to "Z3".
  final String Function(int zone)? zoneLabel;
  final double height;

  @override
  State<HeartRatePulse> createState() => _HeartRatePulseState();
}

class _HeartRatePulseState extends State<HeartRatePulse> with SingleTickerProviderStateMixin {
  static const _window = 4.0; // seconds of waveform on screen

  final _now = ValueNotifier<double>(0);
  final List<double> _beats = [];
  double _nextBeat = 0;
  late final Ticker _ticker = createTicker(_onTick);

  void _onTick(Duration elapsed) {
    final now = elapsed.inMicroseconds / 1e6;
    final bpm = widget.bpm;
    if (bpm != null && bpm > 0 && now >= _nextBeat) {
      _beats.add(now);
      _nextBeat = now + 60 / bpm;
    }
    _beats.removeWhere((b) => b < now - _window - 1);
    _now.value = now;
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
    _now.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final bpm = widget.bpm;
    final zone = bpm == null ? null : heartRateZone(bpm, widget.maxHeartRate);
    final color = zone == null ? c.textMuted : c.zones[zone - 1];
    final text = Theme.of(context).textTheme;

    return Semantics(
      label: widget.semanticLabel,
      excludeSemantics: true,
      child: AnimatedContainer(
        duration: context.motion.slow,
        height: widget.height,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(context.metrics.radiusLg),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: RepaintBoundary(
                child: CustomPaint(painter: _WavePainter(now: _now, beats: _beats, color: color, window: _window)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(PulseMetrics.space16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<double>(
                    valueListenable: _now,
                    builder: (context, now, child) {
                      final since = _beats.isEmpty ? 1.0 : now - _beats.last;
                      final e = math.max(0.0, 1 - since / 0.25);
                      return Transform.scale(scale: 1 + 0.2 * e * e, child: child);
                    },
                    child: Icon(Icons.favorite_rounded, color: color, size: 28),
                  ),
                  const SizedBox(width: PulseMetrics.space8),
                  if (bpm != null)
                    RollingNumber(value: bpm, style: PulseTypography.number(fontSize: 28, color: c.textPrimary))
                  else
                    Text('--', style: PulseTypography.number(fontSize: 28, color: c.textMuted)),
                  const SizedBox(width: PulseMetrics.space4),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('BPM', style: text.labelMedium),
                  ),
                  const Spacer(),
                  if (zone != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(999)),
                      child: Text(
                        widget.zoneLabel?.call(zone) ?? 'Z$zone',
                        style: text.labelMedium?.copyWith(color: c.onAccent),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  _WavePainter({required this.now, required this.beats, required this.color, required this.window})
      : super(repaint: now);

  final ValueNotifier<double> now;
  final List<double> beats;
  final Color color;
  final double window;

  static double _g(double x, double w) => math.exp(-(x * x) / (2 * w * w));

  /// Stylised P-QRS-T beat shape; dt in seconds since the beat started.
  static double _beat(double dt) =>
      0.12 * _g(dt - 0.05, 0.02) -
      0.15 * _g(dt - 0.13, 0.008) +
      1.0 * _g(dt - 0.16, 0.012) -
      0.25 * _g(dt - 0.19, 0.01) +
      0.28 * _g(dt - 0.36, 0.04);

  @override
  void paint(Canvas canvas, Size size) {
    final t = now.value;
    final baseline = size.height * 0.72;
    final amp = size.height * 0.42;
    final path = Path();
    for (var x = 0.0; x <= size.width; x += 2) {
      final tau = t - (size.width - x) / size.width * window;
      var y = 0.0;
      for (final b in beats) {
        final dt = tau - b;
        if (dt >= 0 && dt < 0.6) y += _beat(dt);
      }
      final py = baseline - y * amp;
      x == 0 ? path.moveTo(x, py) : path.lineTo(x, py);
    }
    final fade = LinearGradient(colors: [color.withValues(alpha: 0), color])
        .createShader(Offset.zero & size);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..shader = fade
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeJoin = StrokeJoin.round
        ..shader = fade,
    );
  }

  @override
  bool shouldRepaint(_WavePainter old) => old.color != color;
}
