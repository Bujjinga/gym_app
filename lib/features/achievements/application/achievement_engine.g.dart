// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_engine.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(achievementEngine)
final achievementEngineProvider = AchievementEngineProvider._();

final class AchievementEngineProvider
    extends
        $FunctionalProvider<
          AchievementEngine,
          AchievementEngine,
          AchievementEngine
        >
    with $Provider<AchievementEngine> {
  AchievementEngineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'achievementEngineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$achievementEngineHash();

  @$internal
  @override
  $ProviderElement<AchievementEngine> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AchievementEngine create(Ref ref) {
    return achievementEngine(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AchievementEngine value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AchievementEngine>(value),
    );
  }
}

String _$achievementEngineHash() => r'ad262072f166297fd19dd6d8eaf60b975f2d7f49';
