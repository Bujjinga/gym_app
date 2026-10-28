import 'package:flutter/material.dart';

/// Elevation tokens. Read via `context.shadows`.
@immutable
class PulseShadows extends ThemeExtension<PulseShadows> {
  const PulseShadows({required this.card, required this.raised});

  final List<BoxShadow> card;
  final List<BoxShadow> raised;

  /// Soft colored glow used under accent elements (buttons, ring tips).
  List<BoxShadow> glow(Color color, {double strength = 1}) => [
        BoxShadow(
          color: color.withValues(alpha: 0.35 * strength),
          blurRadius: 24 * strength,
          spreadRadius: -4,
          offset: const Offset(0, 8),
        ),
      ];

  static const dark = PulseShadows(
    card: [
      BoxShadow(color: Color(0x66000000), blurRadius: 24, offset: Offset(0, 12)),
    ],
    raised: [
      BoxShadow(color: Color(0x80000000), blurRadius: 40, offset: Offset(0, 20)),
    ],
  );

  static const light = PulseShadows(
    card: [
      BoxShadow(color: Color(0x140B0D12), blurRadius: 24, offset: Offset(0, 10)),
    ],
    raised: [
      BoxShadow(color: Color(0x1F0B0D12), blurRadius: 40, offset: Offset(0, 18)),
    ],
  );

  @override
  PulseShadows copyWith() => this;

  @override
  PulseShadows lerp(PulseShadows? other, double t) {
    if (other == null) return this;
    return PulseShadows(
      card: BoxShadow.lerpList(card, other.card, t)!,
      raised: BoxShadow.lerpList(raised, other.raised, t)!,
    );
  }
}
