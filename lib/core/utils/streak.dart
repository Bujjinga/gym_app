/// Consecutive active days ending today, or ending yesterday if today has no
/// activity yet (so the streak isn't "broken" before the day is over).
int currentStreak(Iterable<DateTime> activeDays, DateTime today) {
  DateTime day(DateTime d) => DateTime(d.year, d.month, d.day);
  final days = {for (final d in activeDays) day(d)};
  var cursor = day(today);
  if (!days.contains(cursor)) cursor = DateTime(cursor.year, cursor.month, cursor.day - 1);
  var streak = 0;
  while (days.contains(cursor)) {
    streak++;
    cursor = DateTime(cursor.year, cursor.month, cursor.day - 1);
  }
  return streak;
}
