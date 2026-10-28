import 'package:flutter/material.dart';

import '../../../core/design_system/design_system.dart';

/// Scroll effects demo: parallax stretch header, pinned section header and
/// cards that scale/fade as they cross the viewport edges.
class GalleryScrollDemoScreen extends StatelessWidget {
  const GalleryScrollDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Scroll effects'),
              collapseMode: CollapseMode.parallax,
              stretchModes: const [StretchMode.zoomBackground, StretchMode.fadeTitle],
              background: MeshGradientBackground(
                child: Center(child: Icon(Icons.landscape_rounded, size: 120, color: c.accentStart)),
              ),
            ),
          ),
          PinnedHeaderSliver(
            child: Container(
              color: c.background,
              padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space16, vertical: PulseMetrics.space12),
              child: Semantics(header: true, child: Text('Sticky section header', style: text.titleMedium)),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(PulseMetrics.space16),
            sliver: SliverList.separated(
              itemCount: 30,
              separatorBuilder: (_, _) => const SizedBox(height: PulseMetrics.space12),
              itemBuilder: (context, i) => ScrollFadeScale(
                child: GlassCard(
                  blur: false,
                  child: Row(
                    children: [
                      CircleAvatar(backgroundColor: c.zones[i % 5], child: Text('${i + 1}')),
                      const SizedBox(width: PulseMetrics.space16),
                      Expanded(child: Text('Workout ${i + 1}', style: text.titleMedium)),
                      Text('${40 + i} min', style: text.bodyMedium),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
