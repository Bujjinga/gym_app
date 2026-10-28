import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Achievement unlock: confetti, 3D medal flip, share.
class CelebrationSection extends StatelessWidget {
  const CelebrationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GallerySection(
      title: 'Achievement unlock',
      note: 'Physics confetti, perspective medal flip, success haptic, share button.',
      child: Align(
        alignment: Alignment.centerLeft,
        child: PrimaryButton(
          label: 'Unlock achievement',
          icon: Icons.military_tech_rounded,
          onPressed: () => showAchievementCelebration(
            context,
            title: '100 Workouts',
            subtitle: 'You showed up a hundred times. Legendary consistency.',
            icon: Icons.military_tech_rounded,
            shareLabel: 'Share',
            closeLabel: 'Done',
            onShare: () => SharePlus.instance.share(ShareParams(text: 'I just hit 100 workouts on PULSE!')),
          ),
        ),
      ),
    );
  }
}
