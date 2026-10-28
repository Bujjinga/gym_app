import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Fragment-shader effects: mesh gradient, PR shimmer and ripple distortion.
class ShaderSection extends StatelessWidget {
  const ShaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final backend = ui.ImageFilter.isShaderFilterSupported ? 'Impeller: shader distortion' : 'Fallback: ring';
    return GallerySection(
      title: 'Shader effects',
      note: 'Ripple mode on this device — $backend.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(context.metrics.radiusMd),
            child: SizedBox(
              height: 180,
              child: MeshGradientBackground(
                child: Center(child: Text('Mesh gradient (Home background)', style: text.titleMedium)),
              ),
            ),
          ),
          const SizedBox(height: PulseMetrics.space16),
          Row(
            children: [
              ShimmerBadge(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(gradient: c.accentGradient, borderRadius: BorderRadius.circular(999)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.emoji_events_rounded, size: 18, color: c.onAccent),
                      const SizedBox(width: 6),
                      Text('NEW PR · 120 kg', style: text.labelLarge?.copyWith(color: c.onAccent)),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              StartWorkoutButton(
                label: 'Start workout',
                onPressed: () => PulseToast.show(context, 'Ripple! (gallery demo)'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
