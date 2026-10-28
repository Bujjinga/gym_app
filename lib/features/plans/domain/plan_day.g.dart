// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanDay _$PlanDayFromJson(Map<String, dynamic> json) => _PlanDay(
  id: json['id'] as String,
  name: json['name'] as String,
  weekday: (json['weekday'] as num?)?.toInt(),
  exercises:
      (json['exercises'] as List<dynamic>?)
          ?.map((e) => PlannedExercise.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PlannedExercise>[],
);

Map<String, dynamic> _$PlanDayToJson(_PlanDay instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'weekday': ?instance.weekday,
  'exercises': instance.exercises.map((e) => e.toJson()).toList(),
};
