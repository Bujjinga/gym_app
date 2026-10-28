import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design_system/design_system.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../security/application/app_lock_controller.dart';
import '../../security/presentation/lock_screen.dart';

/// App lock on/off, Face ID / fingerprint and changing the PIN. Turning it
/// off or changing the PIN asks for the current PIN first.
class AppLockSection extends ConsumerWidget {
  const AppLockSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final lock = ref.watch(appLockProvider).value;
    if (lock == null) return const SizedBox.shrink();
    final ctrl = ref.read(appLockProvider.notifier);

    Future<void> turnOn() async {
      final pin = await _newPin(context);
      if (pin == null) return;
      final biometric = await ctrl.biometricsAvailable() && await ctrl.authenticateBiometric(l10n.lockReason);
      await ctrl.enable(pin, biometric: biometric);
      if (context.mounted) PulseToast.show(context, l10n.appLockOn, kind: ToastKind.success);
    }

    Future<void> turnOff() async {
      if (await _confirmPin(context, ref)) await ctrl.disable();
    }

    Future<void> changePin() async {
      if (!await _confirmPin(context, ref) || !context.mounted) return;
      final pin = await _newPin(context);
      if (pin != null) await ctrl.enable(pin, biometric: lock.biometric);
    }

    Future<void> toggleBiometric(bool on) async {
      if (on && !await ctrl.authenticateBiometric(l10n.lockReason)) return;
      await ctrl.setBiometric(on);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: l10n.appLockTitle),
        GlassCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SwitchListTile(
                value: lock.enabled,
                onChanged: (on) => on ? turnOn() : turnOff(),
                title: Text(l10n.appLockTitle),
                subtitle: Text(l10n.appLockBody),
              ),
              if (lock.enabled) ...[
                FutureBuilder<bool>(
                  future: ctrl.biometricsAvailable(),
                  builder: (context, snap) => snap.data ?? false
                      ? SwitchListTile(
                          value: lock.biometric,
                          onChanged: toggleBiometric,
                          secondary: const Icon(Icons.fingerprint_rounded),
                          title: Text(l10n.appLockBiometric),
                        )
                      : const SizedBox.shrink(),
                ),
                ListTile(
                  leading: const Icon(Icons.pin_outlined),
                  title: Text(l10n.appLockChangePin),
                  onTap: changePin,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  /// Asks for a new PIN twice; null if cancelled.
  static Future<String?> _newPin(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    String? first;
    return showAdaptiveSheet<String>(
      context: context,
      title: l10n.appLockTitle,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => PinPad(
          key: ValueKey(first == null),
          prompt: first == null ? l10n.pinCreate : l10n.pinConfirm,
          onComplete: (pin) async {
            if (first == null) {
              setState(() => first = pin);
              return null;
            }
            if (pin == first) {
              Navigator.pop(ctx, pin);
              return null;
            }
            setState(() => first = null);
            return l10n.pinMismatch;
          },
        ),
      ),
    );
  }

  /// Asks for the current PIN; true once it's right.
  static Future<bool> _confirmPin(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final ok = await showAdaptiveSheet<bool>(
      context: context,
      title: l10n.appLockTitle,
      builder: (ctx) => PinPad(
        prompt: l10n.pinCurrent,
        onComplete: (pin) async {
          final r = await ref.read(appLockProvider.notifier).checkPin(pin);
          if (r.ok) {
            if (ctx.mounted) Navigator.pop(ctx, true);
            return null;
          }
          return r.wait == null ? l10n.lockWrongPin : l10n.lockTooMany(r.wait!.inSeconds + 1);
        },
      ),
    );
    return ok ?? false;
  }
}
