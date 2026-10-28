import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'set_entry.freezed.dart';
part 'set_entry.g.dart';

/// One logged set. Weight is always kg.
@freezed
abstract class SetEntry with _$SetEntry {
  const factory SetEntry({
    required String id,
    @Default(SetType.working) SetType type,
    double? weightKg,
    int? reps,
    double? rpe,
    int? durationSec,
    double? distanceM,
    DateTime? completedAt,
  }) = _SetEntry;

  const SetEntry._();

  factory SetEntry.fromJson(Map<String, dynamic> json) => _$SetEntryFromJson(json);

  bool get isCompleted => completedAt != null;
}
