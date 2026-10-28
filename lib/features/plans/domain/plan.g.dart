// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Plan _$PlanFromJson(Map<String, dynamic> json) => _Plan(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  isPrebuilt: json['isPrebuilt'] as bool? ?? false,
  active: json['active'] as bool? ?? false,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  weeks: (json['weeks'] as num?)?.toInt(),
  days:
      (json['days'] as List<dynamic>?)
          ?.map((e) => PlanDay.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PlanDay>[],
);

Map<String, dynamic> _$PlanToJson(_Plan instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': ?instance.description,
  'isPrebuilt': instance.isPrebuilt,
  'active': instance.active,
  'startDate': ?instance.startDate?.toIso8601String(),
  'weeks': ?instance.weeks,
  'days': instance.days.map((e) => e.toJson()).toList(),
};
