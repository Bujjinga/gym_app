import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'personal_record.freezed.dart';
part 'personal_record.g.dart';

/// A personal best. [value] is kg for weight/1RM/volume, or reps for maxReps.
@freezed
abstract class PersonalRecord with _$PersonalRecord {
  const factory PersonalRecord({
    required String id,
    required String exerciseId,
    required RecordType type,
    required double value,
    int? reps,
    required DateTime achievedAt,
    String? sessionId,
  }) = _PersonalRecord;

  factory PersonalRecord.fromJson(Map<String, dynamic> json) => _$PersonalRecordFromJson(json);
}
