import 'package:flutter_test/flutter_test.dart';
import 'package:gym_app/core/utils/geo.dart';

void main() {
  test('haversine distance', () {
    // 0.01° of latitude ≈ 1111.95 m.
    expect(Geo.distanceM(0, 0, 0.01, 0), closeTo(1111.95, 0.5));
    expect(Geo.distanceM(51.5, -0.12, 51.5, -0.12), 0);
  });

  test('elevation gain ignores jitter and descents', () {
    // +5 (100→105), the 2 m dip is real, then +7 (103→110).
    expect(Geo.elevationGain([100, 100.5, 101, 99.8, 105, 103, 110, null]), closeTo(12, 1e-9));
  });

  test('splits per km, skipping paused gaps', () {
    final t0 = DateTime(2026);
    // Points every 0.001° lat (~111 m), 30 s apart; a 5-minute pause halfway.
    final points = [
      for (var i = 0; i <= 20; i++)
        (lat: i * 0.001, lon: 0.0, time: t0.add(Duration(seconds: 30 * i + (i > 10 ? 300 : 0)))),
    ];
    final splits = Geo.splits(points, 1000);
    expect(splits.length, 2);
    expect(splits.first.inSeconds, inInclusiveRange(240, 300), reason: 'pause excluded');
  });

  test('auto-pause waits, then resumes immediately', () {
    final ap = AutoPause();
    final t = DateTime(2026);
    expect(ap.update(0.2, t), isFalse);
    expect(ap.update(0.2, t.add(const Duration(seconds: 9))), isFalse);
    expect(ap.update(0.2, t.add(const Duration(seconds: 10))), isTrue);
    expect(ap.update(0.8, t.add(const Duration(seconds: 11))), isTrue, reason: 'hysteresis');
    expect(ap.update(1.5, t.add(const Duration(seconds: 12))), isFalse);
  });
}
