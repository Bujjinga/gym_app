import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/design_system/design_system.dart';
import '../features/profile/data/drift_profile_repository.dart';
import '../l10n/gen/app_localizations.dart';
import '../l10n/greeting.dart';

part 'splash_screen.g.dart';

/// True once the intro has finished; heavy startup work waits for it so it
/// doesn't steal the animation's frames.
@Riverpod(keepAlive: true)
class IntroDone extends _$IntroDone {
  @override
  bool build() => false;

  void finish() => state = true;
}

/// The /splash route while the profile loads. The animation itself is
/// [SplashOverlay], drawn above the app so it can dissolve into it.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => const ColoredBox(color: _Intro.background, child: SizedBox.expand());
}

/// Cold-start intro over the whole app: particles gather into the heartbeat
/// mark, an electric pulse runs through it, two heavy beats shake the screen,
/// the wordmark slams in and the user is greeted. Once the app underneath is
/// ready it dissolves through a blur. Reduced motion: a short fade.
class SplashOverlay extends ConsumerStatefulWidget {
  const SplashOverlay({super.key, required this.child});

  final Widget child;

  /// The intro layer, while it's showing.
  static const introKey = ValueKey('splash-intro');

  @override
  ConsumerState<SplashOverlay> createState() => _SplashOverlayState();
}

class _SplashOverlayState extends ConsumerState<SplashOverlay> with TickerProviderStateMixin {
  late final _intro = AnimationController(vsync: this, duration: _Intro.duration);
  // 120 ms of still frame (the app's first paint hides there), then a 650 ms dissolve.
  late final _exit = AnimationController(vsync: this, duration: const Duration(milliseconds: 770));
  var _started = false;
  var _exiting = false;
  var _revealed = false;
  var _gone = false;
  var _cues = 0;

  @override
  void initState() {
    super.initState();
    _intro.addListener(_haptics);
    _intro.addStatusListener((_) => _maybeExit());
    _exit.addStatusListener((s) {
      if (s != AnimationStatus.completed) return;
      setState(() => _gone = true);
      ref.read(introDoneProvider.notifier).finish();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (context.reduceMotion) {
      _intro.value = 1;
      _exit.duration = const Duration(milliseconds: 200);
    } else {
      _intro.forward();
    }
  }

  void _maybeExit() {
    if (_exiting || !_intro.isCompleted || !ref.read(userProfileProvider).hasValue) return;
    _exiting = true;
    // Paint the app for the first time while the intro is a still image, so
    // that slow first frame is invisible, then start the dissolve.
    setState(() => _revealed = true);
    _exit.forward();
  }

  void _haptics() {
    final s = _Intro.at(_intro.value);
    final due = _Intro.cues.where((c) => s >= c).length;
    if (due > _cues) {
      _cues = due;
      Haptics.thump();
    }
  }

  @override
  void dispose() {
    _intro.dispose();
    _exit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userProfileProvider, (_, _) => _maybeExit());
    if (_gone) return widget.child;
    final greeting = AppLocalizations.of(context).greeting(ref.watch(userProfileProvider).value?.displayName);
    final reduced = context.reduceMotion;
    final scene = RepaintBoundary(child: _IntroScene(intro: _intro, greeting: greeting));
    return Stack(
      fit: StackFit.expand,
      children: [
        // Built and laid out underneath, but not painted or animated until the
        // intro has finished moving, so it doesn't compete with it for frames.
        Visibility(visible: _revealed || reduced, maintainState: true, child: widget.child),
        AbsorbPointer(
          key: SplashOverlay.introKey,
          child: AnimatedBuilder(
            animation: _exit,
            child: scene,
            builder: (context, scene) {
              final e = const Interval(120 / 770, 1, curve: Curves.easeInOutCubic).transform(_exit.value);
              if (e == 0) return scene!;
              final fading = Opacity(
                opacity: 1 - e,
                child: reduced ? scene : Transform.scale(scale: 1 + 0.15 * e, child: scene),
              );
              if (reduced) return fading;
              // The app comes into focus as the intro zooms through and fades.
              final sigma = 16 * (1 - e);
              return Stack(
                fit: StackFit.expand,
                children: [
                  BackdropFilter(filter: ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma), child: const SizedBox.expand()),
                  fading,
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Timeline of the intro, in seconds.
abstract final class _Intro {
  /// The first frames after launch are the slowest (engine and font warm-up),
  /// so the timeline starts by holding the static mark — which matches the
  /// native splash — for [lead] seconds. Times below are after the lead.
  static const lead = 0.25;
  static const total = 3.25;
  static const duration = Duration(milliseconds: 3250);

  /// Seconds into the intro (negative during the lead) for a controller value.
  static double at(double value) => value * total - lead;
  static const background = Color(0xFF07080A); // native splash colour, so the hand-over is seamless

  static const ignite = (0.75, 1.2); // line draws through the arriving particles
  static const surge = (1.2, 1.6); // electric pulse runs along the mark
  static const beats = [1.62, 1.9];
  static const slam = (2.0, 2.25); // wordmark falls in and lands
  static const greet = (2.35, 2.8);
  static const cues = [1.62, 1.9, 2.25]; // haptic thumps

  static double span(double s, (double, double) range, [Curve curve = Curves.easeOutCubic]) =>
      curve.transform(((s - range.$1) / (range.$2 - range.$1)).clamp(0.0, 1.0));

  /// 1 at [at], decaying quickly.
  static double hit(double s, double at, [double decay = 14]) => s < at ? 0 : math.exp(-(s - at) * decay);

  /// Screen shake from the beats and the wordmark landing.
  static Offset shake(double s) {
    final a = 8 * hit(s, beats[0]) + 5 * hit(s, beats[1]) + 6 * hit(s, slam.$2, 16);
    return Offset(math.sin(s * 93) * a, math.cos(s * 71) * a);
  }

  static Interval interval((double, double) range, Curve curve) =>
      Interval((range.$1 + lead) / total, (range.$2 + lead) / total, curve: curve);
}

/// Built once; everything inside animates through [intro] without rebuilding.
class _IntroScene extends StatelessWidget {
  const _IntroScene({required this.intro, required this.greeting});

  final Animation<double> intro;
  final String greeting;

  @override
  Widget build(BuildContext context) {
    const colors = PulseColors.dark; // the intro is always dark, like the native splash
    final slam = CurvedAnimation(parent: intro, curve: _Intro.interval(_Intro.slam, Curves.easeInCubic));
    final greet = CurvedAnimation(parent: intro, curve: _Intro.interval(_Intro.greet, Curves.easeOutCubic));

    final wordmark = ShaderMask(
      shaderCallback: (r) => LinearGradient(colors: [colors.accentStart, colors.accentEnd]).createShader(r),
      child: Text('PULSE', style: PulseTypography.number(fontSize: 40, color: Colors.white).copyWith(letterSpacing: 10)),
    );

    return Semantics(
      label: 'PULSE. $greeting',
      container: true,
      child: ColoredBox(
        color: _Intro.background,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(painter: _ScenePainter(intro, start: colors.accentStart, end: colors.accentEnd)),
            Align(
              child: AnimatedBuilder(
                animation: intro,
                builder: (context, child) =>
                    Transform.translate(offset: _Intro.shake(_Intro.at(intro.value)) + const Offset(0, 96), child: child),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeTransition(
                      opacity: slam,
                      child: ScaleTransition(
                        scale: Tween(begin: 2.4, end: 1.0).animate(slam),
                        child: AnimatedBuilder(
                          animation: slam,
                          child: wordmark,
                          // Motion blur only while falling; none once landed.
                          builder: (context, child) {
                            final sigma = 8 * (1 - slam.value);
                            return sigma < 0.3
                                ? child!
                                : ImageFiltered(imageFilter: ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma), child: child);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: PulseMetrics.space12),
                    FadeTransition(
                      opacity: greet,
                      child: SlideTransition(
                        position: Tween(begin: const Offset(0, 0.4), end: Offset.zero).animate(greet),
                        child: Text(
                          greeting,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colors.textSecondary),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Mark geometry and particle targets, computed once (the mark never changes size).
final class _Geometry {
  _Geometry._() {
    final rect = Rect.fromCenter(center: Offset.zero, width: width, height: width * PulseLogo.aspect);
    path = PulseLogo.path(rect);
    metric = path.computeMetrics().first;
    shader = LinearGradient(colors: [PulseColors.dark.accentStart, PulseColors.dark.accentEnd]).createShader(rect);
    targets = [for (final p in particles) metric.getTangentForOffset(metric.length * p.along)!.position];
  }

  static final instance = _Geometry._();

  /// Native splash mark size: 1152 px image at 4×, mark at 42 %.
  static const width = 288 * 0.42;
  static final stroke = PulseLogo.strokeFor(width);
  static final particles = _Particle.generate(80);

  late final Path path;
  late final ui.PathMetric metric;
  late final Shader shader;
  late final List<Offset> targets;
}

class _ScenePainter extends CustomPainter {
  _ScenePainter(this.intro, {required this.start, required this.end}) : super(repaint: intro);

  final Animation<double> intro;
  final Color start;
  final Color end;

  final _g = _Geometry.instance;
  late final _mid = Color.lerp(start, end, 0.5)!;
  late final _line = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..shader = _g.shader;
  final _ring = Paint()..style = PaintingStyle.stroke;
  final _streak = Paint()..strokeCap = StrokeCap.round;
  final _fill = Paint();
  final _white = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
  Shader? _flash;
  Size? _flashSize;

  @override
  void paint(Canvas canvas, Size size) {
    final s = _Intro.at(intro.value);
    final center = size.center(Offset.zero) + _Intro.shake(s);
    final b1 = _Intro.hit(s, _Intro.beats[0]);
    final b2 = _Intro.hit(s, _Intro.beats[1]);
    final beat = math.max(b1, b2);
    final stroke = _Geometry.stroke;

    // Flash of light on each beat.
    if (beat > 0.01) {
      final r = math.min(size.shortestSide, 520.0) * 0.75; // not full-screen: fill rate is costly on phones
      if (_flashSize != size) {
        _flashSize = size;
        _flash = RadialGradient(colors: [_mid, _mid.withValues(alpha: 0)])
            .createShader(Rect.fromCircle(center: size.center(Offset.zero), radius: r));
      }
      canvas.drawCircle(center, r, _fill..shader = _flash..color = Color.fromRGBO(0, 0, 0, 0.28 * beat));
      _fill.shader = null;
    }

    // Shockwave rings.
    for (final at in _Intro.beats) {
      final p = (s - at) / 0.7;
      if (p < 0 || p >= 1) continue;
      _ring
        ..strokeWidth = 6 * (1 - p)
        ..color = _mid.withValues(alpha: 0.7 * (1 - p));
      canvas.drawCircle(center, _Geometry.width * (0.5 + 2.4 * Curves.easeOutCubic.transform(p)), _ring);
    }

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.scale(1 + 0.22 * b1 + 0.13 * b2);

    // The native splash mark fades to a ghost while the particles gather.
    final ghost = 1 - 0.88 * Curves.easeOut.transform((s / 0.3).clamp(0.0, 1.0)); // full during the lead
    canvas.drawPath(_g.path, _line..strokeWidth = stroke..color = Color.fromRGBO(0, 0, 0, ghost)..maskFilter = null);

    if (s < 1.4) _paintParticles(canvas, s);

    final draw = _Intro.span(s, _Intro.ignite, Curves.easeInOutCubic);
    if (draw > 0) {
      final lit = draw >= 1 ? _g.path : _g.metric.extractPath(0, _g.metric.length * draw);
      canvas.drawPath(
        lit,
        _line
          ..strokeWidth = stroke * 1.5
          ..color = Color.fromRGBO(0, 0, 0, 0.45 + 0.55 * beat)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 7 + 7 * beat),
      );
      canvas.drawPath(lit, _line..strokeWidth = stroke..color = const Color(0xFF000000)..maskFilter = null);
    }

    _paintSurge(canvas, s, stroke);
    canvas.restore();
  }

  void _paintParticles(Canvas canvas, double s) {
    for (final (i, p) in _Geometry.particles.indexed) {
      final u = ((s - p.delay) / 0.8).clamp(0.0, 1.0);
      if (u <= 0) continue;
      final alpha = (u / 0.15).clamp(0.0, 1.0) * (1 - ((s - p.delay - 0.8) / 0.25).clamp(0.0, 1.0));
      if (alpha <= 0) continue;
      final target = _g.targets[i];
      Offset at(double u) {
        final e = Curves.easeInOutCubic.transform(u);
        final a = p.angle + p.spin * e;
        return target + Offset(math.cos(a), math.sin(a)) * (p.radius * (1 - e));
      }

      final now = at(u);
      final color = Color.lerp(start, end, p.along)!;
      _streak
        ..strokeWidth = p.size
        ..color = color.withValues(alpha: 0.45 * alpha);
      canvas.drawLine(at(math.max(0, u - 0.05)), now, _streak); // short streak behind it
      canvas.drawCircle(now, p.size * 0.8, _fill..color = Color.lerp(color, Colors.white, 0.6)!.withValues(alpha: alpha));
    }
  }

  /// A white-hot segment racing along the mark, throwing sparks.
  void _paintSurge(Canvas canvas, double s, double stroke) {
    if (s < _Intro.surge.$1 || s > _Intro.surge.$2 + 0.1) return;
    final f = _Intro.span(s, _Intro.surge, Curves.easeInOutSine);
    final fade = 1 - ((s - _Intro.surge.$2) / 0.1).clamp(0.0, 1.0);
    final len = _g.metric.length;
    final segment = _g.metric.extractPath(math.max(0, f - 0.14) * len, f * len);
    canvas.drawPath(
      segment,
      _white
        ..strokeWidth = stroke * 1.8
        ..color = Colors.white.withValues(alpha: 0.6 * fade)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );
    canvas.drawPath(segment, _white..strokeWidth = stroke * 0.5..color = Colors.white.withValues(alpha: fade)..maskFilter = null);
    // Sparks flicker: reseeded every frame-ish so they crackle.
    final head = _g.metric.getTangentForOffset(f * len)!.position;
    final rnd = math.Random((s * 60).floor());
    _white
      ..strokeWidth = 1.6
      ..color = Colors.white.withValues(alpha: 0.85 * fade);
    for (var i = 0; i < 6; i++) {
      var p = head;
      final dir = rnd.nextDouble() * math.pi * 2;
      for (var k = 0; k < 3; k++) {
        final a = dir + (rnd.nextDouble() - 0.5) * 1.4;
        final next = p + Offset(math.cos(a), math.sin(a)) * (4 + rnd.nextDouble() * 7);
        canvas.drawLine(p, next, _white);
        p = next;
      }
    }
  }

  @override
  bool shouldRepaint(_ScenePainter old) => old.intro != intro || old.start != start || old.end != end;
}

class _Particle {
  const _Particle(this.along, this.angle, this.radius, this.spin, this.delay, this.size);

  final double along; // 0…1 position on the mark it flies to
  final double angle;
  final double radius;
  final double spin;
  final double delay;
  final double size;

  static List<_Particle> generate(int n) {
    final r = math.Random(7);
    return [
      for (var i = 0; i < n; i++)
        _Particle(
          (i + r.nextDouble()) / n,
          r.nextDouble() * math.pi * 2,
          150 + r.nextDouble() * 220,
          (r.nextBool() ? 1 : -1) * (0.8 + r.nextDouble() * 1.2),
          r.nextDouble() * 0.3,
          1.2 + r.nextDouble() * 1.8,
        ),
    ];
  }
}
