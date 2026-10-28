import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Fade-through: the outgoing page fades out, then the incoming page fades
/// and scales up from 92%. Used for top-level/tab-like navigation.
Widget fadeThroughTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final reduced = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
  final enter = CurvedAnimation(parent: animation, curve: const Interval(0.3, 1, curve: Curves.easeOutCubic));
  final exit = CurvedAnimation(parent: secondaryAnimation, curve: const Interval(0, 0.3, curve: Curves.easeIn));
  return FadeTransition(
    opacity: ReverseAnimation(exit),
    child: FadeTransition(
      opacity: enter,
      child: reduced
          ? child
          : ScaleTransition(scale: Tween(begin: 0.92, end: 1.0).animate(enter), child: child),
    ),
  );
}

/// Horizontal shared-axis: pages slide 30px and cross-fade. Used for
/// forward/back flows (onboarding steps, drill-down detail pages).
Widget sharedAxisTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final reduced = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
  final enter = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
  final exit = CurvedAnimation(parent: secondaryAnimation, curve: Curves.easeOutCubic);
  final distance = reduced ? 0.0 : 30.0;
  return AnimatedBuilder(
    animation: Listenable.merge([enter, exit]),
    child: child,
    builder: (context, child) {
      final dx = distance * (1 - enter.value) - distance * exit.value;
      final opacity = (Interval(0.3, 1).transform(enter.value)) * (1 - Interval(0, 0.3).transform(exit.value));
      return Opacity(
        opacity: opacity,
        child: Transform.translate(offset: Offset(dx, 0), child: child),
      );
    },
  );
}

/// Theme-level builder so plain `Navigator.push` routes also fade-through.
class FadeThroughPageTransitionsBuilder extends PageTransitionsBuilder {
  const FadeThroughPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      fadeThroughTransition(context, animation, secondaryAnimation, child);
}

/// go_router page helpers.
CustomTransitionPage<void> fadeThroughPage(GoRouterState state, Widget child) => CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 360),
      transitionsBuilder: fadeThroughTransition,
    );

CustomTransitionPage<void> sharedAxisPage(GoRouterState state, Widget child) => CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 360),
      transitionsBuilder: sharedAxisTransition,
    );
