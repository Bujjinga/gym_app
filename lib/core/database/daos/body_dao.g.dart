// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_dao.dart';

// ignore_for_file: type=lint
mixin _$BodyDaoMixin on DatabaseAccessor<AppDatabase> {
  $BodyMeasurementsTable get bodyMeasurements =>
      attachedDatabase.bodyMeasurements;
  $ProgressPhotosTable get progressPhotos => attachedDatabase.progressPhotos;
  BodyDaoManager get managers => BodyDaoManager(this);
}

class BodyDaoManager {
  final _$BodyDaoMixin _db;
  BodyDaoManager(this._db);
  $$BodyMeasurementsTableTableManager get bodyMeasurements =>
      $$BodyMeasurementsTableTableManager(
        _db.attachedDatabase,
        _db.bodyMeasurements,
      );
  $$ProgressPhotosTableTableManager get progressPhotos =>
      $$ProgressPhotosTableTableManager(
        _db.attachedDatabase,
        _db.progressPhotos,
      );
}
