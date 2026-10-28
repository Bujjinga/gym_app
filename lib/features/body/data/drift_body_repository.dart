import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/domain/pulse_enums.dart';
import '../domain/body_measurement.dart';
import '../domain/body_repository.dart';
import '../domain/progress_photo.dart';

part 'drift_body_repository.g.dart';

@Riverpod(keepAlive: true)
BodyRepository bodyRepository(Ref ref) => DriftBodyRepository(ref.watch(appDatabaseProvider));

class DriftBodyRepository implements BodyRepository {
  DriftBodyRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<BodyMeasurement>> watchMeasurements(MeasurementType type) =>
      _db.bodyDao.watchMeasurements(type).map((rows) => [
            for (final r in rows) BodyMeasurement(id: r.id, type: r.type, value: r.value, measuredAt: r.measuredAt),
          ]);

  @override
  Future<void> saveMeasurement(BodyMeasurement m) => _db.bodyDao.upsertMeasurement(
        BodyMeasurementsCompanion.insert(id: Value(m.id), type: m.type, value: m.value, measuredAt: m.measuredAt.toUtc()),
      );

  @override
  Future<void> deleteMeasurement(String id) => _db.bodyDao.deleteMeasurement(id);

  @override
  Stream<List<ProgressPhoto>> watchPhotos() => _db.bodyDao.watchPhotos().map((rows) => [
        for (final r in rows)
          ProgressPhoto(
            id: r.id,
            takenAt: r.takenAt,
            pose: r.pose,
            localPath: r.localPath,
            weightKg: r.weightKg,
            note: r.note,
          ),
      ]);

  @override
  Future<void> savePhoto(ProgressPhoto p) => _db.bodyDao.upsertPhoto(
        ProgressPhotosCompanion.insert(
          id: Value(p.id),
          takenAt: p.takenAt.toUtc(),
          pose: p.pose,
          localPath: p.localPath,
          weightKg: Value(p.weightKg),
          note: Value(p.note),
        ),
      );

  @override
  Future<void> deletePhoto(String id) => _db.bodyDao.deletePhoto(id);
}
