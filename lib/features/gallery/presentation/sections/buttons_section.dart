import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Buttons, chips, sheets and toasts.
class ButtonsSection extends StatefulWidget {
  const ButtonsSection({super.key});

  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  bool _loading = false;
  Set<String> _single = {'Week'};
  Set<String> _multi = {'Chest', 'Back'};

  @override
  Widget build(BuildContext context) {
    return GallerySection(
      title: 'Buttons, chips, sheets & toasts',
      note: 'Press-scale + light haptic on every button; hover lift with a mouse.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: PulseMetrics.space12,
            runSpacing: PulseMetrics.space12,
            children: [
              PrimaryButton(label: 'Primary', icon: Icons.bolt_rounded, onPressed: () {}),
              PrimaryButton(
                label: _loading ? 'Saving' : 'Tap to load',
                loading: _loading,
                onPressed: () async {
                  setState(() => _loading = true);
                  await Future<void>.delayed(const Duration(seconds: 2));
                  if (mounted) setState(() => _loading = false);
                },
              ),
              const PrimaryButton(label: 'Disabled', onPressed: null),
              SecondaryButton(label: 'Secondary', icon: Icons.tune_rounded, onPressed: () {}),
            ],
          ),
          const SizedBox(height: PulseMetrics.space16),
          FilterChipRow<String>(
            options: const ['Week', 'Month', '3 months', 'Year'],
            selected: _single,
            labelOf: (s) => s,
            onChanged: (s) => setState(() => _single = s),
          ),
          FilterChipRow<String>(
            multiSelect: true,
            options: const ['Chest', 'Back', 'Legs', 'Shoulders', 'Arms', 'Core'],
            selected: _multi,
            labelOf: (s) => s,
            onChanged: (s) => setState(() => _multi = s),
          ),
          const SizedBox(height: PulseMetrics.space16),
          Wrap(
            spacing: PulseMetrics.space12,
            runSpacing: PulseMetrics.space12,
            children: [
              SecondaryButton(
                label: 'Adaptive sheet',
                icon: Icons.open_in_new_rounded,
                onPressed: () => showAdaptiveSheet<void>(
                  context: context,
                  title: 'Plate calculator',
                  builder: (_) => const Text(
                    'Bottom sheet on phones, centered dialog on tablets and desktop. '
                    'Resize the window to see it switch.',
                  ),
                ),
              ),
              for (final kind in ToastKind.values)
                SecondaryButton(
                  label: 'Toast: ${kind.name}',
                  onPressed: () => PulseToast.show(context, 'This is a ${kind.name} toast', kind: kind),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
