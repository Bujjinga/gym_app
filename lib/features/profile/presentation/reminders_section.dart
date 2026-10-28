import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design_system/design_system.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../reminders/data/notification_service.dart';
import '../data/drift_profile_repository.dart';

/// Reminders on/off and the time they arrive. Turning them on asks for
/// notification permission first.
class RemindersSection extends ConsumerWidget {
  const RemindersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final profile = ref.watch(userProfileProvider).value;
    if (profile == null) return const SizedBox.shrink();
    final repo = ref.read(profileRepositoryProvider);
    final time = TimeOfDay(hour: profile.reminderMinute ~/ 60, minute: profile.reminderMinute % 60);

    Future<void> toggle(bool on) async {
      if (on && !await ref.read(notificationServiceProvider).requestPermission()) {
        if (context.mounted) PulseToast.show(context, l10n.remindersDenied, kind: ToastKind.error);
        return;
      }
      Haptics.selection();
      await repo.save(profile.copyWith(remindersEnabled: on));
    }

    Future<void> pickTime() async {
      final picked = await showTimePicker(context: context, initialTime: time);
      if (picked != null) await repo.save(profile.copyWith(reminderMinute: picked.hour * 60 + picked.minute));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.remindersTitle),
        GlassCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SwitchListTile(
                value: profile.remindersEnabled,
                onChanged: toggle,
                title: Text(l10n.remindersTitle),
                subtitle: Text(l10n.remindersBody),
              ),
              if (profile.remindersEnabled)
                ListTile(
                  leading: const Icon(Icons.schedule_rounded),
                  title: Text(l10n.reminderTime),
                  trailing: Text(time.format(context)),
                  onTap: pickTime,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
