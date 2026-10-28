import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Heart-rate pulse with a BPM slider standing in for live Health data.
class HeartRateSection extends StatefulWidget {
  const HeartRateSection({super.key});

  @override
  State<HeartRateSection> createState() => _HeartRateSectionState();
}

class _HeartRateSectionState extends State<HeartRateSection> {
  double _bpm = 128;
  bool _live = true;

  @override
  Widget build(BuildContext context) {
    final bpm = _live ? _bpm.round() : null;
    return GallerySection(
      title: 'Live heart rate',
      note: 'Waveform and heart beat at the actual BPM; tint follows the HR zone (max HR 190).',
      child: Column(
        children: [
          HeartRatePulse(
            bpm: bpm,
            maxHeartRate: 190,
            zoneLabel: (z) => 'Zone $z',
            semanticLabel: bpm == null ? 'No live heart rate' : 'Heart rate $bpm beats per minute',
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _bpm,
                  min: 50,
                  max: 195,
                  label: '${_bpm.round()} BPM',
                  onChanged: _live ? (v) => setState(() => _bpm = v) : null,
                ),
              ),
              const Text('Live'),
              Switch(value: _live, onChanged: (v) => setState(() => _live = v)),
            ],
          ),
        ],
      ),
    );
  }
}
