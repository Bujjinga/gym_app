// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressPhoto _$ProgressPhotoFromJson(Map<String, dynamic> json) =>
    _ProgressPhoto(
      id: json['id'] as String,
      takenAt: DateTime.parse(json['takenAt'] as String),
      pose: $enumDecode(_$PhotoPoseEnumMap, json['pose']),
      localPath: json['localPath'] as String,
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ProgressPhotoToJson(_ProgressPhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'takenAt': instance.takenAt.toIso8601String(),
      'pose': _$PhotoPoseEnumMap[instance.pose]!,
      'localPath': instance.localPath,
      'weightKg': ?instance.weightKg,
      'note': ?instance.note,
    };

const _$PhotoPoseEnumMap = {
  PhotoPose.front: 'front',
  PhotoPose.side: 'side',
  PhotoPose.back: 'back',
};
