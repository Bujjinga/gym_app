import 'package:freezed_annotation/freezed_annotation.dart';

import 'set_entry.dart';

part 'exercise_entry.freezed.dart';
part 'exercise_entry.g.dart';

/// An exercise performed in a session, with its sets in order.
@freezed
abstract class ExerciseEntry with _$ExerciseEntry {
  const factory ExerciseEntry({
    required String id,
    required String exerciseId,

    /// Entries sharing a group number form a superset/circuit.
    int? supersetGroup,
    @Default(90) int restSeconds,
    String? notes,
    @Default(<SetEntry>[]) List<SetEntry> sets,
  }) = _ExerciseEntry;

  factory ExerciseEntry.fromJson(Map<String, dynamic> json) => _$ExerciseEntryFromJson(json);
}
