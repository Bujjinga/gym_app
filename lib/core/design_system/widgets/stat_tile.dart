import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'glass_card.dart';
import 'rolling_number.dart';

/// Compact metric card: icon, label, rolling value and unit, optional delta.
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.unit,
    this.fractionDigits = 0,
    this.delta,
    this.accent,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final num value;
  final String? unit;
  final int fractionDigits;

  /// Short change text, e.g. "+12%"; colored by sign.
  final String? delta;
  final Color? accent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final tint = accent ?? c.accentStart;
    final deltaColor = delta == null ? null : (delta!.startsWith('-') ? c.error : c.success);
    return GlassCard(
      onTap: onTap,
      semanticLabel: '$label: $value${unit == null ? '' : ' $unit'}${delta == null ? '' : ', $delta'}',
      child: ExcludeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(color: tint.withValues(alpha: 0.16), shape: BoxShape.circle),
                  child: Icon(icon, size: 16, color: tint),
                ),
                const SizedBox(width: PulseMetrics.space8),
                Expanded(child: Text(label, style: text.labelMedium, overflow: TextOverflow.ellipsis)),
                if (delta != null) Text(delta!, style: text.labelSmall?.copyWith(color: deltaColor)),
              ],
            ),
            const SizedBox(height: PulseMetrics.space12),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  RollingNumber(value: value, fractionDigits: fractionDigits, style: text.headlineMedium),
                  if (unit != null) ...[
                    const SizedBox(width: PulseMetrics.space4),
                    Text(unit!, style: text.labelMedium),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
