import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../domain/meal_entry.dart';
import '../domain/nutrition_repository.dart';
import '../domain/water_log.dart';

part 'drift_nutrition_repository.g.dart';

@Riverpod(keepAlive: true)
NutritionRepository nutritionRepository(Ref ref) => DriftNutritionRepository(ref.watch(appDatabaseProvider));

class DriftNutritionRepository implements NutritionRepository {
  DriftNutritionRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<WaterLog>> watchWater(DateTime from, DateTime to) => _db.nutritionDao.watchWater(from, to).map(
        (rows) => [for (final r in rows) WaterLog(id: r.id, loggedAt: r.loggedAt, amountMl: r.amountMl)],
      );

  @override
  Future<void> addWater(WaterLog w) => _db.nutritionDao.addWater(
        WaterLogsCompanion.insert(id: Value(w.id), loggedAt: w.loggedAt.toUtc(), amountMl: w.amountMl),
      );

  @override
  Future<void> deleteWater(String id) => _db.nutritionDao.deleteWater(id);

  @override
  Stream<List<MealEntry>> watchMeals(DateTime from, DateTime to) => _db.nutritionDao.watchMeals(from, to).map(
        (rows) => [
          for (final r in rows)
            MealEntry(
              id: r.id,
              loggedAt: r.loggedAt,
              meal: r.meal,
              name: r.name,
              calories: r.calories,
              proteinG: r.proteinG,
              carbsG: r.carbsG,
              fatG: r.fatG,
            ),
        ],
      );

  @override
  Future<void> saveMeal(MealEntry m) => _db.nutritionDao.upsertMeal(
        NutritionLogsCompanion.insert(
          id: Value(m.id),
          loggedAt: m.loggedAt.toUtc(),
          meal: m.meal,
          name: m.name,
          calories: m.calories,
          proteinG: Value(m.proteinG),
          carbsG: Value(m.carbsG),
          fatG: Value(m.fatG),
        ),
      );

  @override
  Future<void> deleteMeal(String id) => _db.nutritionDao.deleteMeal(id);
}
