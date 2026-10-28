// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads the bundled exercise library and prebuilt programs into the
/// database. Safe to run on every launch: rows have deterministic ids and
/// existing rows (with the user's favorites/edits) are never overwritten.

@ProviderFor(seedDatabase)
final seedDatabaseProvider = SeedDatabaseProvider._();

/// Loads the bundled exercise library and prebuilt programs into the
/// database. Safe to run on every launch: rows have deterministic ids and
/// existing rows (with the user's favorites/edits) are never overwritten.

final class SeedDatabaseProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Loads the bundled exercise library and prebuilt programs into the
  /// database. Safe to run on every launch: rows have deterministic ids and
  /// existing rows (with the user's favorites/edits) are never overwritten.
  SeedDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'seedDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$seedDatabaseHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return seedDatabase(ref);
  }
}

String _$seedDatabaseHash() => r'30c37b2a9a572a3fd8a22e770f64fae22cda75f8';
