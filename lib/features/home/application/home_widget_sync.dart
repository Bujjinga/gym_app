import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/platform/platform_capabilities.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../l10n/system_l10n.dart';
import '../../plans/application/plan_providers.dart';
import '../../profile/data/drift_profile_repository.dart';
import 'home_providers.dart';

part 'home_widget_sync.g.dart';

/// Values the native home screen widgets read (keys match
/// ios/PulseWidgets/PulseWidgets.swift and android PulseWidgetProvider.kt).
@riverpod
Map<String, Object> homeWidgetData(Ref ref) {
  final p = ref.watch(userProfileProvider).value;
  final day = ref.watch(todayActivityProvider).value;
  final next = ref.watch(nextWorkoutProvider).value;
  final l10n = systemL10n();
  return {
    'steps': day?.steps ?? 0,
    'steps_goal': p?.stepsGoal ?? 10000,
    'move_kcal': day?.activeKcal.round() ?? 0,
    'move_goal': p?.moveGoalKcal ?? 500,
    'exercise_min': (day?.exerciseMin ?? 0) + ref.watch(todayWorkoutMinutesProvider),
    'exercise_goal': p?.exerciseGoalMin ?? 30,
    'streak': ref.watch(trainingStreakProvider),
    'next_workout': next?.day.name ?? l10n.widgetNoPlan,
    'next_label': next == null ? '' : (next.isToday ? l10n.widgetToday : l10n.widgetNext),
  };
}

/// Pushes [homeWidgetDataProvider] to the iOS/Android widgets, at most once a second.
void startHomeWidgetSync(ProviderContainer container) {
  if (!container.read(platformCapabilitiesProvider).hasHomeWidgets) return;
  Timer? debounce;
  unawaited(HomeWidget.setAppGroupId(pulseAppGroup));
  container.listen(homeWidgetDataProvider, fireImmediately: true, (_, data) {
    debounce?.cancel();
    debounce = Timer(const Duration(seconds: 1), () async {
      try {
        for (final MapEntry(:key, :value) in data.entries) {
          await HomeWidget.saveWidgetData(key, value);
        }
        await HomeWidget.updateWidget(iOSName: 'PulseWidget', qualifiedAndroidName: 'com.example.gym_app.PulseWidgetProvider');
      } catch (e) {
        debugPrint('Home widget update failed: $e'); // e.g. iOS extension not added yet
      }
    });
  });
}
