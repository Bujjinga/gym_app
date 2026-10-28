import 'package:flutter/material.dart';

import '../../../core/design_system/design_system.dart';
import 'sections/buttons_section.dart';
import 'sections/celebration_section.dart';
import 'sections/heart_rate_section.dart';
import 'sections/metrics_section.dart';
import 'sections/micro_section.dart';
import 'sections/navigation_section.dart';
import 'sections/rest_timer_section.dart';
import 'sections/rings_section.dart';
import 'sections/shader_section.dart';

/// Developer-only showcase of every design-system component and signature
/// animation. Strings are intentionally not localized and all data is mock;
/// it is only linked from Profile in debug builds.
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  static const _sections = [
    ButtonsSection(),
    MetricsSection(),
    RingsSection(),
    HeartRateSection(),
    RestTimerSection(),
    ShaderSection(),
    CelebrationSection(),
    MicroSection(),
    NavigationSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RippleDistortion(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar.large(title: Text('Component gallery')),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 48 + MediaQuery.paddingOf(context).bottom),
              sliver: SliverList.builder(
                itemCount: _sections.length,
                itemBuilder: (context, i) => Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: StaggeredEntry(index: i, child: _sections[i]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
