import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

/// Row change state. Unused while PULSE is device-only; kept so a future
/// backup/export can find changed rows without a schema migration.
enum SyncStatus {
  /// Changed locally and not yet pushed.
  pending,

  /// Unchanged since the last backup (seed rows start here).
  synced,
}

/// Columns every table carries: UUID primary key, owner, timestamps,
/// soft delete and change state.
mixin SyncColumns on Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();

  /// Always null: the app has no accounts; data lives only on this device.
  TextColumn get userId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedAt => dateTime().clientDefault(() => DateTime.now().toUtc())();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  TextColumn get syncStatus => textEnum<SyncStatus>().withDefault(Constant(SyncStatus.pending.name))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
