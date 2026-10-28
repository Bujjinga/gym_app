import '../../activity/domain/day_activity.dart';
import '../domain/coach_service.dart';

/// On-device coach built from simple, explainable rules.
///
/// Recovery score = weighted average of whatever is available:
/// - sleep (35 %): 8 h or more scores 100
/// - HRV (25 %): today vs. the previous 7 readings; at baseline 75,
///   10 % below 50, 30 % below 0, 10 % above 100
/// - resting HR (20 %): each bpm above the 7-reading baseline costs 10 points
/// - training load (20 %): last 7 days vs. the 4-week weekly average
///   (acute:chronic ratio); fine up to 1.3, zero at 2.0
/// Load alone isn't enough for a score — it needs at least one body signal.
class RuleBasedCoach implements CoachService {
  const RuleBasedCoach();

  @override
  Future<CoachReport> report(CoachInput input) async {
    final today = DateTime(input.now.year, input.now.month, input.now.day);
    final recent = {DayActivity.keyFor(today), DayActivity.keyFor(today.subtract(const Duration(days: 1)))};
    final tips = <CoachTip>[];
    final parts = <(double score, double weight)>[];

    final sleep = input.days.lastWhereOrNull((d) => d.sleepMinutes != null && recent.contains(d.day))?.sleepMinutes;
    if (sleep != null) {
      parts.add(((sleep / 480).clamp(0, 1) * 100, 0.35));
      if (sleep < 420) tips.add(CoachTip.sleepMore);
    }

    final hrv = _vsBaseline(input.days, recent, (d) => d.hrvMs);
    if (hrv != null) {
      final ratio = hrv.latest / hrv.baseline;
      parts.add(((75 + (ratio - 1) * 250).clamp(0, 100).toDouble(), 0.25));
      if (ratio < 0.9) tips.add(CoachTip.hrvLow);
    }

    final rhr = _vsBaseline(input.days, recent, (d) => d.restingHeartRate?.toDouble());
    if (rhr != null) {
      final delta = rhr.latest - rhr.baseline;
      parts.add(((100 - (delta > 0 ? delta : 0) * 10).clamp(0, 100).toDouble(), 0.2));
      if (delta >= 5) tips.add(CoachTip.restingHrHigh);
    }

    final hasBodySignal = parts.isNotEmpty;
    final acwr = _acuteChronic(input.training, today);
    if (acwr != null) {
      parts.add((acwr <= 1.3 ? 100 : ((2 - acwr) / 0.7 * 100).clamp(0, 100).toDouble(), 0.2));
      if (acwr > 1.5) tips.add(CoachTip.loadSpike);
    }
    if (_needsDeload(input.training, today)) tips.add(CoachTip.deload);

    if (!hasBodySignal) return CoachReport(tips: [...tips, CoachTip.connectHealth]);
    final totalWeight = parts.fold(0.0, (s, p) => s + p.$2);
    final score = (parts.fold(0.0, (s, p) => s + p.$1 * p.$2) / totalWeight).round();
    return CoachReport(recoveryScore: score, readiness: readinessFor(score), tips: tips);
  }

  static Readiness readinessFor(int score) => score >= 67
      ? Readiness.ready
      : score >= 40
          ? Readiness.light
          : Readiness.rest;

  /// Latest reading (today or yesterday) against the mean of up to 7 earlier
  /// readings; null with fewer than 3 earlier readings.
  static ({double latest, double baseline})? _vsBaseline(
      List<DayActivity> days, Set<String> recent, double? Function(DayActivity d) read) {
    final values = [for (final d in days) if (read(d) case final v?) (day: d.day, v: v)];
    if (values.isEmpty || !recent.contains(values.last.day)) return null;
    final earlier = values.reversed.skip(1).take(7).map((e) => e.v).toList();
    if (earlier.length < 3) return null;
    return (latest: values.last.v, baseline: earlier.reduce((a, b) => a + b) / earlier.length);
  }

  static Iterable<TrainingLoad> _between(List<TrainingLoad> training, DateTime from, DateTime to) =>
      training.where((t) => !t.startedAt.toLocal().isBefore(from) && t.startedAt.toLocal().isBefore(to));

  /// Last 7 days' minutes over the 28-day weekly average; null until there's
  /// a meaningful history (≥ 30 min/week on average).
  static double? _acuteChronic(List<TrainingLoad> training, DateTime today) {
    final end = today.add(const Duration(days: 1));
    int minutes(int days) =>
        _between(training, end.subtract(Duration(days: days)), end).fold(0, (s, t) => s + t.minutes);
    final chronic = minutes(28) / 4;
    return chronic < 30 ? null : minutes(7) / chronic;
  }

  /// Five straight weeks with 3+ sessions and no lighter week: time to deload.
  static bool _needsDeload(List<TrainingLoad> training, DateTime today) {
    final end = today.add(const Duration(days: 1));
    for (var w = 0; w < 5; w++) {
      final to = end.subtract(Duration(days: 7 * w));
      if (_between(training, to.subtract(const Duration(days: 7)), to).length < 3) return false;
    }
    return true;
  }
}

extension<T> on List<T> {
  T? lastWhereOrNull(bool Function(T e) test) {
    for (var i = length - 1; i >= 0; i--) {
      if (test(this[i])) return this[i];
    }
    return null;
  }
}
