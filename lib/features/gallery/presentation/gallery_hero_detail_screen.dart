import 'package:flutter/material.dart';

import '../../../core/design_system/design_system.dart';
import 'sections/navigation_section.dart';

/// Full-screen end of the gallery Hero demo.
class GalleryHeroDetailScreen extends StatelessWidget {
  const GalleryHeroDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final name = NavigationSection.demoExercises[id % NavigationSection.demoExercises.length];
    return Scaffold(
      body: PulseHero(
        tag: 'gallery-exercise-$id',
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [c.accentEnd.withValues(alpha: 0.25), c.background],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(PulseMetrics.space24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const Spacer(),
                  Icon(Icons.fitness_center_rounded, size: 64, color: c.accentStart),
                  const SizedBox(height: PulseMetrics.space16),
                  Text(name, style: text.displaySmall),
                  const SizedBox(height: PulseMetrics.space8),
                  Text('Exercise detail lands here in Phase 4.', style: text.bodyLarge),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
