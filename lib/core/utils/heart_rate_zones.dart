/// Heart-rate zone (1–5) from the share of max heart rate:
/// Z1 < 60%, Z2 60–70%, Z3 70–80%, Z4 80–90%, Z5 ≥ 90%.
int heartRateZone(int bpm, int maxHeartRate) {
  assert(maxHeartRate > 0, 'maxHeartRate must be positive');
  final pct = bpm / maxHeartRate;
  if (pct < 0.6) return 1;
  if (pct < 0.7) return 2;
  if (pct < 0.8) return 3;
  if (pct < 0.9) return 4;
  return 5;
}
