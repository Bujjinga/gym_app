import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/cardio_calculations.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/cardio_tracker.dart';
import 'widgets/route_map.dart';

/// Live walk/run/ride: map with the route drawn as you move (outdoor) or a
/// step count (indoor), stats and pause/resume/finish controls.
class LiveTrackingScreen extends ConsumerStatefulWidget {
  const LiveTrackingScreen({super.key});

  @override
  ConsumerState<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends ConsumerState<LiveTrackingScreen> {
  final _map = MapController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final s = ref.watch(cardioTrackerProvider);
    final tracker = ref.read(cardioTrackerProvider.notifier);
    final unit = ref.watch(userProfileProvider).value?.distanceUnit ?? DistanceUnit.km;

    // Keep the camera on the runner.
    ref.listen(cardioTrackerProvider, (prev, next) {
      final last = next?.route.lastOrNull;
      if (last != null && last != prev?.route.lastOrNull && !(next?.indoor ?? true)) {
        _map.move(last, _map.camera.zoom);
      }
    });
    if (s == null) return Scaffold(appBar: AppBar());

    final pace = Cardio.paceSecondsPerUnit(s.distanceM, s.movingSeconds, unit);
    final statusLabel = switch (s.status) {
      TrackingStatus.running => null,
      TrackingStatus.paused => l10n.paused,
      TrackingStatus.autoPaused => l10n.autoPaused,
    };
    final running = s.status == TrackingStatus.running;
    Widget stat(String label, String value) => Expanded(
          child: Column(
            children: [
              Text(value, style: PulseTypography.number(fontSize: 26, color: c.textPrimary)),
              Text(label, style: text.labelSmall),
            ],
          ),
        );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: s.indoor
                ? MeshGradientBackground(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RollingNumber(value: s.steps, style: PulseTypography.number(fontSize: 72, color: c.textPrimary)),
                          Text(l10n.stepsUnit, style: text.titleMedium),
                        ],
                      ),
                    ),
                  )
                : RouteMap(route: s.route, marker: s.route.lastOrNull, follow: true, controller: _map),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedSwitcher(
                duration: context.motion.medium,
                child: statusLabel == null
                    ? const SizedBox.shrink()
                    : Container(
                        key: ValueKey(statusLabel),
                        margin: const EdgeInsets.only(top: PulseMetrics.space12),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(color: c.warning, borderRadius: BorderRadius.circular(999)),
                        child: Semantics(
                          liveRegion: true,
                          child: Text(statusLabel, style: text.labelLarge?.copyWith(color: c.onAccent)),
                        ),
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(PulseMetrics.space12),
                child: GlassCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(children: [
                        stat(l10n.time, Fmt.clock(Duration(seconds: s.movingSeconds))),
                        stat(l10n.distance, Fmt.distance(s.distanceM, unit)),
                      ]),
                      const SizedBox(height: PulseMetrics.space12),
                      Row(children: [
                        stat('${l10n.pace} /${unit.name}', Cardio.formatPace(pace)),
                        if (!s.indoor) stat(l10n.elevation, '${s.elevationGainM.round()} m'),
                      ]),
                      const SizedBox(height: PulseMetrics.space16),
                      Row(
                        children: [
                          IconButton(
                            tooltip: l10n.audioCues,
                            isSelected: s.audioCues,
                            icon: const Icon(Icons.volume_off_rounded),
                            selectedIcon: const Icon(Icons.volume_up_rounded),
                            onPressed: () => tracker.setAudioCues(!s.audioCues),
                          ),
                          const Spacer(),
                          SecondaryButton(
                            label: running ? l10n.pause : l10n.resume,
                            icon: running ? Icons.pause_rounded : Icons.play_arrow_rounded,
                            onPressed: running ? tracker.pause : tracker.resume,
                          ),
                          const SizedBox(width: PulseMetrics.space12),
                          PrimaryButton(
                            label: l10n.finish,
                            icon: Icons.stop_rounded,
                            onPressed: () async {
                              Haptics.success();
                              final id = await tracker.finish();
                              if (id != null && context.mounted) CardioDetailRoute(id: id).pushReplacement(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
