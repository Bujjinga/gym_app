import 'package:drift/drift.dart';

import '../sync_columns.dart';

/// Training program (prebuilt from seed, or user-made).
@DataClassName('PlanRow')
class Plans extends Table with SyncColumns {
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  BoolColumn get isPrebuilt => boolean().withDefault(const Constant(false))();
  BoolColumn get active => boolean().withDefault(const Constant(false))();
  DateTimeColumn get startDate => dateTime().nullable()();
  IntColumn get weeks => integer().nullable()();
}

/// A training day inside a plan; exercises are a JSON list like templates.
@DataClassName('PlanDayRow')
class PlanDays extends Table with SyncColumns {
  TextColumn get planId => text()();
  IntColumn get position => integer()();
  TextColumn get name => text()();

  /// ISO weekday 1 (Mon) … 7 (Sun) when scheduled to a fixed day.
  IntColumn get weekday => integer().nullable()();
  TextColumn get exercises => text().withDefault(const Constant('[]'))();
}
