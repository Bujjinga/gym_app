// Shared vocabulary used by the database, domain models and seed data.
// Values are persisted by name, so renaming one is a data migration.

enum TrainingGoal { buildMuscle, loseFat, endurance, generalFitness }

enum ExperienceLevel { beginner, intermediate, advanced }

enum Sex { female, male, other, preferNotToSay }

enum WeightUnit { kg, lb }

enum DistanceUnit { km, mi }

enum AppThemeMode { dark, light, system }

enum MuscleGroup {
  chest,
  back,
  lats,
  traps,
  shoulders,
  biceps,
  triceps,
  forearms,
  abs,
  obliques,
  lowerBack,
  glutes,
  quads,
  hamstrings,
  adductors,
  calves,
  fullBody,
}

enum Equipment {
  barbell,
  dumbbell,
  kettlebell,
  machine,
  cable,
  smithMachine,
  ezBar,
  trapBar,
  band,
  bodyweight,
  pullUpBar,
  medicineBall,
  cardioMachine,
}

enum Difficulty { beginner, intermediate, advanced }

enum MovementPattern {
  horizontalPush,
  verticalPush,
  horizontalPull,
  verticalPull,
  squat,
  hinge,
  lunge,
  carry,
  core,
  isolation,
  plyometric,
  conditioning,
}

enum SetType { warmup, working, drop, failure }

/// How a workout was recorded: live on the phone, or entered afterwards.
enum WorkoutSource { live, manual }

enum CardioType { walk, run, hike, cycle, treadmill, other }

enum CardioSource { gps, indoor, manual, health }

enum MeasurementType { weight, bodyFat, waist, chest, hips, arm, thigh, neck }

enum MealType { breakfast, lunch, dinner, snack }

enum PhotoPose { front, side, back }

enum RecordType { maxWeight, estimatedOneRepMax, maxReps, maxVolume }

enum ActivitySource { device, health, manual }
