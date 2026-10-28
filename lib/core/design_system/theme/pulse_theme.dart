import 'package:flutter/material.dart';

import '../animations/pulse_page_transitions.dart';
import '../tokens/tokens.dart';
import 'pulse_typography.dart';

/// Builds the light and dark [ThemeData] from PULSE tokens.
abstract final class PulseTheme {
  static ThemeData dark() => _build(Brightness.dark, PulseColors.dark, PulseShadows.dark);
  static ThemeData light() => _build(Brightness.light, PulseColors.light, PulseShadows.light);

  static ThemeData _build(Brightness brightness, PulseColors c, PulseShadows shadows) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.accentStart,
      onPrimary: c.onAccent,
      secondary: c.accentEnd,
      onSecondary: c.onAccent,
      error: c.error,
      onError: Colors.white,
      surface: c.surface,
      onSurface: c.textPrimary,
      onSurfaceVariant: c.textSecondary,
      surfaceContainerLowest: c.background,
      surfaceContainerLow: c.surface,
      surfaceContainer: c.surface,
      surfaceContainerHigh: c.surfaceRaised,
      surfaceContainerHighest: c.surfaceRaised,
      outline: c.glassBorder,
      outlineVariant: c.glassBorder,
    );
    final text = PulseTypography.textTheme(c.textPrimary, c.textSecondary);
    const metrics = PulseMetrics.standard;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      canvasColor: c.background,
      textTheme: text,
      extensions: [c, metrics, shadows],
      splashFactory: InkSparkle.splashFactory,
      // Lime text fails contrast on the light background; accentText doesn't.
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: c.accentText)),
      dividerTheme: DividerThemeData(color: c.glassBorder, thickness: 1, space: 1),
      iconTheme: IconThemeData(color: c.textPrimary),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: c.textPrimary,
        elevation: 0,
        titleTextStyle: text.titleLarge,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: c.surface,
        indicatorColor: c.accentStart.withValues(alpha: 0.18),
        selectedIconTheme: IconThemeData(color: c.accentText),
        unselectedIconTheme: IconThemeData(color: c.textSecondary),
        selectedLabelTextStyle: text.labelMedium?.copyWith(color: c.textPrimary),
        unselectedLabelTextStyle: text.labelMedium,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: c.glassFill,
        side: BorderSide(color: c.glassBorder),
        labelStyle: text.labelLarge,
        shape: const StadiumBorder(),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: c.accentStart,
        thumbColor: c.accentStart,
        inactiveTrackColor: c.glassBorder,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.surfaceRaised,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(metrics.radiusLg)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surfaceRaised,
        modalBackgroundColor: c.surfaceRaised,
        showDragHandle: true,
        dragHandleColor: c.textMuted,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(metrics.radiusLg)),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: c.surfaceRaised,
          borderRadius: BorderRadius.circular(metrics.radiusSm),
          border: Border.all(color: c.glassBorder),
        ),
        textStyle: text.bodySmall?.copyWith(color: c.textPrimary),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),
          TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
          TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),
        },
      ),
    );
  }
}
