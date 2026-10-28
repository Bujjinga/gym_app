import 'meal_entry.dart';
import 'water_log.dart';

abstract interface class NutritionRepository {
  /// Water logged in `[from, to)`.
  Stream<List<WaterLog>> watchWater(DateTime from, DateTime to);

  Future<void> addWater(WaterLog log);

  Future<void> deleteWater(String id);

  /// Meals logged in `[from, to)`.
  Stream<List<MealEntry>> watchMeals(DateTime from, DateTime to);

  Future<void> saveMeal(MealEntry meal);

  Future<void> deleteMeal(String id);
}
