import 'dart:convert';

/// Helpers for the JSON-list text columns (equipment, muscles, cues…).

String encodeEnumList(Iterable<Enum> values) => jsonEncode([for (final v in values) v.name]);

/// Unknown names are skipped, so rows synced from a newer app version don't crash.
List<T> decodeEnumList<T extends Enum>(String json, List<T> values) {
  final byName = values.asNameMap();
  return [for (final n in jsonDecode(json) as List) ?byName[n]];
}

String encodeStringList(Iterable<String> values) => jsonEncode(values.toList());

List<String> decodeStringList(String json) => (jsonDecode(json) as List).cast<String>();
