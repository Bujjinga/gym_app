// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_widget_sync.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Values the native home screen widgets read (keys match
/// ios/PulseWidgets/PulseWidgets.swift and android PulseWidgetProvider.kt).

@ProviderFor(homeWidgetData)
final homeWidgetDataProvider = HomeWidgetDataProvider._();

/// Values the native home screen widgets read (keys match
/// ios/PulseWidgets/PulseWidgets.swift and android PulseWidgetProvider.kt).

final class HomeWidgetDataProvider
    extends
        $FunctionalProvider<
          Map<String, Object>,
          Map<String, Object>,
          Map<String, Object>
        >
    with $Provider<Map<String, Object>> {
  /// Values the native home screen widgets read (keys match
  /// ios/PulseWidgets/PulseWidgets.swift and android PulseWidgetProvider.kt).
  HomeWidgetDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeWidgetDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeWidgetDataHash();

  @$internal
  @override
  $ProviderElement<Map<String, Object>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, Object> create(Ref ref) {
    return homeWidgetData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, Object> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, Object>>(value),
    );
  }
}

String _$homeWidgetDataHash() => r'abbd89e9a695b4d01f694dac999c241e4c987b7b';
