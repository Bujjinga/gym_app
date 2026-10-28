import 'gen/app_localizations.dart';

/// "Good morning, Sam" — or just "Good morning" without a name.
extension Greeting on AppLocalizations {
  String greeting(String? name, [DateTime? now]) {
    final h = (now ?? DateTime.now()).hour;
    final g = h < 12 ? greetingMorning : (h < 18 ? greetingAfternoon : greetingEvening);
    return name == null || name.trim().isEmpty ? g : greetingWithName(g, name.trim());
  }
}
