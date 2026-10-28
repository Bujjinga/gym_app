import 'dart:math' as math;

/// Totals the achievement rules are evaluated against.
typedef AchievementStats = ({
  int workouts,
  int streak,
  double maxSessionVolumeKg,
  int records,
  int cardioSessions,
  double cardioKm,
  int maxDaySteps,
});

enum AchievementMetric { workouts, streak, maxSessionVolumeKg, records, cardioSessions, cardioKm, maxDaySteps }

class AchievementDef {
  const AchievementDef(this.key, this.metric, this.target);

  /// Stable id, persisted in `achievements.achievement_key`.
  final String key;
  final AchievementMetric metric;
  final double target;

  /// 0..1 toward unlocking.
  double progress(AchievementStats s) {
    final value = switch (metric) {
      AchievementMetric.workouts => s.workouts.toDouble(),
      AchievementMetric.streak => s.streak.toDouble(),
      AchievementMetric.maxSessionVolumeKg => s.maxSessionVolumeKg,
      AchievementMetric.records => s.records.toDouble(),
      AchievementMetric.cardioSessions => s.cardioSessions.toDouble(),
      AchievementMetric.cardioKm => s.cardioKm,
      AchievementMetric.maxDaySteps => s.maxDaySteps.toDouble(),
    };
    return (value / target).clamp(0.0, 1.0);
  }
}

const achievementCatalog = [
  AchievementDef('first_workout', AchievementMetric.workouts, 1),
  AchievementDef('workouts_10', AchievementMetric.workouts, 10),
  AchievementDef('workouts_50', AchievementMetric.workouts, 50),
  AchievementDef('workouts_100', AchievementMetric.workouts, 100),
  AchievementDef('streak_7', AchievementMetric.streak, 7),
  AchievementDef('streak_30', AchievementMetric.streak, 30),
  AchievementDef('volume_10k', AchievementMetric.maxSessionVolumeKg, 10000),
  AchievementDef('first_pr', AchievementMetric.records, 1),
  AchievementDef('prs_25', AchievementMetric.records, 25),
  AchievementDef('first_cardio', AchievementMetric.cardioSessions, 1),
  AchievementDef('distance_50', AchievementMetric.cardioKm, 50),
  AchievementDef('steps_10k', AchievementMetric.maxDaySteps, 10000),
];

/// Levels need 100·(L−1)² XP: L2 at 100, L3 at 400, L4 at 900…
int levelForXp(int xp) => math.sqrt(xp / 100).floor() + 1;

int xpForLevel(int level) => 100 * (level - 1) * (level - 1);

abstract final class XpRewards {
  static int workout({required double volumeKg, required int records}) =>
      100 + (volumeKg / 100).round() + 50 * records;
  static int cardio({required double distanceM}) => 50 + (distanceM / 1000 * 20).round();
  static const achievement = 100;
}
