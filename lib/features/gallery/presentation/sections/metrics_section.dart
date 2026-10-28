import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/design_system/design_system.dart';
import 'gallery_section.dart';

/// Stat tiles and odometer-style rolling numbers.
class MetricsSection extends StatefulWidget {
  const MetricsSection({super.key});

  @override
  State<MetricsSection> createState() => _MetricsSectionState();
}

class _MetricsSectionState extends State<MetricsSection> {
  final _random = math.Random();
  int _steps = 8432;
  int _calories = 512;
  double _volume = 12450.5;
  double _distance = 6.2;

  void _shuffle() => setState(() {
        _steps = 2000 + _random.nextInt(14000);
        _calories = 100 + _random.nextInt(900);
        _volume = 5000 + _random.nextDouble() * 20000;
        _distance = _random.nextDouble() * 15;
      });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return GallerySection(
      title: 'Stat tiles & rolling numbers',
      note: 'Digits roll individually and use tabular figures, so nothing jitters.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: RollingNumber(value: _steps, style: Theme.of(context).textTheme.displayMedium)),
          const SizedBox(height: PulseMetrics.space16),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth > 560 ? 4 : 2;
              final width = (constraints.maxWidth - PulseMetrics.space12 * (columns - 1)) / columns;
              return Wrap(
                spacing: PulseMetrics.space12,
                runSpacing: PulseMetrics.space12,
                children: [
                  SizedBox(
                    width: width,
                    child: StatTile(icon: Icons.directions_walk_rounded, label: 'Steps', value: _steps, delta: '+12%'),
                  ),
                  SizedBox(
                    width: width,
                    child: StatTile(
                      icon: Icons.local_fire_department_rounded,
                      label: 'Active',
                      value: _calories,
                      unit: 'kcal',
                      accent: c.ringMove.first,
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: StatTile(
                      icon: Icons.fitness_center_rounded,
                      label: 'Volume',
                      value: _volume,
                      unit: 'kg',
                      fractionDigits: 1,
                      delta: '-3%',
                      accent: c.accentEnd,
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: StatTile(
                      icon: Icons.route_rounded,
                      label: 'Distance',
                      value: _distance,
                      unit: 'km',
                      fractionDigits: 2,
                      accent: c.ringSteps.last,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: PulseMetrics.space16),
          Align(child: SecondaryButton(label: 'Shuffle values', icon: Icons.casino_rounded, onPressed: _shuffle)),
        ],
      ),
    );
  }
}
