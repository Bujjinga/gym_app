import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/design_system/widgets/tab_page.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../core/utils/cardio_calculations.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../home/application/home_providers.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/cardio_tracker.dart';
import 'activity_labels.dart';
import 'manual_cardio_sheet.dart';

/// Activity tab: today's steps, start a tracked walk/run (phones), log an
/// activity manually (all platforms) and the history of walks and runs.
class ActivityScreen extends ConsumerStatefulWidget {
  const ActivityScreen({super.key});

  @override
  ConsumerState<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
  CardioType _type = CardioType.run;
  bool _indoor = false;

  Future<void> _start() async {
    final l10n = AppLocalizations.of(context);
    final unit = ref.read(userProfileProvider).value?.distanceUnit ?? DistanceUnit.km;
    final ok = await ref.read(cardioTrackerProvider.notifier).start(
          _type,
          indoor: _indoor,
          notificationTitle: l10n.trackingNotificationTitle,
          notificationText: l10n.trackingNotificationBody,
          phrase: (units, pace) =>
              l10n.ttsSplit(units, unit == DistanceUnit.km ? l10n.unitKm : l10n.unitMi, pace.inMinutes, pace.inSeconds % 60),
        );
    if (!mounted) return;
    if (ok) {
      Haptics.success();
      const LiveTrackingRoute().push<void>(context);
    } else {
      await showAdaptiveSheet<void>(
        context: context,
        title: l10n.locationNeededTitle,
        builder: (_) => Text(l10n.locationNeededBody),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final caps = ref.watch(platformCapabilitiesProvider);
    final tracking = ref.watch(cardioTrackerProvider);
    final today = ref.watch(todayActivityProvider).value;
    final unit = ref.watch(userProfileProvider).value?.distanceUnit ?? DistanceUnit.km;
    final history = ref.watch(cardioHistoryProvider).value ?? const [];

    return Scaffold(
      body: TabPage(
        title: l10n.tabActivity,
        children: [
          StatTile(icon: Icons.directions_walk_rounded, label: l10n.todaySteps, value: today?.steps ?? 0, accent: c.ringSteps.first),
          if (caps.hasGpsTracking) ...[
            SectionHeader(title: l10n.trackActivity),
            if (tracking != null)
              GlassCard(
                onTap: () => const LiveTrackingRoute().push<void>(context),
                semanticLabel: l10n.resume,
                child: Row(children: [
                  Icon(cardioTypeIcon(tracking.type), color: c.accentText, size: 32),
                  const SizedBox(width: PulseMetrics.space16),
                  Expanded(child: Text(Fmt.distance(tracking.distanceM, unit), style: text.titleMedium)),
                  Text(l10n.resume, style: text.labelLarge?.copyWith(color: c.accentText)),
                ]),
              )
            else
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilterChipRow<CardioType>(
                      options: const [CardioType.walk, CardioType.run, CardioType.hike, CardioType.cycle],
                      selected: {_type},
                      labelOf: (t) => cardioTypeLabel(l10n, t),
                      onChanged: (s) => setState(() {
                        _type = s.first;
                        if (_type == CardioType.cycle || _type == CardioType.hike) _indoor = false;
                      }),
                    ),
                    if (_type == CardioType.walk || _type == CardioType.run)
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.indoor),
                        subtitle: Text(l10n.cardioTreadmill),
                        value: _indoor,
                        onChanged: (v) => setState(() => _indoor = v),
                      ),
                    const SizedBox(height: PulseMetrics.space8),
                    StartWorkoutButton(label: l10n.trackActivity, onPressed: _start),
                  ],
                ),
              ),
          ],
          const SizedBox(height: PulseMetrics.space16),
          Align(
            alignment: Alignment.centerLeft,
            child: SecondaryButton(label: l10n.logCardio, icon: Icons.add_rounded, onPressed: () => showManualCardioSheet(context)),
          ),
          SectionHeader(title: l10n.activityHistory),
          if (history.isEmpty)
            Text(caps.hasGpsTracking ? l10n.activityEmptyBody : l10n.activityEmptyBodyDesktop, style: text.bodyMedium)
          else
            for (final (i, s) in history.indexed)
              StaggeredEntry(
                index: i,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: c.accentEnd.withValues(alpha: 0.15),
                    child: Icon(cardioTypeIcon(s.type), color: c.accentEnd),
                  ),
                  title: Text('${cardioTypeLabel(l10n, s.type)} · ${Fmt.distance(s.distanceM, unit)}'),
                  subtitle: Text(
                    '${DateFormat.MMMEd().add_jm().format(s.startedAt.toLocal())} · '
                    '${Fmt.clock(Duration(seconds: s.durationSec))} · '
                    '${Cardio.formatPace(Cardio.paceSecondsPerUnit(s.distanceM, s.durationSec, unit))} /${unit.name}',
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => CardioDetailRoute(id: s.id).push<void>(context),
                ),
              ),
        ],
      ),
    );
  }
}
