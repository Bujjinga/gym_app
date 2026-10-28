import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router.dart';
import '../../../app/theme_mode_controller.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/design_system/widgets/tab_page.dart';
import '../../../l10n/gen/app_localizations.dart';
import 'reminders_section.dart';

/// Profile tab: appearance, reminders and (debug builds) the component gallery.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final mode = ref.watch(themeModeControllerProvider);
    final text = Theme.of(context).textTheme;
    return Scaffold(
      body: TabPage(
        title: l10n.tabProfile,
        children: [
          SectionHeader(title: l10n.appearance),
          GlassCard(
            child: SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(value: ThemeMode.dark, label: Text(l10n.themeDark), icon: const Icon(Icons.dark_mode_rounded)),
                ButtonSegment(value: ThemeMode.light, label: Text(l10n.themeLight), icon: const Icon(Icons.light_mode_rounded)),
                ButtonSegment(
                    value: ThemeMode.system, label: Text(l10n.themeSystem), icon: const Icon(Icons.brightness_auto_rounded)),
              ],
              selected: {mode},
              onSelectionChanged: (s) => ref.read(themeModeControllerProvider.notifier).set(s.first),
            ),
          ),
          const RemindersSection(),
          // The gallery uses mock data, so it's only reachable in debug builds.
          if (kDebugMode) ...[
            SectionHeader(title: l10n.developer),
            GlassCard(
              onTap: () => const GalleryRoute().push<void>(context),
              semanticLabel: l10n.componentGallery,
              child: Row(
                children: [
                  Icon(Icons.widgets_rounded, color: context.colors.accentText),
                  const SizedBox(width: PulseMetrics.space16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.componentGallery, style: text.titleMedium),
                        Text(l10n.componentGallerySubtitle, style: text.bodySmall),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
