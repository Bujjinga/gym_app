import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Micro-interactions: checkmark draw-on, swipe-to-complete sets, step
/// progress bar and empty/error states.
class MicroSection extends StatefulWidget {
  const MicroSection({super.key});

  @override
  State<MicroSection> createState() => _MicroSectionState();
}

class _MicroSectionState extends State<MicroSection> {
  final _done = [false, false, false];
  int _step = 1;
  bool _error = false;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    return GallerySection(
      title: 'Micro-interactions',
      note: 'Swipe a set right (detent haptics at 25% / 50%), or tap its checkmark.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < _done.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: PulseMetrics.space8),
              child: SwipeToComplete(
                actionLabel: 'Complete set ${i + 1}',
                enabled: !_done[i],
                onCompleted: () => setState(() => _done[i] = true),
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: PulseMetrics.space16),
                  color: c.surfaceRaised,
                  child: Row(
                    children: [
                      Text('Set ${i + 1}', style: text.titleSmall),
                      const SizedBox(width: PulseMetrics.space16),
                      Text('60 kg × 8', style: PulseTypography.number(fontSize: 18, color: c.textPrimary)),
                      const Spacer(),
                      Semantics(
                        button: true,
                        checked: _done[i],
                        label: 'Set ${i + 1} complete',
                        child: GestureDetector(
                          onTap: () => setState(() => _done[i] = !_done[i]),
                          child: AnimatedCheckmark(checked: _done[i]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: PulseMetrics.space16),
          StepProgressBar(step: _step, count: 5, semanticLabel: 'Step ${_step + 1} of 5'),
          const SizedBox(height: PulseMetrics.space8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                tooltip: 'Back',
                onPressed: _step > 0 ? () => setState(() => _step--) : null,
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              IconButton(
                tooltip: 'Next',
                onPressed: _step < 4 ? () => setState(() => _step++) : null,
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          const Divider(),
          EmptyState(
            key: ValueKey(_error),
            icon: _error ? Icons.cloud_off_rounded : Icons.inbox_rounded,
            title: _error ? 'Sync failed' : 'No workouts yet',
            message: _error
                ? "We'll retry when you're back online. Your data is safe on this device."
                : 'Start your first session and it will show up here.',
            isError: _error,
            actionLabel: _error ? 'Show empty state' : 'Show error state',
            onAction: () => setState(() => _error = !_error),
          ),
        ],
      ),
    );
  }
}
