import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../app_database.dart';
import '../sync_columns.dart';
import '../tables/body_tables.dart';

part 'body_dao.g.dart';

@DriftAccessor(tables: [BodyMeasurements, ProgressPhotos])
class BodyDao extends DatabaseAccessor<AppDatabase> with _$BodyDaoMixin {
  BodyDao(super.attachedDatabase);

  static const _pending = Value(SyncStatus.pending);

  Stream<List<BodyMeasurementRow>> watchMeasurements(MeasurementType type) => (select(bodyMeasurements)
        ..where((t) => t.type.equalsValue(type) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.asc(t.measuredAt)]))
      .watch();

  Future<void> upsertMeasurement(BodyMeasurementsCompanion row) =>
      into(bodyMeasurements).insertOnConflictUpdate(row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending));

  Future<void> deleteMeasurement(String id) => attachedDatabase.softDelete(bodyMeasurements, id);

  Stream<List<ProgressPhotoRow>> watchPhotos() => (select(progressPhotos)
        ..where((t) => t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.desc(t.takenAt)]))
      .watch();

  Future<void> upsertPhoto(ProgressPhotosCompanion row) =>
      into(progressPhotos).insertOnConflictUpdate(row.copyWith(updatedAt: Value(utcNow()), syncStatus: _pending));

  Future<void> deletePhoto(String id) => attachedDatabase.softDelete(progressPhotos, id);
}
