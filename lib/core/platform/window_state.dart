import 'dart:ui';

/// Saved desktop window frame, restored on the next launch.
class WindowState {
  const WindowState(this.bounds, {this.maximized = false});

  final Rect bounds;
  final bool maximized;

  /// Null for missing or malformed data.
  static WindowState? fromJson(Map<String, dynamic> json) {
    final [x, y, w, h] = [for (final k in ['x', 'y', 'w', 'h']) json[k]];
    if (x is! num || y is! num || w is! num || h is! num) return null;
    return WindowState(Rect.fromLTWH(x.toDouble(), y.toDouble(), w.toDouble(), h.toDouble()),
        maximized: json['maximized'] == true);
  }

  Map<String, Object> toJson() =>
      {'x': bounds.left, 'y': bounds.top, 'w': bounds.width, 'h': bounds.height, 'maximized': maximized};

  /// The frame to use given the screens' visible areas: grown to [minSize],
  /// or null (use the default centered frame) when it's no longer on any
  /// screen, e.g. the monitor it was on was unplugged.
  Rect? fit(List<Rect> screens, Size minSize) {
    final b = Rect.fromLTWH(
      bounds.left,
      bounds.top,
      bounds.width < minSize.width ? minSize.width : bounds.width,
      bounds.height < minSize.height ? minSize.height : bounds.height,
    );
    // The title bar area must be reachable to move the window.
    final grip = Offset(b.center.dx, b.top + 16);
    return screens.any((s) => s.contains(grip)) ? b : null;
  }
}
