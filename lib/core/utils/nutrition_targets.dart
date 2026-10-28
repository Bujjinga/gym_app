import '../domain/pulse_enums.dart';

typedef MacroTargets = ({int kcal, int proteinG, int carbsG, int fatG});

/// Daily calorie and macro targets from body stats and goal.
/// Mifflin-St Jeor BMR × activity (from training days), ±goal adjustment;
/// protein by goal, fat 25% of calories, carbs the rest. Falls back to
/// 2000 kcal when stats are missing.
MacroTargets macroTargets({
  double? weightKg,
  double? heightCm,
  int? age,
  Sex? sex,
  int? trainingDaysPerWeek,
  TrainingGoal? goal,
}) {
  final w = weightKg ?? 75;
  double kcal;
  if (weightKg == null || heightCm == null || age == null) {
    kcal = 2000;
  } else {
    final sexOffset = switch (sex) { Sex.male => 5.0, Sex.female => -161.0, _ => -78.0 };
    final bmr = 10 * weightKg + 6.25 * heightCm - 5 * age + sexOffset;
    final activity = (1.2 + 0.075 * (trainingDaysPerWeek ?? 3)).clamp(1.2, 1.725);
    kcal = bmr * activity;
  }
  kcal *= switch (goal) { TrainingGoal.loseFat => 0.8, TrainingGoal.buildMuscle => 1.1, _ => 1.0 };
  final proteinPerKg = switch (goal) { TrainingGoal.loseFat => 2.2, TrainingGoal.buildMuscle => 2.0, _ => 1.6 };
  final protein = w * proteinPerKg;
  final fat = kcal * 0.25 / 9;
  final carbs = ((kcal - protein * 4 - fat * 9) / 4).clamp(0, double.infinity);
  return (kcal: kcal.round(), proteinG: protein.round(), carbsG: carbs.round(), fatG: fat.round());
}
