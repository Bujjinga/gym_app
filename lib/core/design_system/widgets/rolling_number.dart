import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show NumberFormat;

import '../theme/pulse_typography.dart';
import '../tokens/tokens.dart';

/// Odometer-style counter: each digit rolls vertically to its new value.
/// Digits are fixed-width so the number never jitters while animating.
class RollingNumber extends StatelessWidget {
  const RollingNumber({
    super.key,
    required this.value,
    this.style,
    this.fractionDigits = 0,
    this.duration = const Duration(milliseconds: 900),
  });

  final num value;
  final TextStyle? style;
  final int fractionDigits;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.maybeLocaleOf(context)?.toLanguageTag();
    final formatted = NumberFormat.decimalPatternDigits(locale: locale, decimalDigits: fractionDigits).format(value);
    final textStyle = PulseTypography.number().merge(style ?? Theme.of(context).textTheme.displaySmall);
    final scaler = MediaQuery.textScalerOf(context);
    final painter = TextPainter(
      text: TextSpan(text: '0', style: textStyle),
      textDirection: TextDirection.ltr,
      textScaler: scaler,
    )..layout();
    final digitSize = painter.size;
    painter.dispose();
    final reduced = context.reduceMotion;

    final chars = formatted.split('');
    return Semantics(
      label: formatted,
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < chars.length; i++)
            // Key by position from the right so units stay units when the
            // number gains a digit (999 → 1,000).
            KeyedSubtree(
              key: ValueKey(chars.length - i),
              child: switch (int.tryParse(chars[i])) {
                final int digit => _RollingDigit(
                    digit: digit,
                    size: digitSize,
                    style: textStyle,
                    duration: reduced ? Duration.zero : duration,
                  ),
                null => Text(chars[i], style: textStyle, textScaler: scaler),
              },
            ),
        ],
      ),
    );
  }
}

class _RollingDigit extends StatelessWidget {
  const _RollingDigit({required this.digit, required this.size, required this.style, required this.duration});

  final int digit;
  final Size size;
  final TextStyle style;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(end: digit.toDouble()),
      duration: duration,
      curve: MotionPreset.smooth.curve,
      builder: (context, position, child) => SizedBox(
        width: size.width,
        height: size.height,
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.topCenter,
            maxHeight: size.height * 10,
            child: Transform.translate(offset: Offset(0, -position * size.height), child: child),
          ),
        ),
      ),
      child: Column(
        children: [
          for (var d = 0; d < 10; d++)
            SizedBox(height: size.height, child: Center(child: Text('$d', style: style))),
        ],
      ),
    );
  }
}
