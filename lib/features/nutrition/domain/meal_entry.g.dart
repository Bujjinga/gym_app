// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealEntry _$MealEntryFromJson(Map<String, dynamic> json) => _MealEntry(
  id: json['id'] as String,
  loggedAt: DateTime.parse(json['loggedAt'] as String),
  meal: $enumDecode(_$MealTypeEnumMap, json['meal']),
  name: json['name'] as String,
  calories: (json['calories'] as num).toInt(),
  proteinG: (json['proteinG'] as num?)?.toDouble() ?? 0,
  carbsG: (json['carbsG'] as num?)?.toDouble() ?? 0,
  fatG: (json['fatG'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$MealEntryToJson(_MealEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loggedAt': instance.loggedAt.toIso8601String(),
      'meal': _$MealTypeEnumMap[instance.meal]!,
      'name': instance.name,
      'calories': instance.calories,
      'proteinG': instance.proteinG,
      'carbsG': instance.carbsG,
      'fatG': instance.fatG,
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
  MealType.snack: 'snack',
};
