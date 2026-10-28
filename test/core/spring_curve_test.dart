import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/design_system/tokens/pulse_motion.dart';

void main() {
  double peak(MotionPreset p) {
    var max = 0.0;
    for (var i = 0; i <= 100; i++) {
      final v = p.springCurve.transform(i / 100);
      if (v > max) max = v;
    }
    return max;
  }

  test('spring curves start at 0 and end at 1', () {
    for (final p in MotionPreset.values) {
      expect(p.springCurve.transform(0), 0);
      expect(p.springCurve.transform(1), 1);
      expect(p.springCurve.transform(0.98), closeTo(1, 0.02));
    }
  });

  test('bouncy overshoots, smooth does not', () {
    expect(peak(MotionPreset.bouncy), greaterThan(1.05));
    expect(peak(MotionPreset.smooth), lessThanOrEqualTo(1.0001));
  });
}
