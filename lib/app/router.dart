import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/design_system/design_system.dart';
import '../features/activity/presentation/activity_screen.dart';
import '../features/activity/presentation/cardio_detail_screen.dart';
import '../features/activity/presentation/live_tracking_screen.dart';
import '../features/exercises/presentation/exercise_detail_screen.dart';
import '../features/exercises/presentation/exercise_library_screen.dart';
import '../features/gallery/presentation/gallery_hero_detail_screen.dart';
import '../features/gallery/presentation/gallery_screen.dart';
import '../features/gallery/presentation/gallery_scroll_demo_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/plans/presentation/plan_detail_screen.dart';
import '../features/plans/presentation/programs_screen.dart';
import '../features/profile/data/drift_profile_repository.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/progress/presentation/achievements_screen.dart';
import '../features/progress/presentation/analytics_screen.dart';
import '../features/progress/presentation/body_screen.dart';
import '../features/progress/presentation/monthly_recap_screen.dart';
import '../features/progress/presentation/records_screen.dart';
import '../features/progress/presentation/nutrition_screen.dart';
import '../features/progress/presentation/photos_screen.dart';
import '../features/progress/presentation/water_screen.dart';
import '../features/progress/presentation/progress_screen.dart';
import '../features/workout/presentation/active_workout_screen.dart';
import '../features/workout/presentation/train_screen.dart';
import '../features/workout/presentation/workout_summary_screen.dart';
import 'adaptive_shell.dart';
import 'splash_screen.dart';

part 'router.g.dart';

/// App router. Until the profile loads it shows the splash; until
/// onboarding is complete every route redirects to onboarding.
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final onboarded = ValueNotifier<bool?>(ref.read(userProfileProvider).value?.onboardingComplete);
  ref.listen(userProfileProvider, (_, next) => onboarded.value = next.value?.onboardingComplete);
  ref.onDispose(onboarded.dispose);
  return GoRouter(
    routes: $appRoutes,
    initialLocation: const SplashRoute().location,
    refreshListenable: onboarded,
    redirect: (context, state) {
      final location = state.matchedLocation;
      if (location.startsWith('/gallery')) return null;
      final done = onboarded.value;
      if (done == null) return location == '/splash' ? null : '/splash';
      if (!done) return location == '/onboarding' ? null : '/onboarding';
      return location == '/splash' || location == '/onboarding' ? const HomeRoute().location : null;
    },
  );
}

// ---- Entry -----------------------------------------------------------------

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: SplashScreen());
}

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => fadeThroughPage(state, const OnboardingScreen());
}

// ---- Tab shell ---------------------------------------------------------------

@TypedStatefulShellRoute<AppShellRoute>(
  branches: [
    TypedStatefulShellBranch<HomeBranch>(routes: [TypedGoRoute<HomeRoute>(path: '/home')]),
    TypedStatefulShellBranch<TrainBranch>(routes: [TypedGoRoute<TrainRoute>(path: '/train')]),
    TypedStatefulShellBranch<ActivityBranch>(routes: [TypedGoRoute<ActivityRoute>(path: '/activity')]),
    TypedStatefulShellBranch<ProgressBranch>(routes: [TypedGoRoute<ProgressRoute>(path: '/progress')]),
    TypedStatefulShellBranch<ProfileBranch>(routes: [TypedGoRoute<ProfileRoute>(path: '/profile')]),
  ],
)
class AppShellRoute extends StatefulShellRouteData {
  const AppShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) =>
      navigationShell;

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) =>
      AdaptiveShell(navigationShell: navigationShell, children: children);
}

class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();
}

class TrainBranch extends StatefulShellBranchData {
  const TrainBranch();
}

class ActivityBranch extends StatefulShellBranchData {
  const ActivityBranch();
}

class ProgressBranch extends StatefulShellBranchData {
  const ProgressBranch();
}

class ProfileBranch extends StatefulShellBranchData {
  const ProfileBranch();
}

// Tab pages skip route transitions: the shell cross-fades branches itself.
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: HomeScreen());
}

class TrainRoute extends GoRouteData with $TrainRoute {
  const TrainRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: TrainScreen());
}

class ActivityRoute extends GoRouteData with $ActivityRoute {
  const ActivityRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: ActivityScreen());
}

class ProgressRoute extends GoRouteData with $ProgressRoute {
  const ProgressRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: ProgressScreen());
}

class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: ProfileScreen());
}

// ---- Training (full screen, above the tabs) ---------------------------------

@TypedGoRoute<ActiveWorkoutRoute>(path: '/workout')
class ActiveWorkoutRoute extends GoRouteData with $ActiveWorkoutRoute {
  const ActiveWorkoutRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const ActiveWorkoutScreen());
}

@TypedGoRoute<WorkoutSummaryRoute>(path: '/sessions/:id')
class WorkoutSummaryRoute extends GoRouteData with $WorkoutSummaryRoute {
  const WorkoutSummaryRoute({required this.id, this.celebrate = false, this.achievements = ''});

  final String id;
  final bool celebrate;

  /// Comma-separated keys of achievements unlocked by this workout.
  final String achievements;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      fadeThroughPage(state, WorkoutSummaryScreen(id: id, celebrate: celebrate, achievements: achievements));
}

@TypedGoRoute<ExerciseLibraryRoute>(path: '/exercises')
class ExerciseLibraryRoute extends GoRouteData with $ExerciseLibraryRoute {
  const ExerciseLibraryRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      sharedAxisPage(state, const ExerciseLibraryScreen());
}

@TypedGoRoute<ExercisePickerRoute>(path: '/pick-exercises')
class ExercisePickerRoute extends GoRouteData with $ExercisePickerRoute {
  const ExercisePickerRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      sharedAxisPage(state, const ExerciseLibraryScreen(pickMode: true));
}

@TypedGoRoute<ExerciseDetailRoute>(path: '/exercise/:id')
class ExerciseDetailRoute extends GoRouteData with $ExerciseDetailRoute {
  const ExerciseDetailRoute({required this.id});

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => fadeThroughPage(state, ExerciseDetailScreen(id: id));
}

@TypedGoRoute<ProgramsRoute>(path: '/programs', routes: [TypedGoRoute<PlanDetailRoute>(path: ':id')])
class ProgramsRoute extends GoRouteData with $ProgramsRoute {
  const ProgramsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const ProgramsScreen());
}

class PlanDetailRoute extends GoRouteData with $PlanDetailRoute {
  const PlanDetailRoute({required this.id});

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, PlanDetailScreen(id: id));
}

@TypedGoRoute<LiveTrackingRoute>(path: '/track')
class LiveTrackingRoute extends GoRouteData with $LiveTrackingRoute {
  const LiveTrackingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const LiveTrackingScreen());
}

@TypedGoRoute<CardioDetailRoute>(path: '/cardio/:id')
class CardioDetailRoute extends GoRouteData with $CardioDetailRoute {
  const CardioDetailRoute({required this.id});

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => fadeThroughPage(state, CardioDetailScreen(id: id));
}

// ---- Health & body (Progress tab) ------------------------------------------

@TypedGoRoute<BodyRoute>(path: '/body')
class BodyRoute extends GoRouteData with $BodyRoute {
  const BodyRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const BodyScreen());
}

@TypedGoRoute<WaterRoute>(path: '/water')
class WaterRoute extends GoRouteData with $WaterRoute {
  const WaterRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const WaterScreen());
}

@TypedGoRoute<NutritionRoute>(path: '/nutrition')
class NutritionRoute extends GoRouteData with $NutritionRoute {
  const NutritionRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const NutritionScreen());
}

@TypedGoRoute<PhotosRoute>(path: '/photos')
class PhotosRoute extends GoRouteData with $PhotosRoute {
  const PhotosRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const PhotosScreen());
}

@TypedGoRoute<AnalyticsRoute>(path: '/analytics')
class AnalyticsRoute extends GoRouteData with $AnalyticsRoute {
  const AnalyticsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const AnalyticsScreen());
}

@TypedGoRoute<RecordsRoute>(path: '/records')
class RecordsRoute extends GoRouteData with $RecordsRoute {
  const RecordsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const RecordsScreen());
}

@TypedGoRoute<AchievementsRoute>(path: '/achievements')
class AchievementsRoute extends GoRouteData with $AchievementsRoute {
  const AchievementsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const AchievementsScreen());
}

@TypedGoRoute<MonthlyRecapRoute>(path: '/recap')
class MonthlyRecapRoute extends GoRouteData with $MonthlyRecapRoute {
  const MonthlyRecapRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const MonthlyRecapScreen());
}

// ---- Developer gallery (debug builds only link here) -----------------------

@TypedGoRoute<GalleryRoute>(
  path: '/gallery',
  routes: [
    TypedGoRoute<GalleryHeroRoute>(path: 'hero/:id'),
    TypedGoRoute<GalleryScrollRoute>(path: 'scroll'),
  ],
)
class GalleryRoute extends GoRouteData with $GalleryRoute {
  const GalleryRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => sharedAxisPage(state, const GalleryScreen());
}

class GalleryHeroRoute extends GoRouteData with $GalleryHeroRoute {
  const GalleryHeroRoute({required this.id});

  final int id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      fadeThroughPage(state, GalleryHeroDetailScreen(id: id));
}

class GalleryScrollRoute extends GoRouteData with $GalleryScrollRoute {
  const GalleryScrollRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      sharedAxisPage(state, const GalleryScrollDemoScreen());
}
