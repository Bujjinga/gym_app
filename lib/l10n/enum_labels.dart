import '../core/domain/pulse_enums.dart';
import 'gen/app_localizations.dart';

/// Localized display names for the shared enums.
extension EnumLabels on AppLocalizations {
  String muscle(MuscleGroup m) => switch (m) {
        MuscleGroup.chest => muscleChest,
        MuscleGroup.back => muscleBack,
        MuscleGroup.lats => muscleLats,
        MuscleGroup.traps => muscleTraps,
        MuscleGroup.shoulders => muscleShoulders,
        MuscleGroup.biceps => muscleBiceps,
        MuscleGroup.triceps => muscleTriceps,
        MuscleGroup.forearms => muscleForearms,
        MuscleGroup.abs => muscleAbs,
        MuscleGroup.obliques => muscleObliques,
        MuscleGroup.lowerBack => muscleLowerBack,
        MuscleGroup.glutes => muscleGlutes,
        MuscleGroup.quads => muscleQuads,
        MuscleGroup.hamstrings => muscleHamstrings,
        MuscleGroup.adductors => muscleAdductors,
        MuscleGroup.calves => muscleCalves,
        MuscleGroup.fullBody => muscleFullBody,
      };

  String equipmentName(Equipment e) => switch (e) {
        Equipment.barbell => equipBarbell,
        Equipment.dumbbell => equipDumbbell,
        Equipment.kettlebell => equipKettlebell,
        Equipment.machine => equipMachine,
        Equipment.cable => equipCable,
        Equipment.smithMachine => equipSmithMachine,
        Equipment.ezBar => equipEzBar,
        Equipment.trapBar => equipTrapBar,
        Equipment.band => equipBand,
        Equipment.bodyweight => equipBodyweight,
        Equipment.pullUpBar => equipPullUpBar,
        Equipment.medicineBall => equipMedicineBall,
        Equipment.cardioMachine => equipCardioMachine,
      };

  String difficultyName(Difficulty d) => switch (d) {
        Difficulty.beginner => expBeginner,
        Difficulty.intermediate => expIntermediate,
        Difficulty.advanced => expAdvanced,
      };

  String setTypeName(SetType t) => switch (t) {
        SetType.warmup => setWarmup,
        SetType.working => setWorking,
        SetType.drop => setDrop,
        SetType.failure => setFailure,
      };

  String recordTypeName(RecordType t) => switch (t) {
        RecordType.maxWeight => prMaxWeight,
        RecordType.estimatedOneRepMax => prEstimatedOneRm,
        RecordType.maxReps => prMaxReps,
        RecordType.maxVolume => prMaxVolume,
      };

  String weightUnitName(WeightUnit u) => u == WeightUnit.kg ? unitKg : unitLb;

  String distanceUnitName(DistanceUnit u) => u == DistanceUnit.km ? unitKm : unitMi;
}
