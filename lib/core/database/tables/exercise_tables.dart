import 'package:drift/drift.dart';

import '../../domain/pulse_enums.dart';
import '../sync_columns.dart';

/// Exercise library: bundled seed exercises plus the user's custom ones.
/// Seed rows use deterministic UUIDs so every device shares the same ids.
@DataClassName('ExerciseRow')
class Exercises extends Table with SyncColumns {
  TextColumn get slug => text().nullable()();
  TextColumn get name => text()();
  TextColumn get primaryMuscle => textEnum<MuscleGroup>()();

  /// JSON list of [MuscleGroup] names.
  TextColumn get secondaryMuscles => text().withDefault(const Constant('[]'))();
  TextColumn get equipment => textEnum<Equipment>()();
  TextColumn get difficulty => textEnum<Difficulty>()();
  TextColumn get movementPattern => textEnum<MovementPattern>()();

  /// JSON list of step-by-step instructions.
  TextColumn get instructions => text().withDefault(const Constant('[]'))();

  /// JSON list of common mistakes.
  TextColumn get mistakes => text().withDefault(const Constant('[]'))();
  TextColumn get animationAsset => text().nullable()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
}
