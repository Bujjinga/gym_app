import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/pulse_enums.dart';

part 'progress_photo.freezed.dart';
part 'progress_photo.g.dart';

/// Metadata for a private progress photo; [localPath] points into the
/// app's encrypted photo store (Phase 6).
@freezed
abstract class ProgressPhoto with _$ProgressPhoto {
  const factory ProgressPhoto({
    required String id,
    required DateTime takenAt,
    required PhotoPose pose,
    required String localPath,
    double? weightKg,
    String? note,
  }) = _ProgressPhoto;

  factory ProgressPhoto.fromJson(Map<String, dynamic> json) => _$ProgressPhotoFromJson(json);
}
