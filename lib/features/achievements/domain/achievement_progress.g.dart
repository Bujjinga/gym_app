// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AchievementProgress _$AchievementProgressFromJson(Map<String, dynamic> json) =>
    _AchievementProgress(
      key: json['key'] as String,
      progress: (json['progress'] as num?)?.toDouble() ?? 0,
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
    );

Map<String, dynamic> _$AchievementProgressToJson(
  _AchievementProgress instance,
) => <String, dynamic>{
  'key': instance.key,
  'progress': instance.progress,
  'unlockedAt': ?instance.unlockedAt?.toIso8601String(),
};
