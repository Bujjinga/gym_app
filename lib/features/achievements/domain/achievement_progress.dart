import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_progress.freezed.dart';
part 'achievement_progress.g.dart';

/// Stored state of one achievement; its definition lives in code (Phase 7).
@freezed
abstract class AchievementProgress with _$AchievementProgress {
  const factory AchievementProgress({
    required String key,

    /// 0..1 toward unlocking.
    @Default(0) double progress,
    DateTime? unlockedAt,
  }) = _AchievementProgress;

  const AchievementProgress._();

  factory AchievementProgress.fromJson(Map<String, dynamic> json) => _$AchievementProgressFromJson(json);

  bool get isUnlocked => unlockedAt != null;
}
