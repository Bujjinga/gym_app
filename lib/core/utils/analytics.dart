enum TimeRange { week, month, threeMonths, year }

/// Chart buckets for a range: week → 7 days, month → 30 days,
/// 3 months → 13 weeks (Monday starts), year → 12 calendar months.
List<DateTime> bucketStarts(TimeRange range, DateTime now) {
  final today = DateTime(now.year, now.month, now.day);
  return switch (range) {
    TimeRange.week => [for (var i = 6; i >= 0; i--) DateTime(today.year, today.month, today.day - i)],
    TimeRange.month => [for (var i = 29; i >= 0; i--) DateTime(today.year, today.month, today.day - i)],
    TimeRange.threeMonths => () {
        final monday = DateTime(today.year, today.month, today.day - (today.weekday - 1));
        return [for (var i = 12; i >= 0; i--) DateTime(monday.year, monday.month, monday.day - 7 * i)];
      }(),
    TimeRange.year => [for (var i = 11; i >= 0; i--) DateTime(today.year, today.month - i)],
  };
}

/// Sums [value] of [items] into the buckets of [range]; items outside the
/// range are ignored.
List<double> bucketSums<T>(
  TimeRange range,
  DateTime now,
  Iterable<T> items,
  DateTime Function(T item) at,
  double Function(T item) value,
) {
  final starts = bucketStarts(range, now);
  final sums = List<double>.filled(starts.length, 0);
  final end = switch (range) {
    TimeRange.year => DateTime(now.year, now.month + 1),
    TimeRange.threeMonths => starts.last.add(const Duration(days: 7)),
    _ => DateTime(now.year, now.month, now.day + 1),
  };
  for (final item in items) {
    final t = at(item).toLocal();
    if (t.isBefore(starts.first) || !t.isBefore(end)) continue;
    var i = starts.length - 1;
    while (i > 0 && t.isBefore(starts[i])) {
      i--;
    }
    sums[i] += value(item);
  }
  return sums;
}
