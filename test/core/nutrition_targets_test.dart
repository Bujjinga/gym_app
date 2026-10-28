import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/domain/pulse_enums.dart';
import 'package:gym_app/core/utils/nutrition_targets.dart';

void main() {
  test('Mifflin-St Jeor maintenance for a known profile', () {
    // 80 kg, 180 cm, 30 y male: BMR = 800 + 1125 - 150 + 5 = 1780; × (1.2 + 0.075×4) = 2670.
    final t = macroTargets(weightKg: 80, heightCm: 180, age: 30, sex: Sex.male, trainingDaysPerWeek: 4);
    expect(t.kcal, 2670);
    expect(t.proteinG, 128); // 1.6 g/kg
    expect(t.proteinG * 4 + t.carbsG * 4 + t.fatG * 9, closeTo(2670, 10));
  });

  test('goal adjusts calories and protein', () {
    final cut = macroTargets(
        weightKg: 80, heightCm: 180, age: 30, sex: Sex.male, trainingDaysPerWeek: 4, goal: TrainingGoal.loseFat);
    expect(cut.kcal, (2670 * 0.8).round());
    expect(cut.proteinG, 176);
  });

  test('falls back when stats are missing', () {
    expect(macroTargets().kcal, 2000);
  });
}
