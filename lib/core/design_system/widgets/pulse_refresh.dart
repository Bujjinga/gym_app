import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../platform/haptics.dart';
import '../tokens/tokens.dart';
import 'pulse_logo.dart';

/// Pull-to-refresh with the PULSE look: pulling frosts the content, and
/// while [onRefresh] runs the heartbeat mark beats over the blur.
/// The child must be a vertical scrollable (it gets always-scrollable physics).
class PulseRefresh extends StatefulWidget {
  const PulseRefresh({super.key, required this.onRefresh, required this.child, this.semanticLabel});

  final Future<void> Function() onRefresh;
  final Widget child;
  final String? semanticLabel;

  @override
  State<PulseRefresh> createState() => _PulseRefreshState();
}

class _PulseRefreshState extends State<PulseRefresh> with SingleTickerProviderStateMixin {
  late final _beat = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
  RefreshIndicatorStatus? _status;

  @override
  void dispose() {
    _beat.dispose();
    super.dispose();
  }

  void _onStatus(RefreshIndicatorStatus? status) {
    if (status == RefreshIndicatorStatus.armed) Haptics.selection();
    setState(() => _status = status);
  }

  // RefreshIndicator never reports `refresh` to onStatusChange, so the
  // refreshing state is tracked here, around the actual refresh.
  bool _refreshing = false;

  Future<void> _refresh() async {
    setState(() => _refreshing = true);
    if (!context.reduceMotion) _beat.repeat();
    try {
      // A minimum duration so the effect reads as deliberate, not a flicker.
      await Future.wait([widget.onRefresh(), Future<void>.delayed(const Duration(milliseconds: 900))]);
    } finally {
      if (mounted) {
        _beat.stop();
        setState(() => _refreshing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // No effect in `drag`: RefreshIndicator reports it for any scroll that starts
    // at the top, including ordinary scrolling down; only `armed` is a real pull.
    final (blur, logo) = _refreshing
        ? (10.0, 1.0)
        : switch (_status) {
            RefreshIndicatorStatus.armed || RefreshIndicatorStatus.snap => (6.0, 0.7),
            _ => (0.0, 0.0),
          };
    final duration = context.motion.medium;
    return RefreshIndicator.noSpinner(
      onRefresh: _refresh,
      onStatusChange: _onStatus,
      child: Stack(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(end: blur),
            duration: duration,
            // Always in the tree (toggled with `enabled`): inserting it mid-pull
            // would remount the scrollable and cut off the drag.
            builder: (context, sigma, child) => ImageFiltered(
              enabled: sigma >= 0.1,
              imageFilter: ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
              child: child!,
            ),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(physics: const AlwaysScrollableScrollPhysics()),
              child: widget.child,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedOpacity(
                opacity: logo,
                duration: duration,
                child: Center(
                  child: Semantics(
                    liveRegion: _refreshing,
                    label: _refreshing ? widget.semanticLabel : null,
                    child: AnimatedBuilder(
                      animation: _beat,
                      // Two quick beats per cycle, like a heartbeat.
                      builder: (context, _) {
                        double bump(double x) => x < 0 || x > 0.28 ? 0 : math.sin(x / 0.28 * math.pi);
                        final t = _beat.value;
                        return PulseLogo(width: 96, beat: math.max(bump(t), 0.6 * bump(t - 0.3)));
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
