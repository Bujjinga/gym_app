import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../tokens/tokens.dart';

enum ToastKind { info, success, warning, error }

/// Lightweight, auto-dismissing toast that slides in above the bottom edge
/// and is announced to screen readers.
abstract final class PulseToast {
  static OverlayEntry? _current;

  static void show(BuildContext context, String message, {ToastKind kind = ToastKind.info}) {
    _current?.remove();
    final overlay = Overlay.of(context, rootOverlay: true);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _ToastView(
        message: message,
        kind: kind,
        onDone: () {
          if (_current == entry) _current = null;
          if (entry.mounted) entry.remove();
        },
      ),
    );
    _current = entry;
    overlay.insert(entry);
    SemanticsService.sendAnnouncement(View.of(context), message, Directionality.of(context));
  }
}

class _ToastView extends StatefulWidget {
  const _ToastView({required this.message, required this.kind, required this.onDone});

  final String message;
  final ToastKind kind;
  final VoidCallback onDone;

  @override
  State<_ToastView> createState() => _ToastViewState();
}

class _ToastViewState extends State<_ToastView> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 320));

  @override
  void initState() {
    super.initState();
    _run();
  }

  Future<void> _run() async {
    await _controller.forward();
    await Future<void>.delayed(const Duration(milliseconds: 2800));
    if (!mounted) return;
    await _controller.reverse();
    widget.onDone();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final (icon, color) = switch (widget.kind) {
      ToastKind.info => (Icons.info_outline_rounded, c.accentEnd),
      ToastKind.success => (Icons.check_circle_rounded, c.success),
      ToastKind.warning => (Icons.warning_amber_rounded, c.warning),
      ToastKind.error => (Icons.error_outline_rounded, c.error),
    };
    final curved = CurvedAnimation(parent: _controller, curve: MotionPreset.bouncy.curve, reverseCurve: Curves.easeIn);
    final reduced = context.reduceMotion;
    return Positioned(
      left: PulseMetrics.space16,
      right: PulseMetrics.space16,
      bottom: MediaQuery.paddingOf(context).bottom + 96,
      child: Center(
        child: FadeTransition(
          opacity: _controller,
          child: SlideTransition(
            position: Tween(begin: Offset(0, reduced ? 0 : 0.6), end: Offset.zero).animate(curved),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Material(
                color: c.surfaceRaised,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.metrics.radiusMd),
                  side: BorderSide(color: color.withValues(alpha: 0.5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space16, vertical: 14),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, color: color),
                      const SizedBox(width: PulseMetrics.space12),
                      Flexible(child: Text(widget.message, style: Theme.of(context).textTheme.bodyLarge)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
