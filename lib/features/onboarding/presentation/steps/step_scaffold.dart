import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';

/// Shared layout for onboarding steps: title, subtitle, scrollable content
/// and a bottom primary action (plus optional secondary action).
class StepScaffold extends StatelessWidget {
  const StepScaffold({
    super.key,
    required this.title,
    required this.child,
    required this.primaryLabel,
    required this.onPrimary,
    this.subtitle,
    this.secondaryLabel,
    this.onSecondary,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final String primaryLabel;
  final VoidCallback? onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Padding(
          padding: const EdgeInsets.all(PulseMetrics.space24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(header: true, child: Text(title, style: text.headlineMedium)),
              if (subtitle != null) ...[
                const SizedBox(height: PulseMetrics.space8),
                Text(subtitle!, style: text.bodyLarge?.copyWith(color: context.colors.textSecondary)),
              ],
              const SizedBox(height: PulseMetrics.space24),
              Expanded(child: SingleChildScrollView(child: child)),
              const SizedBox(height: PulseMetrics.space16),
              PrimaryButton(label: primaryLabel, onPressed: onPrimary, expand: true),
              if (secondaryLabel != null) TextButton(onPressed: onSecondary, child: Text(secondaryLabel!)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Large selectable card used by single-choice steps.
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
    this.body,
  });

  final IconData icon;
  final String title;
  final String? body;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
      child: Semantics(
        selected: selected,
        child: GlassCard(
          blur: false,
          semanticLabel: title,
          onTap: () {
            Haptics.selection();
            onTap();
          },
          child: Row(
            children: [
              AnimatedContainer(
                duration: context.motion.medium,
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: selected ? c.accentGradient : null,
                  color: selected ? null : c.glassFill,
                ),
                child: Icon(icon, color: selected ? c.onAccent : c.textSecondary),
              ),
              const SizedBox(width: PulseMetrics.space16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: text.titleMedium),
                    if (body != null) Text(body!, style: text.bodySmall),
                  ],
                ),
              ),
              AnimatedCheckmark(checked: selected, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
