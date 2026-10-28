import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/platform/permissions_service.dart';
import '../../../../core/platform/platform_providers.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../activity/application/step_counter_service.dart';
import '../../../health/data/health_sync_service.dart';
import '../../application/onboarding_controller.dart';
import 'step_scaffold.dart';

/// Explains each permission in plain language before the system prompt.
/// Every permission is optional.
class PermissionsStep extends ConsumerStatefulWidget {
  const PermissionsStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  ConsumerState<PermissionsStep> createState() => _PermissionsStepState();
}

class _PermissionsStepState extends ConsumerState<PermissionsStep> {
  final _results = <AppPermission, PermissionResult>{};
  AppPermission? _pending;

  Future<void> _request(AppPermission p) async {
    setState(() => _pending = p);
    final result = await ref.read(permissionsServiceProvider).request(p);
    if (!mounted) return;
    if (result == PermissionResult.granted) {
      Haptics.success();
      if (p == AppPermission.motion) await ref.read(stepCounterProvider).start();
      if (p == AppPermission.health) unawaited(ref.read(healthSyncProvider).syncRecentDays());
      // Allowing notifications here means "yes, remind me" (saved with the profile at the end).
      if (p == AppPermission.notifications) {
        ref.read(onboardingControllerProvider.notifier).edit((d) => d.copyWith(remindersEnabled: true));
      }
    }
    setState(() => (_results[p] = result, _pending = null));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final service = ref.watch(permissionsServiceProvider);
    final isIOS = ref.watch(platformCapabilitiesProvider).isIOS;
    (IconData, String, String) describe(AppPermission p) => switch (p) {
          AppPermission.health => (
              Icons.favorite_rounded,
              l10n.permHealthTitle,
              isIOS ? l10n.permHealthBodyIos : l10n.permHealthBodyAndroid
            ),
          AppPermission.motion => (Icons.directions_walk_rounded, l10n.permMotionTitle, l10n.permMotionBody),
          AppPermission.location => (Icons.location_on_rounded, l10n.permLocationTitle, l10n.permLocationBody),
          AppPermission.notifications =>
            (Icons.notifications_active_rounded, l10n.permNotificationsTitle, l10n.permNotificationsBody),
        };

    return StepScaffold(
      title: l10n.permissionsTitle,
      subtitle: l10n.permissionsBody,
      primaryLabel: l10n.finish,
      onPrimary: widget.onNext,
      child: Column(
        children: [
          for (final p in service.applicable)
            Padding(
              padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
              child: _PermissionCard(
                icon: describe(p).$1,
                title: describe(p).$2,
                body: describe(p).$3,
                result: _results[p],
                busy: _pending == p,
                onAllow: () => _request(p),
                onOpenSettings: service.openSettings,
              ),
            ),
        ],
      ),
    );
  }
}

class _PermissionCard extends StatelessWidget {
  const _PermissionCard({
    required this.icon,
    required this.title,
    required this.body,
    required this.result,
    required this.busy,
    required this.onAllow,
    required this.onOpenSettings,
  });

  final IconData icon;
  final String title;
  final String body;
  final PermissionResult? result;
  final bool busy;
  final VoidCallback onAllow;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final Widget trailing = switch (result) {
      PermissionResult.granted => Row(mainAxisSize: MainAxisSize.min, children: [
          const AnimatedCheckmark(checked: true, size: 22),
          const SizedBox(width: PulseMetrics.space8),
          Text(l10n.allowed, style: text.labelLarge?.copyWith(color: c.success)),
        ]),
      PermissionResult.permanentlyDenied => TextButton(onPressed: onOpenSettings, child: Text(l10n.openSettings)),
      PermissionResult.unavailable => Text(l10n.notAvailable, style: text.labelMedium),
      PermissionResult.denied => TextButton(onPressed: onAllow, child: Text(l10n.allow)),
      null => SecondaryButton(label: l10n.allow, onPressed: busy ? null : onAllow),
    };
    return GlassCard(
      blur: false,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: c.accentText),
          const SizedBox(width: PulseMetrics.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text.titleMedium),
                const SizedBox(height: PulseMetrics.space4),
                Text(body, style: text.bodySmall),
                if (result == PermissionResult.denied)
                  Text(l10n.notAllowed, style: text.labelSmall?.copyWith(color: c.warning)),
                const SizedBox(height: PulseMetrics.space8),
                Align(alignment: Alignment.centerRight, child: trailing),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
