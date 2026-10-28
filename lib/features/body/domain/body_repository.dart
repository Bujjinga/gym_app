import '../../../core/domain/pulse_enums.dart';
import 'body_measurement.dart';
import 'progress_photo.dart';

abstract interface class BodyRepository {
  /// Entries of one type, oldest first (ready for trend charts).
  Stream<List<BodyMeasurement>> watchMeasurements(MeasurementType type);

  Future<void> saveMeasurement(BodyMeasurement measurement);

  Future<void> deleteMeasurement(String id);

  /// Photos newest first.
  Stream<List<ProgressPhoto>> watchPhotos();

  Future<void> savePhoto(ProgressPhoto photo);

  Future<void> deletePhoto(String id);
}
