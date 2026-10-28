import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../sync_columns.dart';

@DataClassName('WaterLogRow')
class WaterLogs extends Table with SyncColumns {
  DateTimeColumn get loggedAt => dateTime()();
  IntColumn get amountMl => integer()();
}

@DataClassName('NutritionLogRow')
class NutritionLogs extends Table with SyncColumns {
  DateTimeColumn get loggedAt => dateTime()();
  TextColumn get meal => textEnum<MealType>()();
  TextColumn get name => text()();
  IntColumn get calories => integer()();
  RealColumn get proteinG => real().withDefault(const Constant(0))();
  RealColumn get carbsG => real().withDefault(const Constant(0))();
  RealColumn get fatG => real().withDefault(const Constant(0))();
}
