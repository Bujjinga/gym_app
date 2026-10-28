import 'package:flutter/material.dart';

import '../../../../app/router.dart';
import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Hero card → detail flights and the scroll-effects / shared-axis demo.
class NavigationSection extends StatelessWidget {
  const NavigationSection({super.key});

  static const demoExercises = ['Bench press', 'Back squat', 'Deadlift'];

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    return GallerySection(
      title: 'Hero, page transitions & scroll',
      note: 'Cards fly into a full-screen detail (custom shuttle morphs the corners and cross-fades).',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: demoExercises.length,
              separatorBuilder: (_, _) => const SizedBox(width: PulseMetrics.space12),
              itemBuilder: (context, i) => SizedBox(
                width: 180,
                child: PulseHero(
                  tag: 'gallery-exercise-$i',
                  child: GlassCard(
                    blur: false,
                    semanticLabel: demoExercises[i],
                    onTap: () => GalleryHeroRoute(id: i).push<void>(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.fitness_center_rounded, color: c.ringExercise[i % 2]),
                        const Spacer(),
                        Text(demoExercises[i], style: text.titleMedium),
                        Text('Chest · Barbell', style: text.bodySmall),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: PulseMetrics.space16),
          Align(
            alignment: Alignment.centerLeft,
            child: SecondaryButton(
              label: 'Scroll effects (shared-axis push)',
              icon: Icons.swap_vert_rounded,
              onPressed: () => const GalleryScrollRoute().push<void>(context),
            ),
          ),
        ],
      ),
    );
  }
}
