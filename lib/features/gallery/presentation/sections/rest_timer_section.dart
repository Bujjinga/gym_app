import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Rest timer: countdown ring, haptic ticks in the last 3 s, morph to GO.
class RestTimerSection extends StatefulWidget {
  const RestTimerSection({super.key});

  @override
  State<RestTimerSection> createState() => _RestTimerSectionState();
}

class _RestTimerSectionState extends State<RestTimerSection> {
  Duration _total = const Duration(seconds: 10);
  late DateTime _endsAt = DateTime.now().add(_total);

  void _start(Duration d) => setState(() {
        _total = d;
        _endsAt = DateTime.now().add(d);
      });

  void _add(Duration d) => setState(() {
        final now = DateTime.now();
        final base = _endsAt.isAfter(now) ? _endsAt : now;
        _endsAt = base.add(d);
        _total = _endsAt.difference(now);
      });

  @override
  Widget build(BuildContext context) {
    return GallerySection(
      title: 'Rest timer',
      note: 'Wall-clock based, so it stays correct when the app is backgrounded.',
      child: Column(
        children: [
          RestTimer(
            endsAt: _endsAt,
            total: _total,
            goLabel: 'GO',
            semanticLabel: (r) => 'Rest, ${r.inSeconds} seconds remaining',
            onFinished: () {},
          ),
          const SizedBox(height: PulseMetrics.space16),
          Wrap(
            spacing: PulseMetrics.space12,
            runSpacing: PulseMetrics.space12,
            alignment: WrapAlignment.center,
            children: [
              PrimaryButton(label: '10 s', icon: Icons.replay_rounded, onPressed: () => _start(const Duration(seconds: 10))),
              SecondaryButton(label: '90 s', onPressed: () => _start(const Duration(seconds: 90))),
              SecondaryButton(label: '+15 s', onPressed: () => _add(const Duration(seconds: 15))),
              SecondaryButton(label: 'Skip', onPressed: () => _start(Duration.zero)),
            ],
          ),
        ],
      ),
    );
  }
}
