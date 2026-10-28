import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../sync_columns.dart';

/// Weight / body-fat / circumference entries. Canonical units: kg, %, cm.
@DataClassName('BodyMeasurementRow')
class BodyMeasurements extends Table with SyncColumns {
  TextColumn get type => textEnum<MeasurementType>()();
  RealColumn get value => real()();
  DateTimeColumn get measuredAt => dateTime()();
}

/// Progress photo metadata. The image itself lives in encrypted local
/// storage; only [localPath] (a reference into it) is stored here.
@DataClassName('ProgressPhotoRow')
class ProgressPhotos extends Table with SyncColumns {
  DateTimeColumn get takenAt => dateTime()();
  TextColumn get pose => textEnum<PhotoPose>()();
  TextColumn get localPath => text()();
  RealColumn get weightKg => real().nullable()();
  TextColumn get note => text().nullable()();
}
