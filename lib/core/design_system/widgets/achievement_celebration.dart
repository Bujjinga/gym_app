import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../platform/haptics.dart';
import '../tokens/tokens.dart';
import 'confetti_burst.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

/// Full-screen achievement unlock: confetti, a 3D-flipping medal, title and
/// share/close actions. Reduced motion: no confetti, medal simply fades in.
Future<void> showAchievementCelebration(
  BuildContext context, {
  required String title,
  required String subtitle,
  required IconData icon,
  required String shareLabel,
  required String closeLabel,
  required VoidCallback onShare,
}) {
  return Navigator.of(context, rootNavigator: true).push(
    PageRouteBuilder<void>(
      opaque: false,
      barrierDismissible: true,
      barrierLabel: closeLabel,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, _) => FadeTransition(
        opacity: animation,
        child: _Celebration(
          title: title,
          subtitle: subtitle,
          icon: icon,
          shareLabel: shareLabel,
          closeLabel: closeLabel,
          onShare: onShare,
        ),
      ),
    ),
  );
}

class _Celebration extends StatefulWidget {
  const _Celebration({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.shareLabel,
    required this.closeLabel,
    required this.onShare,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String shareLabel;
  final String closeLabel;
  final VoidCallback onShare;

  @override
  State<_Celebration> createState() => _CelebrationState();
}

class _CelebrationState extends State<_Celebration> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600))
    ..forward();

  @override
  void initState() {
    super.initState();
    Haptics.success();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final reduced = context.reduceMotion;
    final flip = CurvedAnimation(parent: _controller, curve: const Interval(0, 0.85, curve: Curves.easeOutCubic));
    final pop = CurvedAnimation(parent: _controller, curve: Interval(0, 0.5, curve: MotionPreset.bouncy.curve));
    final details = CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1, curve: Curves.easeOut));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: ColoredBox(color: c.background.withValues(alpha: 0.78)),
          ),
          if (!reduced) const ConfettiBurst(),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(PulseMetrics.space24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) {
                        if (reduced) return Opacity(opacity: _controller.value, child: _medal(c, front: true));
                        // Two full turns, decelerating to face front.
                        final angle = 4 * math.pi * (1 - flip.value);
                        final front = math.cos(angle) >= 0;
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.0012)
                            ..rotateY(angle)
                            ..scaleByDouble(0.4 + 0.6 * pop.value, 0.4 + 0.6 * pop.value, 1, 1),
                          child: _medal(c, front: front),
                        );
                      },
                    ),
                    const SizedBox(height: PulseMetrics.space32),
                    FadeTransition(
                      opacity: details,
                      child: Column(
                        children: [
                          Semantics(
                            header: true,
                            liveRegion: true,
                            child: Text(widget.title, style: text.headlineMedium, textAlign: TextAlign.center),
                          ),
                          const SizedBox(height: PulseMetrics.space8),
                          Text(widget.subtitle, style: text.bodyLarge, textAlign: TextAlign.center),
                          const SizedBox(height: PulseMetrics.space32),
                          Wrap(
                            spacing: PulseMetrics.space12,
                            runSpacing: PulseMetrics.space12,
                            alignment: WrapAlignment.center,
                            children: [
                              PrimaryButton(label: widget.shareLabel, icon: Icons.ios_share_rounded, onPressed: widget.onShare),
                              SecondaryButton(label: widget.closeLabel, onPressed: () => Navigator.of(context).pop()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _medal(PulseColors c, {required bool front}) {
    return Container(
      width: 168,
      height: 168,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: front
            ? c.accentGradient
            : LinearGradient(colors: [c.accentEnd, c.accentStart], begin: Alignment.topRight, end: Alignment.bottomLeft),
        boxShadow: [BoxShadow(color: c.accentEnd.withValues(alpha: 0.45), blurRadius: 48, spreadRadius: 2)],
      ),
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: c.onAccent.withValues(alpha: 0.25), width: 3),
        ),
        child: front
            ? Icon(widget.icon, size: 72, color: c.onAccent)
            : Icon(Icons.bolt_rounded, size: 56, color: c.onAccent.withValues(alpha: 0.5)),
      ),
    );
  }
}
