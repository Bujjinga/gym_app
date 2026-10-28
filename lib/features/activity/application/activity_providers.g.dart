// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cardioById)
final cardioByIdProvider = CardioByIdFamily._();

final class CardioByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<CardioSession?>,
          CardioSession?,
          FutureOr<CardioSession?>
        >
    with $FutureModifier<CardioSession?>, $FutureProvider<CardioSession?> {
  CardioByIdProvider._({
    required CardioByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cardioByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cardioByIdHash();

  @override
  String toString() {
    return r'cardioByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CardioSession?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CardioSession?> create(Ref ref) {
    final argument = this.argument as String;
    return cardioById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CardioByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cardioByIdHash() => r'3f85279deb5815567a3ca97b96b99c78627dfee6';

final class CardioByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CardioSession?>, String> {
  CardioByIdFamily._()
    : super(
        retry: null,
        name: r'cardioByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CardioByIdProvider call(String id) =>
      CardioByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'cardioByIdProvider';
}

@ProviderFor(cardioRoute)
final cardioRouteProvider = CardioRouteFamily._();

final class CardioRouteProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RoutePoint>>,
          List<RoutePoint>,
          FutureOr<List<RoutePoint>>
        >
    with $FutureModifier<List<RoutePoint>>, $FutureProvider<List<RoutePoint>> {
  CardioRouteProvider._({
    required CardioRouteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cardioRouteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cardioRouteHash();

  @override
  String toString() {
    return r'cardioRouteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<RoutePoint>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RoutePoint>> create(Ref ref) {
    final argument = this.argument as String;
    return cardioRoute(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CardioRouteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cardioRouteHash() => r'7fe2d8b968f371bd7a20b1b045503334885eb877';

final class CardioRouteFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<RoutePoint>>, String> {
  CardioRouteFamily._()
    : super(
        retry: null,
        name: r'cardioRouteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CardioRouteProvider call(String id) =>
      CardioRouteProvider._(argument: id, from: this);

  @override
  String toString() => r'cardioRouteProvider';
}
