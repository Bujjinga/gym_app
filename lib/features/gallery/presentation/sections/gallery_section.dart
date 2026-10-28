import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';

/// Titled block in the component gallery.
class GallerySection extends StatelessWidget {
  const GallerySection({super.key, required this.title, required this.child, this.note});

  final String title;
  final String? note;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: title),
        if (note != null)
          Padding(
            padding: const EdgeInsets.only(bottom: PulseMetrics.space8),
            child: Text(note!, style: Theme.of(context).textTheme.bodySmall),
          ),
        GlassCard(blur: false, child: child),
      ],
    );
  }
}
