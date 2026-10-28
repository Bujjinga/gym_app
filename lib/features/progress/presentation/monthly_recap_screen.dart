import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/design_system/design_system.dart';
import '../../../core/domain/pulse_enums.dart';
import '../../../core/utils/formatters.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../achievements/data/drift_progress_repository.dart';
import '../../activity/data/drift_activity_repository.dart';
import '../../home/application/home_providers.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../../workout/application/workout_providers.dart';
import 'share_card.dart';

final _monthSteps = StreamProvider.autoDispose<int>((ref) {
  final now = DateTime.now();
  return ref
      .watch(activityRepositoryProvider)
      .watchDays(DateTime(now.year, now.month), now)
      .map((d) => d.fold(0, (a, x) => a + x.steps));
});

final _monthRecords = StreamProvider.autoDispose<int>((ref) {
  final start = DateTime(DateTime.now().year, DateTime.now().month);
  return ref.watch(progressRepositoryProvider).watchRecords().map((r) => r.where((x) => !x.achievedAt.toLocal().isBefore(start)).length);
});

/// This month as story-style slides that auto-advance; tap to skip.
class MonthlyRecapScreen extends ConsumerStatefulWidget {
  const MonthlyRecapScreen({super.key});

  @override
  ConsumerState<MonthlyRecapScreen> createState() => _MonthlyRecapScreenState();
}

class _MonthlyRecapScreenState extends ConsumerState<MonthlyRecapScreen> with SingleTickerProviderStateMixin {
  late final _timer = AnimationController(vsync: this, duration: const Duration(seconds: 4))
    ..addStatusListener((s) {
      if (s == AnimationStatus.completed) _go(_index + 1);
    })
    ..forward();
  int _index = 0;
  int _count = 1;

  void _go(int i) {
    if (i < 0 || i >= _count) return;
    setState(() => _index = i);
    _timer.forward(from: 0);
  }

  @override
  void dispose() {
    _timer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = context.colors;
    final text = Theme.of(context).textTheme;
    final now = DateTime.now();
    final start = DateTime(now.year, now.month);
    final p = ref.watch(userProfileProvider).value;
    final sessions = (ref.watch(workoutHistoryProvider).value ?? const [])
        .where((s) => s.endedAt != null && !s.startedAt.toLocal().isBefore(start))
        .toList();
    final cardio = (ref.watch(cardioHistoryProvider).value ?? const []).where((s) => !s.startedAt.toLocal().isBefore(start));
    final volume = sessions.fold(0.0, (a, s) => a + s.totalVolumeKg);
    final minutes = sessions.fold(0, (a, s) => a + (s.duration?.inMinutes ?? 0)) + cardio.fold(0, (a, s) => a + s.durationSec ~/ 60);
    final distance = cardio.fold(0.0, (a, s) => a + s.distanceM);
    final wUnit = p?.weightUnit ?? WeightUnit.kg;
    final dUnit = p?.distanceUnit ?? DistanceUnit.km;
    final month = DateFormat.MMMM().format(now);

    final slides = <(String, String)>[
      (l10n.recapWorkouts, '${sessions.length}'),
      (l10n.recapVolume, Fmt.weight(volume, wUnit)),
      (l10n.recapTime, '${minutes ~/ 60} h ${minutes % 60} min'),
      (l10n.recapDistance, Fmt.distance(distance, dUnit)),
      (l10n.recapSteps, Fmt.number(ref.watch(_monthSteps).value ?? 0)),
      (l10n.recapRecords, '${ref.watch(_monthRecords).value ?? 0}'),
    ];
    _count = slides.length + 1;
    final empty = sessions.isEmpty && cardio.isEmpty;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MeshGradientBackground(
        child: SafeArea(
          child: GestureDetector(
            onTapUp: (d) => _go(d.localPosition.dx < MediaQuery.sizeOf(context).width / 3 ? _index - 1 : _index + 1),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(PulseMetrics.space12),
                child: Row(children: [
                  for (var i = 0; i < _count; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: AnimatedBuilder(
                          animation: _timer,
                          builder: (context, _) => LinearProgressIndicator(
                            value: i < _index ? 1 : (i == _index ? _timer.value : 0),
                            minHeight: 3,
                            color: c.textPrimary,
                            backgroundColor: c.glassBorder,
                          ),
                        ),
                      ),
                    ),
                  IconButton(tooltip: l10n.close, icon: const Icon(Icons.close_rounded), onPressed: () => Navigator.of(context).pop()),
                ]),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: context.motion.medium,
                  transitionBuilder: (child, a) => FadeTransition(
                    opacity: a,
                    child: context.reduceMotion ? child : ScaleTransition(scale: Tween(begin: 0.92, end: 1.0).animate(a), child: child),
                  ),
                  child: KeyedSubtree(
                    key: ValueKey(_index),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(PulseMetrics.space24),
                        child: empty
                            ? Text(l10n.recapEmpty, style: text.titleLarge, textAlign: TextAlign.center)
                            : _index < slides.length
                                ? Semantics(
                                    liveRegion: true,
                                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                                      Text(l10n.recapTitle(month), style: text.titleMedium),
                                      const SizedBox(height: PulseMetrics.space24),
                                      Text(slides[_index].$1, style: text.headlineSmall),
                                      const SizedBox(height: PulseMetrics.space12),
                                      ShaderMask(
                                        shaderCallback: (r) => c.accentGradient.createShader(r),
                                        child: Text(slides[_index].$2,
                                            style: PulseTypography.number(fontSize: 64, color: Colors.white), textAlign: TextAlign.center),
                                      ),
                                    ]),
                                  )
                                : Column(mainAxisSize: MainAxisSize.min, children: [
                                    ShareCardView(title: l10n.recapTitle(month), stats: slides),
                                    const SizedBox(height: PulseMetrics.space24),
                                    PrimaryButton(
                                      label: l10n.shareCard,
                                      icon: Icons.ios_share_rounded,
                                      onPressed: () {
                                        _timer.stop();
                                        showShareCard(context, ShareCardView(title: l10n.recapTitle(month), stats: slides));
                                      },
                                    ),
                                  ]),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
