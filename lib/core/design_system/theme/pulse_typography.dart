import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Type system: Nunito (rounded) for numbers/display, Inter for text.
/// All display styles use tabular figures so live counters don't jitter.
abstract final class PulseTypography {
  /// Tests turn this off so they never hit the network for font files.
  static bool useGoogleFonts = true;

  static const tabular = [FontFeature.tabularFigures()];

  /// Rounded numeric style for stats, timers and counters.
  static TextStyle number({
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.w800,
    Color? color,
  }) {
    final base = TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: 1.1,
      letterSpacing: -0.5,
      fontFeatures: tabular,
    );
    return useGoogleFonts ? GoogleFonts.nunito(textStyle: base) : base;
  }

  static TextTheme textTheme(Color primary, Color secondary) {
    TextStyle display(double size) =>
        number(fontSize: size, color: primary, fontWeight: FontWeight.w800);
    return TextTheme(
      displayLarge: display(57),
      displayMedium: display(45),
      displaySmall: display(36),
      headlineLarge: _text(32, FontWeight.w700, primary, -0.5),
      headlineMedium: _text(28, FontWeight.w700, primary, -0.4),
      headlineSmall: _text(24, FontWeight.w700, primary, -0.3),
      titleLarge: _text(20, FontWeight.w700, primary, -0.2),
      titleMedium: _text(16, FontWeight.w600, primary, 0),
      titleSmall: _text(14, FontWeight.w600, primary, 0),
      bodyLarge: _text(16, FontWeight.w400, primary, 0),
      bodyMedium: _text(14, FontWeight.w400, secondary, 0),
      bodySmall: _text(12, FontWeight.w400, secondary, 0),
      labelLarge: _text(14, FontWeight.w600, primary, 0.1),
      labelMedium: _text(12, FontWeight.w600, secondary, 0.2),
      labelSmall: _text(11, FontWeight.w600, secondary, 0.4),
    );
  }

  // Inter is applied per style: google_fonts' TextTheme helpers target material_ui, not flutter/material.
  static TextStyle _text(double size, FontWeight weight, Color color, double spacing) {
    final style = TextStyle(fontSize: size, fontWeight: weight, color: color, letterSpacing: spacing);
    return useGoogleFonts ? GoogleFonts.inter(textStyle: style) : style;
  }
}
