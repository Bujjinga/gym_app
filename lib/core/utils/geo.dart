import 'dart:math' as math;

/// GPS math for route tracking.
abstract final class Geo {
  static const _earthRadiusM = 6371000.0;

  /// Great-circle distance in meters (haversine).
  static double distanceM(double lat1, double lon1, double lat2, double lon2) {
    double rad(double d) => d * math.pi / 180;
    final dLat = rad(lat2 - lat1);
    final dLon = rad(lon2 - lon1);
    final a = math.pow(math.sin(dLat / 2), 2) +
        math.cos(rad(lat1)) * math.cos(rad(lat2)) * math.pow(math.sin(dLon / 2), 2);
    return 2 * _earthRadiusM * math.asin(math.sqrt(a));
  }

  /// Total climb, ignoring changes under [noiseM] (GPS altitude jitter).
  static double elevationGain(Iterable<double?> altitudes, {double noiseM = 2}) {
    double? anchor;
    var gain = 0.0;
    for (final alt in altitudes) {
      if (alt == null) continue;
      anchor ??= alt;
      final diff = alt - anchor;
      if (diff.abs() >= noiseM) {
        if (diff > 0) gain += diff;
        anchor = alt;
      }
    }
    return gain;
  }

  /// Moving time for each full [unitM] (1 km or 1 mile) of a route. Gaps
  /// longer than [maxGap] are pauses and count neither time nor distance.
  static List<Duration> splits(
    List<({double lat, double lon, DateTime time})> points,
    double unitM, {
    Duration maxGap = const Duration(seconds: 30),
  }) {
    final result = <Duration>[];
    var distance = 0.0;
    var elapsed = Duration.zero;
    var splitStart = Duration.zero;
    for (var i = 1; i < points.length; i++) {
      final a = points[i - 1], b = points[i];
      final gap = b.time.difference(a.time);
      if (gap > maxGap) continue;
      distance += distanceM(a.lat, a.lon, b.lat, b.lon);
      elapsed += gap;
      while (distance >= unitM * (result.length + 1)) {
        result.add(elapsed - splitStart);
        splitStart = elapsed;
      }
    }
    return result;
  }
}

/// Auto-pause with hysteresis: pause after [stillFor] below [pauseBelowMps],
/// resume as soon as speed rises above [resumeAboveMps].
class AutoPause {
  AutoPause({this.pauseBelowMps = 0.5, this.resumeAboveMps = 1.0, this.stillFor = const Duration(seconds: 10)});

  final double pauseBelowMps;
  final double resumeAboveMps;
  final Duration stillFor;

  DateTime? _slowSince;
  bool paused = false;

  /// Feeds a speed sample; returns whether tracking should be auto-paused.
  bool update(double speedMps, DateTime at) {
    if (paused) {
      if (speedMps > resumeAboveMps) {
        paused = false;
        _slowSince = null;
      }
    } else if (speedMps < pauseBelowMps) {
      _slowSince ??= at;
      if (at.difference(_slowSince!) >= stillFor) paused = true;
    } else {
      _slowSince = null;
    }
    return paused;
  }
}
