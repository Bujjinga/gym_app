import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design_system/design_system.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../application/app_lock_controller.dart';

/// Covers the app with a frosted lock screen while [appLockProvider] is locked.
class AppLockGate extends ConsumerWidget {
  const AppLockGate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locked = ref.watch(appLockProvider).value?.locked ?? false;
    return Stack(
      fit: StackFit.expand,
      children: [
        // Keeps the app out of the accessibility tree while locked.
        ExcludeSemantics(excluding: locked, child: child),
        if (locked) const _LockScreen(),
      ],
    );
  }
}

class _LockScreen extends ConsumerStatefulWidget {
  const _LockScreen();

  @override
  ConsumerState<_LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<_LockScreen> {
  @override
  void initState() {
    super.initState();
    // Offer Face ID / fingerprint straight away.
    WidgetsBinding.instance.addPostFrameCallback((_) => _biometric());
  }

  Future<void> _biometric() async {
    if (!mounted || !(ref.read(appLockProvider).value?.biometric ?? false)) return;
    await ref.read(appLockProvider.notifier).unlockWithBiometric(AppLocalizations.of(context).lockReason);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final biometric = ref.watch(appLockProvider).value?.biometric ?? false;
    return Material(
      type: MaterialType.transparency,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: ColoredBox(
          color: context.colors.background.withValues(alpha: 0.72),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(PulseMetrics.space24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const PulseLogo(width: 72),
                    const SizedBox(height: PulseMetrics.space16),
                    Text(l10n.lockTitle, style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: PulseMetrics.space24),
                    PinPad(
                      prompt: l10n.lockEnterPin,
                      onBiometric: biometric ? _biometric : null,
                      onComplete: (pin) async {
                        final r = await ref.read(appLockProvider.notifier).unlockWithPin(pin);
                        if (r.ok) return null;
                        return r.wait == null ? l10n.lockWrongPin : l10n.lockTooMany(r.wait!.inSeconds + 1);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Four-digit PIN entry: dots, a keypad (and the hardware keyboard) and an
/// optional biometric key. [onComplete] returns an error to show, or null.
class PinPad extends StatefulWidget {
  const PinPad({super.key, required this.prompt, required this.onComplete, this.onBiometric});

  static const length = 4;

  final String prompt;
  final Future<String?> Function(String pin) onComplete;
  final VoidCallback? onBiometric;

  @override
  State<PinPad> createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> with SingleTickerProviderStateMixin {
  late final _shake = AnimationController(vsync: this, duration: const Duration(milliseconds: 420));
  final _focus = FocusNode();
  var _pin = '';
  String? _error;
  var _busy = false;

  @override
  void dispose() {
    _shake.dispose();
    _focus.dispose();
    super.dispose();
  }

  Future<void> _digit(String d) async {
    if (_busy || _pin.length >= PinPad.length) return;
    Haptics.selection();
    setState(() {
      _pin += d;
      _error = null;
    });
    if (_pin.length < PinPad.length) return;
    _busy = true;
    final error = await widget.onComplete(_pin);
    _busy = false;
    if (!mounted) return;
    setState(() {
      _pin = '';
      _error = error;
    });
    if (error != null) {
      Haptics.warning();
      unawaited(_shake.forward(from: 0));
    }
  }

  void _delete() {
    if (_pin.isNotEmpty && !_busy) setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  KeyEventResult _onKey(FocusNode _, KeyEvent e) {
    if (e is! KeyDownEvent) return KeyEventResult.ignored;
    final ch = e.character;
    if (ch != null && RegExp(r'^[0-9]$').hasMatch(ch)) {
      _digit(ch);
      return KeyEventResult.handled;
    }
    if (e.logicalKey == LogicalKeyboardKey.backspace) {
      _delete();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;

    Widget key(String label, {VoidCallback? onTap, Widget? child}) => Padding(
          padding: const EdgeInsets.all(PulseMetrics.space8),
          child: Semantics(
            button: true,
            label: label,
            excludeSemantics: true,
            child: Material(
              color: c.surface.withValues(alpha: 0.7),
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                child: SizedBox.square(
                  dimension: 72,
                  child: Center(child: child ?? Text(label, style: PulseTypography.number(fontSize: 28, color: c.textPrimary))),
                ),
              ),
            ),
          ),
        );

    return Focus(
      focusNode: _focus,
      autofocus: true,
      onKeyEvent: _onKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.prompt, style: text.titleMedium, textAlign: TextAlign.center),
          const SizedBox(height: PulseMetrics.space16),
          AnimatedBuilder(
            animation: _shake,
            builder: (context, child) => Transform.translate(
              offset: Offset(math.sin(_shake.value * math.pi * 6) * 10 * (1 - _shake.value), 0),
              child: child,
            ),
            child: Semantics(
              label: l10n.pinProgress(_pin.length, PinPad.length),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < PinPad.length; i++)
                    AnimatedContainer(
                      duration: context.motion.fast,
                      margin: const EdgeInsets.symmetric(horizontal: PulseMetrics.space8),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i < _pin.length ? c.accentText : Colors.transparent,
                        border: Border.all(color: _error != null ? c.error : c.textSecondary, width: 2),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: _error == null
                  ? null
                  : Semantics(
                      liveRegion: true,
                      child: Text(_error!, style: text.bodyMedium?.copyWith(color: c.error), textAlign: TextAlign.center),
                    ),
            ),
          ),
          for (final row in const [
            ['1', '2', '3'],
            ['4', '5', '6'],
            ['7', '8', '9'],
          ])
            Row(mainAxisSize: MainAxisSize.min, children: [for (final d in row) key(d, onTap: () => _digit(d))]),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.onBiometric == null)
                const SizedBox.square(dimension: 88)
              else
                key(l10n.lockUseBiometric,
                    onTap: widget.onBiometric, child: Icon(Icons.fingerprint_rounded, size: 32, color: c.accentText)),
              key('0', onTap: () => _digit('0')),
              key(l10n.keypadDelete, onTap: _delete, child: Icon(Icons.backspace_outlined, color: c.textPrimary)),
            ],
          ),
        ],
      ),
    );
  }
}
