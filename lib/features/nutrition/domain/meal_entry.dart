import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'meal_entry.freezed.dart';
part 'meal_entry.g.dart';

/// One food item in the nutrition log (calories + macros in grams).
@freezed
abstract class MealEntry with _$MealEntry {
  const factory MealEntry({
    required String id,
    required DateTime loggedAt,
    required MealType meal,
    required String name,
    required int calories,
    @Default(0) double proteinG,
    @Default(0) double carbsG,
    @Default(0) double fatG,
  }) = _MealEntry;

  factory MealEntry.fromJson(Map<String, dynamic> json) => _$MealEntryFromJson(json);
}
