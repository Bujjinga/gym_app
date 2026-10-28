import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/semantics.dart';

import '../../platform/haptics.dart';
import '../tokens/tokens.dart';

/// Row you swipe right to complete (e.g. a set). Haptic detents at 25% and
/// 50%; releasing past 50% completes. Screen readers get a custom action.
class SwipeToComplete extends StatefulWidget {
  const SwipeToComplete({
    super.key,
    required this.child,
    required this.onCompleted,
    required this.actionLabel,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback onCompleted;

  /// Accessibility action name, e.g. "Complete set".
  final String actionLabel;
  final bool enabled;

  @override
  State<SwipeToComplete> createState() => _SwipeToCompleteState();
}

class _SwipeToCompleteState extends State<SwipeToComplete> with SingleTickerProviderStateMixin {
  static const _detents = [0.25, 0.5];
  late final AnimationController _offset = AnimationController.unbounded(vsync: this);
  double _width = 1;
  int _detentsPassed = 0;

  double get _fraction => (_offset.value / _width).clamp(0.0, 1.0);

  void _onUpdate(DragUpdateDetails d) {
    _offset.value = (_offset.value + d.delta.dx).clamp(0.0, _width);
    final passed = _detents.where((t) => _fraction >= t).length;
    if (passed != _detentsPassed) {
      Haptics.selection();
      _detentsPassed = passed;
    }
  }

  Future<void> _onEnd(DragEndDetails d) async {
    final complete = _fraction >= 0.5 || d.primaryVelocity! > 900;
    _detentsPassed = 0;
    final spring = MotionPreset.snappy.spring;
    if (complete) {
      Haptics.success();
      await _offset.animateWith(SpringSimulation(spring, _offset.value, _width, d.primaryVelocity!));
      widget.onCompleted();
    }
    if (mounted) await _offset.animateWith(SpringSimulation(spring, _offset.value, 0, 0));
  }

  @override
  void dispose() {
    _offset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final radius = BorderRadius.circular(context.metrics.radiusMd);
    return Semantics(
      customSemanticsActions: widget.enabled
          ? {CustomSemanticsAction(label: widget.actionLabel): widget.onCompleted}
          : null,
      child: LayoutBuilder(
        builder: (context, constraints) {
          _width = constraints.maxWidth;
          return GestureDetector(
            onHorizontalDragUpdate: widget.enabled ? _onUpdate : null,
            onHorizontalDragEnd: widget.enabled ? _onEnd : null,
            child: ClipRRect(
              borderRadius: radius,
              child: AnimatedBuilder(
                animation: _offset,
                child: widget.child,
                builder: (context, child) {
                  final f = _fraction;
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: ColoredBox(
                          color: c.success.withValues(alpha: 0.25 + 0.75 * f),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: PulseMetrics.space24),
                              child: Transform.scale(
                                scale: 0.6 + 0.6 * (f / 0.5).clamp(0.0, 1.0),
                                child: Icon(Icons.check_rounded, color: c.onAccent, size: 28),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(offset: Offset(_offset.value, 0), child: child),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
