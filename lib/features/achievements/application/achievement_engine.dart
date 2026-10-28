import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/streak.dart';
import '../../activity/data/drift_activity_repository.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../../workout/data/drift_workout_repository.dart';
import '../data/drift_progress_repository.dart';
import '../domain/achievement_catalog.dart';
import '../domain/achievement_progress.dart';

part 'achievement_engine.g.dart';

@Riverpod(keepAlive: true)
AchievementEngine achievementEngine(Ref ref) => AchievementEngine(ref);

/// Awards XP after an activity and re-evaluates every achievement.
class AchievementEngine {
  AchievementEngine(this._ref);

  final Ref _ref;

  /// Adds [xp] (plus a bonus per unlock) and returns newly unlocked keys.
  Future<List<String>> award({required int xp}) async {
    final now = DateTime.now();
    final sessions =
        (await _ref.read(workoutRepositoryProvider).watchSessions().first).where((s) => s.endedAt != null);
    final cardio = await _ref.read(activityRepositoryProvider).watchCardio().first;
    final records = await _ref.read(progressRepositoryProvider).watchRecords().first;
    final days =
        await _ref.read(activityRepositoryProvider).watchDays(now.subtract(const Duration(days: 365)), now).first;
    final stats = (
      workouts: sessions.length,
      streak: currentStreak(
        [...sessions.map((s) => s.startedAt.toLocal()), ...cardio.map((c) => c.startedAt.toLocal())],
        now,
      ),
      maxSessionVolumeKg: sessions.fold(0.0, (m, s) => s.totalVolumeKg > m ? s.totalVolumeKg : m),
      records: records.length,
      cardioSessions: cardio.length,
      cardioKm: cardio.fold(0.0, (a, c) => a + c.distanceM) / 1000,
      maxDaySteps: days.fold(0, (m, d) => d.steps > m ? d.steps : m),
    );

    final progress = _ref.read(progressRepositoryProvider);
    final existing = {for (final a in await progress.watchAchievements().first) a.key: a};
    final unlocked = <String>[];
    for (final def in achievementCatalog) {
      final p = def.progress(stats);
      final was = existing[def.key];
      final newlyUnlocked = p >= 1 && !(was?.isUnlocked ?? false);
      if (newlyUnlocked) unlocked.add(def.key);
      if (was?.progress != p || newlyUnlocked) {
        await progress.saveAchievement(
          AchievementProgress(key: def.key, progress: p, unlockedAt: newlyUnlocked ? now : was?.unlockedAt),
        );
      }
    }
    final profiles = _ref.read(profileRepositoryProvider);
    final profile = await profiles.get();
    await profiles.save(profile.copyWith(xp: profile.xp + xp + XpRewards.achievement * unlocked.length));
    return unlocked;
  }
}
