import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/utils/heart_rate_zones.dart';

void main() {
  test('zones follow % of max heart rate', () {
    expect(heartRateZone(100, 200), 1); // 50%
    expect(heartRateZone(119, 200), 1); // 59.5%
    expect(heartRateZone(120, 200), 2); // 60%
    expect(heartRateZone(140, 200), 3); // 70%
    expect(heartRateZone(160, 200), 4); // 80%
    expect(heartRateZone(179, 200), 4); // 89.5%
    expect(heartRateZone(180, 200), 5); // 90%
    expect(heartRateZone(230, 200), 5); // above max
  });
}
