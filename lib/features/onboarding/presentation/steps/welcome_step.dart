import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../l10n/gen/app_localizations.dart';

/// First page: animated rings illustration, headline and "Get started".
class WelcomeStep extends StatelessWidget {
  const WelcomeStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final motion = context.motion;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Padding(
          padding: const EdgeInsets.all(PulseMetrics.space24),
          child: Column(
            children: [
              const Spacer(),
              // Decorative: excluded from semantics, the headline carries the message.
              const ExcludeSemantics(
                child: ActivityRings(move: 0.82, exercise: 0.64, steps: 0.93, size: 220, semanticLabel: ''),
              ),
              const SizedBox(height: PulseMetrics.space48),
              Semantics(
                header: true,
                child: Text(l10n.welcomeTitle, style: text.displaySmall, textAlign: TextAlign.center),
              ).animate().fadeIn(delay: motion.medium, duration: motion.slow).slideY(begin: motion.reduced ? 0 : 0.2),
              const SizedBox(height: PulseMetrics.space16),
              Text(l10n.welcomeBody, style: text.bodyLarge, textAlign: TextAlign.center)
                  .animate()
                  .fadeIn(delay: motion.slow, duration: motion.slow),
              const Spacer(),
              PrimaryButton(label: l10n.getStarted, icon: Icons.arrow_forward_rounded, onPressed: onNext, expand: true),
            ],
          ),
        ),
      ),
    );
  }
}
