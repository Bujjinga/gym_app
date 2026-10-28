import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/router.dart';
import '../../../core/design_system/design_system.dart';
import '../../../core/design_system/widgets/tab_page.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/nutrition_targets.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../achievements/domain/achievement_catalog.dart';
import '../../health/data/health_sync_service.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../application/progress_providers.dart';
import 'achievements_screen.dart';
import 'water_screen.dart';

/// Progress tab hub: health metrics, body, water, nutrition and photos.
class ProgressScreen extends ConsumerStatefulWidget {
  const ProgressScreen({super.key});

  @override
  ConsumerState<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends ConsumerState<ProgressScreen> {
  int? _liveHr;
  bool _syncing = false;

  Future<void> _sync() async {
    setState(() => _syncing = true);
    final health = ref.read(healthSyncProvider);
    await health.syncRecentDays();
    final hr = await health.latestHeartRate();
    if (mounted) setState(() => (_syncing = false, _liveHr = hr));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final mobile = ref.watch(platformCapabilitiesProvider).hasHealthData;
    final p = ref.watch(userProfileProvider).value;
    final health = ref.watch(latestHealthDayProvider).value;
    final weight = ref.watch(measurementsProvider(MeasurementType.weight)).value?.lastOrNull;
    final water = (ref.watch(waterTodayProvider).value ?? const []).fold(0, (a, w) => a + w.amountMl);
    final kcal = (ref.watch(mealsTodayProvider).value ?? const []).fold(0, (a, m) => a + m.calories);
    final photos = ref.watch(progressPhotosProvider).value?.length ?? 0;
    final target = macroTargets(
      weightKg: p?.weightKg,
      heightCm: p?.heightCm,
      age: p?.ageOn(DateTime.now()),
      sex: p?.sex,
      trainingDaysPerWeek: p?.trainingDaysPerWeek,
      goal: p?.goal,
    ).kcal;

    Widget tile(IconData icon, String title, String value, VoidCallback onTap, {Widget? leading}) => Padding(
          padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
          child: GlassCard(
            onTap: onTap,
            semanticLabel: '$title, $value',
            child: Row(children: [
              leading ?? Icon(icon, color: c.accentText, size: 28),
              const SizedBox(width: PulseMetrics.space16),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: text.labelMedium),
                  Text(value, style: text.titleMedium),
                ]),
              ),
              const Icon(Icons.chevron_right_rounded),
            ]),
          ),
        );

    final sleep = health?.sleepMinutes;
    return Scaffold(
      body: TabPage(
        title: l10n.tabProgress,
        children: [
          const LevelCard(),
          SectionHeader(title: l10n.analytics),
          tile(Icons.insights_rounded, l10n.analytics, l10n.chartVolume, () => const AnalyticsRoute().push<void>(context)),
          tile(Icons.emoji_events_rounded, l10n.recordsBoard, l10n.personalRecords, () => const RecordsRoute().push<void>(context)),
          tile(Icons.military_tech_rounded, l10n.achievementsTitle, l10n.levelLabel(levelForXp(p?.xp ?? 0)), () => const AchievementsRoute().push<void>(context)),
          tile(Icons.auto_stories_rounded, l10n.monthlyRecap, l10n.recapTitle(DateFormat.MMMM().format(DateTime.now())),
              () => const MonthlyRecapRoute().push<void>(context)),
          SectionHeader(
            title: l10n.health,
            actionLabel: mobile ? l10n.syncHealth : null,
            onAction: mobile && !_syncing ? _sync : null,
          ),
          if (_liveHr != null)
            Padding(
              padding: const EdgeInsets.only(bottom: PulseMetrics.space12),
              child: HeartRatePulse(
                bpm: _liveHr,
                maxHeartRate: 208 - (0.7 * (p?.ageOn(DateTime.now()) ?? 35)).round(),
                zoneLabel: (z) => 'Zone $z',
                semanticLabel: '${l10n.latestHeartRate}: $_liveHr',
              ),
            ),
          if (health == null)
            Text(mobile ? l10n.healthUnavailable : l10n.healthDesktop, style: text.bodyMedium)
          else
            Row(children: [
              Expanded(child: StatTile(icon: Icons.favorite_rounded, label: l10n.restingHr, value: health.restingHeartRate ?? 0, unit: 'bpm', accent: c.zones[1])),
              const SizedBox(width: PulseMetrics.space12),
              Expanded(child: StatTile(icon: Icons.monitor_heart_rounded, label: l10n.hrv, value: (health.hrvMs ?? 0).round(), unit: 'ms', accent: c.accentEnd)),
              const SizedBox(width: PulseMetrics.space12),
              Expanded(
                child: StatTile(icon: Icons.bedtime_rounded, label: l10n.sleep, value: (sleep ?? 0) / 60, fractionDigits: 1, unit: 'h', accent: c.ringSteps.last),
              ),
            ]),
          SectionHeader(title: l10n.bodyAndWeight),
          tile(Icons.monitor_weight_rounded, l10n.measureWeight,
              weight == null ? l10n.noEntries : Fmt.weight(weight.value, p?.weightUnit ?? WeightUnit.kg), () => const BodyRoute().push<void>(context)),
          tile(Icons.water_drop_rounded, l10n.water, l10n.waterProgress(water, p?.waterGoalMl ?? 2500), () => const WaterRoute().push<void>(context),
              leading: WaterGlass(progress: water / (p?.waterGoalMl ?? 2500), size: 40)),
          tile(Icons.restaurant_rounded, l10n.nutrition, l10n.ofTarget('$kcal', '$target ${l10n.kcalUnit}'), () => const NutritionRoute().push<void>(context)),
          tile(Icons.photo_library_rounded, l10n.progressPhotos, '$photos', () => const PhotosRoute().push<void>(context)),
        ],
      ),
    );
  }
}
