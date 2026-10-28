import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/domain/pulse_enums.dart';
import 'package:gym_app/core/utils/cardio_calculations.dart';
import 'package:gym_app/core/utils/strength_calculations.dart';
import 'package:gym_app/core/utils/unit_conversion.dart';

void main() {
  group('Units', () {
    test('kg ↔ lb round-trips', () {
      expect(Units.kgToLb(100), closeTo(220.462, 0.001));
      expect(Units.lbToKg(Units.kgToLb(72.5)), closeTo(72.5, 1e-9));
    });

    test('weight display/input respects the unit', () {
      expect(Units.weightFromKg(50, WeightUnit.kg), 50);
      expect(Units.weightToKg(110.231, WeightUnit.lb), closeTo(50, 0.001));
    });

    test('distance km and miles', () {
      expect(Units.distanceFromMeters(5000, DistanceUnit.km), 5);
      expect(Units.distanceFromMeters(1609.344, DistanceUnit.mi), closeTo(1, 1e-9));
      expect(Units.distanceToMeters(3.1, DistanceUnit.mi), closeTo(4988.97, 0.01));
    });

    test('cm ↔ inches', () {
      expect(Units.cmToIn(2.54), closeTo(1, 1e-9));
      expect(Units.inToCm(70), closeTo(177.8, 1e-9));
    });
  });

  group('Strength', () {
    test('Epley 1RM', () {
      expect(Strength.epley(100, 1), 100);
      expect(Strength.epley(100, 10), closeTo(133.33, 0.01));
      expect(Strength.epley(0, 5), 0);
      expect(Strength.epley(100, 0), 0);
    });

    test('Brzycki 1RM', () {
      expect(Strength.brzycki(100, 1), closeTo(100, 1e-9));
      expect(Strength.brzycki(100, 10), closeTo(133.33, 0.01));
      expect(Strength.brzycki(100, 37), 0, reason: 'undefined at 37+ reps');
    });

    test('volume counts completed working sets only', () {
      final v = Strength.totalVolume([
        (weightKg: 40, reps: 10, type: SetType.warmup, completed: true),
        (weightKg: 60, reps: 8, type: SetType.working, completed: true),
        (weightKg: 60, reps: 8, type: SetType.working, completed: false),
        (weightKg: 50, reps: 10, type: SetType.drop, completed: true),
        (weightKg: null, reps: 12, type: SetType.working, completed: true),
      ]);
      expect(v, 60 * 8 + 50 * 10);
    });
  });

  group('Cardio', () {
    test('pace per km and per mile', () {
      // 5 km in 25:00 → 5:00 /km.
      expect(Cardio.paceSecondsPerUnit(5000, 1500, DistanceUnit.km), 300);
      expect(Cardio.paceSecondsPerUnit(1609.344, 480, DistanceUnit.mi), closeTo(480, 1e-9));
      expect(Cardio.paceSecondsPerUnit(0, 100, DistanceUnit.km), isNull);
    });

    test('pace formatting', () {
      expect(Cardio.formatPace(307), '5:07');
      expect(Cardio.formatPace(null), '--:--');
    });

    test('speed', () {
      expect(Cardio.speedKmh(10000, 3600), 10);
      expect(Cardio.speedKmh(1000, 0), 0);
    });

    test('MET calories: 70 kg, 1 h at 10 km/h ≈ 700 kcal', () {
      final kcal = Cardio.sessionCalories(type: CardioType.run, distanceM: 10000, durationSec: 3600, weightKg: 70);
      expect(kcal, closeTo(700, 0.01));
    });

    test('walking uses lower MET than running', () {
      final walk = Cardio.sessionCalories(type: CardioType.walk, distanceM: 5000, durationSec: 3600, weightKg: 80);
      expect(walk, closeTo(3.5 * 80, 0.01));
    });
  });
}
