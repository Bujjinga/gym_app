import '../../../core/domain/pulse_enums.dart';
import 'achievement_progress.dart';
import 'personal_record.dart';

abstract interface class ProgressRepository {
  /// Records newest first, optionally for one exercise.
  Stream<List<PersonalRecord>> watchRecords({String? exerciseId});

  Future<PersonalRecord?> best(String exerciseId, RecordType type);

  Future<void> addRecord(PersonalRecord record);

  Stream<List<AchievementProgress>> watchAchievements();

  /// Creates or updates by [AchievementProgress.key].
  Future<void> saveAchievement(AchievementProgress achievement);
}
