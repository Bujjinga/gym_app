import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Scales and fades [child] as it scrolls past the top or bottom edge of the
/// nearest scroll view. Repaint-only (no rebuilds), so it stays cheap at 120Hz.
class ScrollFadeScale extends SingleChildRenderObjectWidget {
  const ScrollFadeScale({super.key, required Widget super.child});

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderScrollFadeScale(
        Scrollable.of(context),
        MediaQuery.maybeDisableAnimationsOf(context) ?? false,
      );

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    (renderObject as _RenderScrollFadeScale)
      ..scrollable = Scrollable.of(context)
      ..reduced = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
  }
}

class _RenderScrollFadeScale extends RenderProxyBox {
  _RenderScrollFadeScale(this._scrollable, this.reduced);

  ScrollableState _scrollable;
  bool reduced;

  set scrollable(ScrollableState value) {
    if (value == _scrollable) return;
    if (attached) _scrollable.position.removeListener(markNeedsPaint);
    _scrollable = value;
    if (attached) _scrollable.position.addListener(markNeedsPaint);
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsPaint);
    super.detach();
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final viewport = _scrollable.context.findRenderObject() as RenderBox?;
    if (child == null || viewport == null || !viewport.hasSize) return super.paint(context, offset);
    final top = localToGlobal(Offset.zero, ancestor: viewport).dy;
    final h = size.height;
    final vh = viewport.size.height;
    // 1 = fully inside the viewport, 0 = fully past an edge.
    final visible = top < 0
        ? ((top + h) / h).clamp(0.0, 1.0)
        : top + h > vh
            ? ((vh - top) / h).clamp(0.0, 1.0)
            : 1.0;
    if (visible >= 1) return super.paint(context, offset);
    final alpha = (visible * 255).round();
    if (reduced) {
      context.pushOpacity(offset, alpha, super.paint);
      return;
    }
    final scale = 0.9 + 0.1 * visible;
    final center = size.center(Offset.zero);
    final transform = Matrix4.identity()
      ..translateByDouble(center.dx, center.dy, 0, 1)
      ..scaleByDouble(scale, scale, 1, 1)
      ..translateByDouble(-center.dx, -center.dy, 0, 1);
    context.pushOpacity(offset, alpha, (ctx, o) => ctx.pushTransform(needsCompositing, o, transform, super.paint));
  }
}
