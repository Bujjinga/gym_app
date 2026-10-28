import 'package:flutter/material.dart';

/// Color tokens for PULSE. Dark is the primary design; light mirrors it with
/// adjusted contrast. Read via `context.colors`.
@immutable
class PulseColors extends ThemeExtension<PulseColors> {
  const PulseColors({
    required this.background,
    required this.surface,
    required this.surfaceRaised,
    required this.glassFill,
    required this.glassBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.onAccent,
    required this.accentStart,
    required this.accentEnd,
    required this.accentText,
    required this.success,
    required this.warning,
    required this.error,
    required this.zones,
    required this.ringMove,
    required this.ringExercise,
    required this.ringSteps,
  });

  final Color background;
  final Color surface;
  final Color surfaceRaised;
  final Color glassFill;
  final Color glassBorder;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;

  /// Text/icon color placed on top of the accent gradient.
  final Color onAccent;
  final Color accentStart;
  final Color accentEnd;

  /// Accent for text and small icons on the background: lime in dark mode,
  /// a deeper green in light mode so it meets WCAG AA (4.5:1).
  final Color accentText;
  final Color success;
  final Color warning;
  final Color error;

  /// Heart-rate zone colors, index 0 = Zone 1 … index 4 = Zone 5.
  final List<Color> zones;

  /// Two-stop gradients for the three activity rings.
  final List<Color> ringMove;
  final List<Color> ringExercise;
  final List<Color> ringSteps;

  LinearGradient get accentGradient => LinearGradient(
        colors: [accentStart, accentEnd],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static const dark = PulseColors(
    background: Color(0xFF07080A),
    surface: Color(0xFF101216),
    surfaceRaised: Color(0xFF181B21),
    glassFill: Color(0x14FFFFFF),
    glassBorder: Color(0x24FFFFFF),
    textPrimary: Color(0xFFF5F7FA),
    textSecondary: Color(0xFFA7B0BE),
    textMuted: Color(0xFF7A8391),
    onAccent: Color(0xFF07080A),
    accentStart: Color(0xFFC6FF3D),
    accentEnd: Color(0xFF22E1FF),
    accentText: Color(0xFFC6FF3D),
    success: Color(0xFF3DDC84),
    warning: Color(0xFFFFB020),
    error: Color(0xFFFF5470),
    zones: [
      Color(0xFF7DD3FC),
      Color(0xFF34D399),
      Color(0xFFFACC15),
      Color(0xFFFB923C),
      Color(0xFFF43F5E),
    ],
    ringMove: [Color(0xFFFF4D6D), Color(0xFFFF9A5A)],
    ringExercise: [Color(0xFFC6FF3D), Color(0xFF22E1FF)],
    ringSteps: [Color(0xFF22E1FF), Color(0xFF7C5CFF)],
  );

  static const light = PulseColors(
    background: Color(0xFFF3F5F8),
    surface: Color(0xFFFFFFFF),
    surfaceRaised: Color(0xFFFFFFFF),
    glassFill: Color(0xB3FFFFFF),
    glassBorder: Color(0x1A0B0D12),
    textPrimary: Color(0xFF0B0D12),
    textSecondary: Color(0xFF475162),
    textMuted: Color(0xFF6B7585),
    onAccent: Color(0xFF07080A),
    accentStart: Color(0xFF9BE01C),
    accentEnd: Color(0xFF14C3E0),
    accentText: Color(0xFF3F6E00),
    success: Color(0xFF15A35A),
    warning: Color(0xFFC77700),
    error: Color(0xFFD62F4B),
    zones: [
      Color(0xFF3A9FD6),
      Color(0xFF14A374),
      Color(0xFFC79A00),
      Color(0xFFE06A12),
      Color(0xFFD61F45),
    ],
    ringMove: [Color(0xFFF0284F), Color(0xFFFF7A3D)],
    ringExercise: [Color(0xFF7CC400), Color(0xFF00A8C6)],
    ringSteps: [Color(0xFF00A8C6), Color(0xFF6A45F5)],
  );

  // Tokens are swapped whole between dark/light, so per-field copies aren't needed.
  @override
  PulseColors copyWith() => this;

  @override
  PulseColors lerp(PulseColors? other, double t) {
    if (other == null) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    List<Color> l(List<Color> a, List<Color> b) =>
        [for (var i = 0; i < a.length; i++) c(a[i], b[i])];
    return PulseColors(
      background: c(background, other.background),
      surface: c(surface, other.surface),
      surfaceRaised: c(surfaceRaised, other.surfaceRaised),
      glassFill: c(glassFill, other.glassFill),
      glassBorder: c(glassBorder, other.glassBorder),
      textPrimary: c(textPrimary, other.textPrimary),
      textSecondary: c(textSecondary, other.textSecondary),
      textMuted: c(textMuted, other.textMuted),
      onAccent: c(onAccent, other.onAccent),
      accentStart: c(accentStart, other.accentStart),
      accentEnd: c(accentEnd, other.accentEnd),
      accentText: c(accentText, other.accentText),
      success: c(success, other.success),
      warning: c(warning, other.warning),
      error: c(error, other.error),
      zones: l(zones, other.zones),
      ringMove: l(ringMove, other.ringMove),
      ringExercise: l(ringExercise, other.ringExercise),
      ringSteps: l(ringSteps, other.ringSteps),
    );
  }
}
