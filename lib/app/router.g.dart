// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $onboardingRoute,
  $appShellRoute,
  $activeWorkoutRoute,
  $workoutSummaryRoute,
  $exerciseLibraryRoute,
  $exercisePickerRoute,
  $exerciseDetailRoute,
  $programsRoute,
  $liveTrackingRoute,
  $cardioDetailRoute,
  $bodyRoute,
  $waterRoute,
  $nutritionRoute,
  $photosRoute,
  $analyticsRoute,
  $recordsRoute,
  $achievementsRoute,
  $monthlyRecapRoute,
  $galleryRoute,
];

RouteBase get $splashRoute => GoRouteData.$route(
  path: '/splash',
  hasOverriddenOnExit: false,
  factory: $SplashRoute._fromState,
);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location('/splash');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingRoute => GoRouteData.$route(
  path: '/onboarding',
  hasOverriddenOnExit: false,
  factory: $OnboardingRoute._fromState,
);

mixin $OnboardingRoute on GoRouteData {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $appShellRoute => StatefulShellRouteData.$route(
  navigatorContainerBuilder: AppShellRoute.$navigatorContainerBuilder,
  factory: $AppShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',
          hasOverriddenOnExit: false,
          factory: $HomeRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/train',
          hasOverriddenOnExit: false,
          factory: $TrainRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/activity',
          hasOverriddenOnExit: false,
          factory: $ActivityRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/progress',
          hasOverriddenOnExit: false,
          factory: $ProgressRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/profile',
          hasOverriddenOnExit: false,
          factory: $ProfileRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $AppShellRouteExtension on AppShellRoute {
  static AppShellRoute _fromState(GoRouterState state) => const AppShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $TrainRoute on GoRouteData {
  static TrainRoute _fromState(GoRouterState state) => const TrainRoute();

  @override
  String get location => GoRouteData.$location('/train');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ActivityRoute on GoRouteData {
  static ActivityRoute _fromState(GoRouterState state) => const ActivityRoute();

  @override
  String get location => GoRouteData.$location('/activity');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProgressRoute on GoRouteData {
  static ProgressRoute _fromState(GoRouterState state) => const ProgressRoute();

  @override
  String get location => GoRouteData.$location('/progress');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProfileRoute on GoRouteData {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  @override
  String get location => GoRouteData.$location('/profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $activeWorkoutRoute => GoRouteData.$route(
  path: '/workout',
  hasOverriddenOnExit: false,
  factory: $ActiveWorkoutRoute._fromState,
);

mixin $ActiveWorkoutRoute on GoRouteData {
  static ActiveWorkoutRoute _fromState(GoRouterState state) =>
      const ActiveWorkoutRoute();

  @override
  String get location => GoRouteData.$location('/workout');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $workoutSummaryRoute => GoRouteData.$route(
  path: '/sessions/:id',
  hasOverriddenOnExit: false,
  factory: $WorkoutSummaryRoute._fromState,
);

mixin $WorkoutSummaryRoute on GoRouteData {
  static WorkoutSummaryRoute _fromState(GoRouterState state) =>
      WorkoutSummaryRoute(
        id: state.pathParameters['id']!,
        celebrate:
            _$convertMapValue(
              'celebrate',
              state.uri.queryParameters,
              _$boolConverter,
            ) ??
            false,
        achievements: state.uri.queryParameters['achievements'] ?? '',
      );

  WorkoutSummaryRoute get _self => this as WorkoutSummaryRoute;

  @override
  String get location => GoRouteData.$location(
    '/sessions/${Uri.encodeComponent(_self.id)}',
    queryParams: {
      if (_self.celebrate != false) 'celebrate': _self.celebrate.toString(),
      if (_self.achievements != '') 'achievements': _self.achievements,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $exerciseLibraryRoute => GoRouteData.$route(
  path: '/exercises',
  hasOverriddenOnExit: false,
  factory: $ExerciseLibraryRoute._fromState,
);

mixin $ExerciseLibraryRoute on GoRouteData {
  static ExerciseLibraryRoute _fromState(GoRouterState state) =>
      const ExerciseLibraryRoute();

  @override
  String get location => GoRouteData.$location('/exercises');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $exercisePickerRoute => GoRouteData.$route(
  path: '/pick-exercises',
  hasOverriddenOnExit: false,
  factory: $ExercisePickerRoute._fromState,
);

mixin $ExercisePickerRoute on GoRouteData {
  static ExercisePickerRoute _fromState(GoRouterState state) =>
      const ExercisePickerRoute();

  @override
  String get location => GoRouteData.$location('/pick-exercises');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $exerciseDetailRoute => GoRouteData.$route(
  path: '/exercise/:id',
  hasOverriddenOnExit: false,
  factory: $ExerciseDetailRoute._fromState,
);

mixin $ExerciseDetailRoute on GoRouteData {
  static ExerciseDetailRoute _fromState(GoRouterState state) =>
      ExerciseDetailRoute(id: state.pathParameters['id']!);

  ExerciseDetailRoute get _self => this as ExerciseDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/exercise/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $programsRoute => GoRouteData.$route(
  path: '/programs',
  hasOverriddenOnExit: false,
  factory: $ProgramsRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: ':id',
      hasOverriddenOnExit: false,
      factory: $PlanDetailRoute._fromState,
    ),
  ],
);

mixin $ProgramsRoute on GoRouteData {
  static ProgramsRoute _fromState(GoRouterState state) => const ProgramsRoute();

  @override
  String get location => GoRouteData.$location('/programs');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PlanDetailRoute on GoRouteData {
  static PlanDetailRoute _fromState(GoRouterState state) =>
      PlanDetailRoute(id: state.pathParameters['id']!);

  PlanDetailRoute get _self => this as PlanDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/programs/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $liveTrackingRoute => GoRouteData.$route(
  path: '/track',
  hasOverriddenOnExit: false,
  factory: $LiveTrackingRoute._fromState,
);

mixin $LiveTrackingRoute on GoRouteData {
  static LiveTrackingRoute _fromState(GoRouterState state) =>
      const LiveTrackingRoute();

  @override
  String get location => GoRouteData.$location('/track');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $cardioDetailRoute => GoRouteData.$route(
  path: '/cardio/:id',
  hasOverriddenOnExit: false,
  factory: $CardioDetailRoute._fromState,
);

mixin $CardioDetailRoute on GoRouteData {
  static CardioDetailRoute _fromState(GoRouterState state) =>
      CardioDetailRoute(id: state.pathParameters['id']!);

  CardioDetailRoute get _self => this as CardioDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/cardio/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $bodyRoute => GoRouteData.$route(
  path: '/body',
  hasOverriddenOnExit: false,
  factory: $BodyRoute._fromState,
);

mixin $BodyRoute on GoRouteData {
  static BodyRoute _fromState(GoRouterState state) => const BodyRoute();

  @override
  String get location => GoRouteData.$location('/body');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $waterRoute => GoRouteData.$route(
  path: '/water',
  hasOverriddenOnExit: false,
  factory: $WaterRoute._fromState,
);

mixin $WaterRoute on GoRouteData {
  static WaterRoute _fromState(GoRouterState state) => const WaterRoute();

  @override
  String get location => GoRouteData.$location('/water');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $nutritionRoute => GoRouteData.$route(
  path: '/nutrition',
  hasOverriddenOnExit: false,
  factory: $NutritionRoute._fromState,
);

mixin $NutritionRoute on GoRouteData {
  static NutritionRoute _fromState(GoRouterState state) =>
      const NutritionRoute();

  @override
  String get location => GoRouteData.$location('/nutrition');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $photosRoute => GoRouteData.$route(
  path: '/photos',
  hasOverriddenOnExit: false,
  factory: $PhotosRoute._fromState,
);

mixin $PhotosRoute on GoRouteData {
  static PhotosRoute _fromState(GoRouterState state) => const PhotosRoute();

  @override
  String get location => GoRouteData.$location('/photos');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $analyticsRoute => GoRouteData.$route(
  path: '/analytics',
  hasOverriddenOnExit: false,
  factory: $AnalyticsRoute._fromState,
);

mixin $AnalyticsRoute on GoRouteData {
  static AnalyticsRoute _fromState(GoRouterState state) =>
      const AnalyticsRoute();

  @override
  String get location => GoRouteData.$location('/analytics');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $recordsRoute => GoRouteData.$route(
  path: '/records',
  hasOverriddenOnExit: false,
  factory: $RecordsRoute._fromState,
);

mixin $RecordsRoute on GoRouteData {
  static RecordsRoute _fromState(GoRouterState state) => const RecordsRoute();

  @override
  String get location => GoRouteData.$location('/records');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $achievementsRoute => GoRouteData.$route(
  path: '/achievements',
  hasOverriddenOnExit: false,
  factory: $AchievementsRoute._fromState,
);

mixin $AchievementsRoute on GoRouteData {
  static AchievementsRoute _fromState(GoRouterState state) =>
      const AchievementsRoute();

  @override
  String get location => GoRouteData.$location('/achievements');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $monthlyRecapRoute => GoRouteData.$route(
  path: '/recap',
  hasOverriddenOnExit: false,
  factory: $MonthlyRecapRoute._fromState,
);

mixin $MonthlyRecapRoute on GoRouteData {
  static MonthlyRecapRoute _fromState(GoRouterState state) =>
      const MonthlyRecapRoute();

  @override
  String get location => GoRouteData.$location('/recap');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $galleryRoute => GoRouteData.$route(
  path: '/gallery',
  hasOverriddenOnExit: false,
  factory: $GalleryRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'hero/:id',
      hasOverriddenOnExit: false,
      factory: $GalleryHeroRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'scroll',
      hasOverriddenOnExit: false,
      factory: $GalleryScrollRoute._fromState,
    ),
  ],
);

mixin $GalleryRoute on GoRouteData {
  static GalleryRoute _fromState(GoRouterState state) => const GalleryRoute();

  @override
  String get location => GoRouteData.$location('/gallery');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GalleryHeroRoute on GoRouteData {
  static GalleryHeroRoute _fromState(GoRouterState state) =>
      GalleryHeroRoute(id: int.parse(state.pathParameters['id']!));

  GalleryHeroRoute get _self => this as GalleryHeroRoute;

  @override
  String get location => GoRouteData.$location(
    '/gallery/hero/${Uri.encodeComponent(_self.id.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $GalleryScrollRoute on GoRouteData {
  static GalleryScrollRoute _fromState(GoRouterState state) =>
      const GalleryScrollRoute();

  @override
  String get location => GoRouteData.$location('/gallery/scroll');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// App router. Until the profile loads it shows the splash; until
/// onboarding is complete every route redirects to onboarding.

@ProviderFor(router)
final routerProvider = RouterProvider._();

/// App router. Until the profile loads it shows the splash; until
/// onboarding is complete every route redirects to onboarding.

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// App router. Until the profile loads it shows the splash; until
  /// onboarding is complete every route redirects to onboarding.
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'db13be49b37005aa19e136380742ef618d931a92';
