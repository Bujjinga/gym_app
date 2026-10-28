import '../../../core/domain/pulse_enums.dart';
import '../../../l10n/gen/app_localizations.dart';

String measurementLabel(AppLocalizations l10n, MeasurementType t) => switch (t) {
      MeasurementType.weight => l10n.measureWeight,
      MeasurementType.bodyFat => l10n.measureBodyFat,
      MeasurementType.waist => l10n.measureWaist,
      MeasurementType.chest => l10n.measureChest,
      MeasurementType.hips => l10n.measureHips,
      MeasurementType.arm => l10n.measureArm,
      MeasurementType.thigh => l10n.measureThigh,
      MeasurementType.neck => l10n.measureNeck,
    };

String mealLabel(AppLocalizations l10n, MealType m) => switch (m) {
      MealType.breakfast => l10n.mealBreakfast,
      MealType.lunch => l10n.mealLunch,
      MealType.dinner => l10n.mealDinner,
      MealType.snack => l10n.mealSnack,
    };
