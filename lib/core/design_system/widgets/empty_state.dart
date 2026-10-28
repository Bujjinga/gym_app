import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../tokens/tokens.dart';
import 'primary_button.dart';

/// Friendly placeholder for "no data", denied permissions, unsupported
/// features and errors. Use [isError] for failure states.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.isError = false,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final gradient = isError
        ? LinearGradient(colors: [c.error, c.warning])
        : c.accentGradient;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Padding(
          padding: const EdgeInsets.all(PulseMetrics.space24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(shape: BoxShape.circle, gradient: gradient),
                child: Icon(icon, size: 32, color: c.onAccent),
              ).animate().scale(
                    begin: const Offset(0.8, 0.8),
                    duration: context.motion.slow,
                    curve: MotionPreset.bouncy.curve,
                  ),
              const SizedBox(height: PulseMetrics.space16),
              Semantics(
                header: true,
                child: Text(title, style: text.titleLarge, textAlign: TextAlign.center),
              ),
              const SizedBox(height: PulseMetrics.space8),
              Text(message, style: text.bodyMedium, textAlign: TextAlign.center),
              if (actionLabel != null && onAction != null) ...[
                const SizedBox(height: PulseMetrics.space24),
                PrimaryButton(label: actionLabel!, onPressed: onAction),
              ],
            ],
          ).animate().fadeIn(duration: context.motion.medium),
        ),
      ),
    );
  }
}
