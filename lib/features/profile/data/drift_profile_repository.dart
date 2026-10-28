import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/database_provider.dart';
import '../../../core/database/json_columns.dart';
import '../../../core/domain/pulse_enums.dart';
import '../domain/profile_repository.dart';
import '../domain/user_profile.dart';

part 'drift_profile_repository.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) => DriftProfileRepository(ref.watch(appDatabaseProvider));

/// Live profile for the UI (theme, units, goals).
@Riverpod(keepAlive: true)
Stream<UserProfile> userProfile(Ref ref) => ref.watch(profileRepositoryProvider).watch();

class DriftProfileRepository implements ProfileRepository {
  DriftProfileRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<UserProfile> watch() async* {
    await _ensureExists();
    yield* _db.profileDao.watchProfile().where((r) => r != null).map((r) => _toDomain(r!));
  }

  @override
  Future<UserProfile> get() async => _toDomain(await _ensureExists());

  @override
  Future<void> save(UserProfile p) => _db.profileDao.upsert(
        UsersProfileCompanion.insert(
          id: Value(p.id),
          displayName: Value(p.displayName),
          avatarPath: Value(p.avatarPath),
          goal: Value(p.goal),
          experience: Value(p.experience),
          equipment: Value(encodeEnumList(p.equipment)),
          trainingDaysPerWeek: Value(p.trainingDaysPerWeek),
          heightCm: Value(p.heightCm),
          weightKg: Value(p.weightKg),
          birthYear: Value(p.birthYear),
          sex: Value(p.sex),
          weightUnit: Value(p.weightUnit),
          distanceUnit: Value(p.distanceUnit),
          themeMode: Value(p.themeMode),
          moveGoalKcal: Value(p.moveGoalKcal),
          exerciseGoalMin: Value(p.exerciseGoalMin),
          stepsGoal: Value(p.stepsGoal),
          waterGoalMl: Value(p.waterGoalMl),
          onboardingComplete: Value(p.onboardingComplete),
          xp: Value(p.xp),
          dashboardCards: Value(encodeStringList(p.dashboardCards)),
          remindersEnabled: Value(p.remindersEnabled),
          reminderMinute: Value(p.reminderMinute),
        ),
      );

  Future<UserProfileRow> _ensureExists() async {
    final existing = await _db.profileDao.getProfile();
    if (existing != null) return existing;
    await _db.profileDao.upsert(UsersProfileCompanion.insert());
    return (await _db.profileDao.getProfile())!;
  }

  static UserProfile _toDomain(UserProfileRow r) => UserProfile(
        id: r.id,
        displayName: r.displayName,
        avatarPath: r.avatarPath,
        goal: r.goal,
        experience: r.experience,
        equipment: decodeEnumList(r.equipment, Equipment.values),
        trainingDaysPerWeek: r.trainingDaysPerWeek,
        heightCm: r.heightCm,
        weightKg: r.weightKg,
        birthYear: r.birthYear,
        sex: r.sex,
        weightUnit: r.weightUnit,
        distanceUnit: r.distanceUnit,
        themeMode: r.themeMode,
        moveGoalKcal: r.moveGoalKcal,
        exerciseGoalMin: r.exerciseGoalMin,
        stepsGoal: r.stepsGoal,
        waterGoalMl: r.waterGoalMl,
        onboardingComplete: r.onboardingComplete,
        xp: r.xp,
        dashboardCards: decodeStringList(r.dashboardCards),
        remindersEnabled: r.remindersEnabled,
        reminderMinute: r.reminderMinute,
      );
}
