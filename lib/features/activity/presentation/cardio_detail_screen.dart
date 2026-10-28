import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/cardio_calculations.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/geo.dart';
import '../../../core/utils/unit_conversion.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/activity_providers.dart';
import 'activity_labels.dart';
import 'widgets/route_map.dart';

/// A finished walk/run/ride: route map with replay, stats and splits.
/// Works on every platform (desktop shows routes synced from the phone).
class CardioDetailScreen extends ConsumerStatefulWidget {
  const CardioDetailScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<CardioDetailScreen> createState() => _CardioDetailScreenState();
}

class _CardioDetailScreenState extends ConsumerState<CardioDetailScreen> with SingleTickerProviderStateMixin {
  late final _replay = AnimationController(vsync: this, duration: const Duration(seconds: 8));

  @override
  void dispose() {
    _replay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final text = Theme.of(context).textTheme;
    final c = context.colors;
    final session = ref.watch(cardioByIdProvider(widget.id)).value;
    final points = ref.watch(cardioRouteProvider(widget.id)).value ?? const [];
    if (session == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final unit = ref.watch(userProfileProvider).value?.distanceUnit ?? DistanceUnit.km;
    final route = [for (final p in points) LatLng(p.latitude, p.longitude)];
    final splits = Geo.splits(
      [for (final p in points) (lat: p.latitude, lon: p.longitude, time: p.recordedAt)],
      Units.metersPerUnit(unit),
    );
    final pace = Cardio.paceSecondsPerUnit(session.distanceM, session.durationSec, unit);

    return Scaffold(
      appBar: AppBar(title: Text('${cardioTypeLabel(l10n, session.type)} · ${DateFormat.MMMEd().format(session.startedAt.toLocal())}')),
      body: ListView(
        padding: const EdgeInsets.all(PulseMetrics.space16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(context.metrics.radiusLg),
            child: SizedBox(
              height: 320,
              child: route.length < 2
                  ? EmptyState(icon: Icons.map_outlined, title: l10n.distance, message: l10n.noRoute)
                  : AnimatedBuilder(
                      animation: _replay,
                      builder: (context, _) {
                        final head = _replay.isAnimating || _replay.value > 0
                            ? route[((route.length - 1) * _replay.value).round()]
                            : null;
                        final shown = head == null ? route : route.sublist(0, ((route.length - 1) * _replay.value).round() + 1);
                        return RouteMap(route: shown.length < 2 ? route : shown, marker: head);
                      },
                    ),
            ),
          ),
          if (route.length >= 2 && !context.reduceMotion) ...[
            const SizedBox(height: PulseMetrics.space12),
            Align(
              alignment: Alignment.centerLeft,
              child: SecondaryButton(
                label: l10n.replayRoute,
                icon: Icons.replay_rounded,
                onPressed: () => _replay.forward(from: 0),
              ),
            ),
          ],
          const SizedBox(height: PulseMetrics.space16),
          LayoutBuilder(builder: (context, box) {
            final w = (box.maxWidth - PulseMetrics.space12) / 2;
            return Wrap(
              spacing: PulseMetrics.space12,
              runSpacing: PulseMetrics.space12,
              children: [
                SizedBox(
                  width: w,
                  child: StatTile(icon: Icons.route_rounded, label: l10n.distance, value: Units.distanceFromMeters(session.distanceM, unit), fractionDigits: 2, unit: unit.name),
                ),
                SizedBox(width: w, child: StatTile(icon: Icons.timer_rounded, label: l10n.time, value: session.durationSec ~/ 60, unit: l10n.minUnit)),
                SizedBox(
                  width: w,
                  child: GlassCard(
                    semanticLabel: '${l10n.pace}: ${Cardio.formatPace(pace)}',
                    child: ExcludeSemantics(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        // Same header as StatTile; pace is mm:ss so it can't use StatTile's number.
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(color: c.accentStart.withValues(alpha: 0.16), shape: BoxShape.circle),
                            child: Icon(Icons.speed_rounded, size: 16, color: c.accentStart),
                          ),
                          const SizedBox(width: PulseMetrics.space8),
                          Expanded(
                              child: Text('${l10n.pace} /${unit.name}', style: text.labelMedium, overflow: TextOverflow.ellipsis)),
                        ]),
                        const SizedBox(height: PulseMetrics.space12),
                        Text(Cardio.formatPace(pace), style: text.headlineMedium),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: w,
                  child: StatTile(icon: Icons.local_fire_department_rounded, label: l10n.calories, value: (session.caloriesKcal ?? 0).round(), unit: l10n.kcalUnit),
                ),
                if (session.elevationGainM != null)
                  SizedBox(width: w, child: StatTile(icon: Icons.terrain_rounded, label: l10n.elevation, value: session.elevationGainM!.round(), unit: 'm')),
                if (session.steps != null)
                  SizedBox(width: w, child: StatTile(icon: Icons.directions_walk_rounded, label: l10n.statSteps, value: session.steps!)),
              ],
            );
          }),
          if (splits.isNotEmpty) ...[
            SectionHeader(title: l10n.splits),
            for (final (i, d) in splits.indexed)
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.splitLabel(unit.name, i + 1)),
                trailing: Text(Fmt.clock(d), style: PulseTypography.number(fontSize: 16, color: context.colors.textPrimary)),
              ),
          ],
        ],
      ),
    );
  }
}
