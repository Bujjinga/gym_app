import 'package:flutter/material.dart';

import '../../../core/domain/pulse_enums.dart';
import '../../../l10n/gen/app_localizations.dart';

String cardioTypeLabel(AppLocalizations l10n, CardioType t) => switch (t) {
      CardioType.walk => l10n.cardioWalk,
      CardioType.run => l10n.cardioRun,
      CardioType.hike => l10n.cardioHike,
      CardioType.cycle => l10n.cardioCycle,
      CardioType.treadmill => l10n.cardioTreadmill,
      CardioType.other => l10n.cardioOther,
    };

IconData cardioTypeIcon(CardioType t) => switch (t) {
      CardioType.walk => Icons.directions_walk_rounded,
      CardioType.run => Icons.directions_run_rounded,
      CardioType.hike => Icons.hiking_rounded,
      CardioType.cycle => Icons.directions_bike_rounded,
      CardioType.treadmill => Icons.fitness_center_rounded,
      CardioType.other => Icons.bolt_rounded,
    };
