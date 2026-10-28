import 'package:flutter/material.dart';

import '../../../l10n/gen/app_localizations.dart';

/// Title, description and icon for each achievement key.
(String, String, IconData) achievementInfo(AppLocalizations l10n, String key) => switch (key) {
      'first_workout' => (l10n.achFirstWorkout, l10n.achFirstWorkoutBody, Icons.flag_rounded),
      'workouts_10' => (l10n.achWorkouts10, l10n.achWorkouts10Body, Icons.fitness_center_rounded),
      'workouts_50' => (l10n.achWorkouts50, l10n.achWorkouts50Body, Icons.workspace_premium_rounded),
      'workouts_100' => (l10n.achWorkouts100, l10n.achWorkouts100Body, Icons.military_tech_rounded),
      'streak_7' => (l10n.achStreak7, l10n.achStreak7Body, Icons.local_fire_department_rounded),
      'streak_30' => (l10n.achStreak30, l10n.achStreak30Body, Icons.whatshot_rounded),
      'volume_10k' => (l10n.achVolume10k, l10n.achVolume10kBody, Icons.scale_rounded),
      'first_pr' => (l10n.achFirstPr, l10n.achFirstPrBody, Icons.emoji_events_rounded),
      'prs_25' => (l10n.achPrs25, l10n.achPrs25Body, Icons.stars_rounded),
      'first_cardio' => (l10n.achFirstCardio, l10n.achFirstCardioBody, Icons.directions_run_rounded),
      'distance_50' => (l10n.achDistance50, l10n.achDistance50Body, Icons.route_rounded),
      'steps_10k' => (l10n.achSteps10k, l10n.achSteps10kBody, Icons.directions_walk_rounded),
      _ => (key, '', Icons.star_rounded),
    };
