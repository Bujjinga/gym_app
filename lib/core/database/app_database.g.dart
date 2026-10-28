// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersProfileTable extends UsersProfile
    with TableInfo<$UsersProfileTable, UserProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($UsersProfileTable.$convertersyncStatus);
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarPathMeta = const VerificationMeta(
    'avatarPath',
  );
  @override
  late final GeneratedColumn<String> avatarPath = GeneratedColumn<String>(
    'avatar_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TrainingGoal?, String> goal =
      GeneratedColumn<String>(
        'goal',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<TrainingGoal?>($UsersProfileTable.$convertergoaln);
  @override
  late final GeneratedColumnWithTypeConverter<ExperienceLevel?, String>
  experience = GeneratedColumn<String>(
    'experience',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<ExperienceLevel?>($UsersProfileTable.$converterexperiencen);
  static const VerificationMeta _equipmentMeta = const VerificationMeta(
    'equipment',
  );
  @override
  late final GeneratedColumn<String> equipment = GeneratedColumn<String>(
    'equipment',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _trainingDaysPerWeekMeta =
      const VerificationMeta('trainingDaysPerWeek');
  @override
  late final GeneratedColumn<int> trainingDaysPerWeek = GeneratedColumn<int>(
    'training_days_per_week',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightCmMeta = const VerificationMeta(
    'heightCm',
  );
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
    'height_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthYearMeta = const VerificationMeta(
    'birthYear',
  );
  @override
  late final GeneratedColumn<int> birthYear = GeneratedColumn<int>(
    'birth_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Sex?, String> sex =
      GeneratedColumn<String>(
        'sex',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Sex?>($UsersProfileTable.$convertersexn);
  @override
  late final GeneratedColumnWithTypeConverter<WeightUnit, String> weightUnit =
      GeneratedColumn<String>(
        'weight_unit',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(WeightUnit.kg.name),
      ).withConverter<WeightUnit>($UsersProfileTable.$converterweightUnit);
  @override
  late final GeneratedColumnWithTypeConverter<DistanceUnit, String>
  distanceUnit = GeneratedColumn<String>(
    'distance_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(DistanceUnit.km.name),
  ).withConverter<DistanceUnit>($UsersProfileTable.$converterdistanceUnit);
  @override
  late final GeneratedColumnWithTypeConverter<AppThemeMode, String> themeMode =
      GeneratedColumn<String>(
        'theme_mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(AppThemeMode.dark.name),
      ).withConverter<AppThemeMode>($UsersProfileTable.$converterthemeMode);
  static const VerificationMeta _moveGoalKcalMeta = const VerificationMeta(
    'moveGoalKcal',
  );
  @override
  late final GeneratedColumn<int> moveGoalKcal = GeneratedColumn<int>(
    'move_goal_kcal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(500),
  );
  static const VerificationMeta _exerciseGoalMinMeta = const VerificationMeta(
    'exerciseGoalMin',
  );
  @override
  late final GeneratedColumn<int> exerciseGoalMin = GeneratedColumn<int>(
    'exercise_goal_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _stepsGoalMeta = const VerificationMeta(
    'stepsGoal',
  );
  @override
  late final GeneratedColumn<int> stepsGoal = GeneratedColumn<int>(
    'steps_goal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10000),
  );
  static const VerificationMeta _waterGoalMlMeta = const VerificationMeta(
    'waterGoalMl',
  );
  @override
  late final GeneratedColumn<int> waterGoalMl = GeneratedColumn<int>(
    'water_goal_ml',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2500),
  );
  static const VerificationMeta _onboardingCompleteMeta =
      const VerificationMeta('onboardingComplete');
  @override
  late final GeneratedColumn<bool> onboardingComplete = GeneratedColumn<bool>(
    'onboarding_complete',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarding_complete" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _xpMeta = const VerificationMeta('xp');
  @override
  late final GeneratedColumn<int> xp = GeneratedColumn<int>(
    'xp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _dashboardCardsMeta = const VerificationMeta(
    'dashboardCards',
  );
  @override
  late final GeneratedColumn<String> dashboardCards = GeneratedColumn<String>(
    'dashboard_cards',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _remindersEnabledMeta = const VerificationMeta(
    'remindersEnabled',
  );
  @override
  late final GeneratedColumn<bool> remindersEnabled = GeneratedColumn<bool>(
    'reminders_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminders_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reminderMinuteMeta = const VerificationMeta(
    'reminderMinute',
  );
  @override
  late final GeneratedColumn<int> reminderMinute = GeneratedColumn<int>(
    'reminder_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(18 * 60),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    displayName,
    avatarPath,
    goal,
    experience,
    equipment,
    trainingDaysPerWeek,
    heightCm,
    weightKg,
    birthYear,
    sex,
    weightUnit,
    distanceUnit,
    themeMode,
    moveGoalKcal,
    exerciseGoalMin,
    stepsGoal,
    waterGoalMl,
    onboardingComplete,
    xp,
    dashboardCards,
    remindersEnabled,
    reminderMinute,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users_profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('avatar_path')) {
      context.handle(
        _avatarPathMeta,
        avatarPath.isAcceptableOrUnknown(data['avatar_path']!, _avatarPathMeta),
      );
    }
    if (data.containsKey('equipment')) {
      context.handle(
        _equipmentMeta,
        equipment.isAcceptableOrUnknown(data['equipment']!, _equipmentMeta),
      );
    }
    if (data.containsKey('training_days_per_week')) {
      context.handle(
        _trainingDaysPerWeekMeta,
        trainingDaysPerWeek.isAcceptableOrUnknown(
          data['training_days_per_week']!,
          _trainingDaysPerWeekMeta,
        ),
      );
    }
    if (data.containsKey('height_cm')) {
      context.handle(
        _heightCmMeta,
        heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta),
      );
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('birth_year')) {
      context.handle(
        _birthYearMeta,
        birthYear.isAcceptableOrUnknown(data['birth_year']!, _birthYearMeta),
      );
    }
    if (data.containsKey('move_goal_kcal')) {
      context.handle(
        _moveGoalKcalMeta,
        moveGoalKcal.isAcceptableOrUnknown(
          data['move_goal_kcal']!,
          _moveGoalKcalMeta,
        ),
      );
    }
    if (data.containsKey('exercise_goal_min')) {
      context.handle(
        _exerciseGoalMinMeta,
        exerciseGoalMin.isAcceptableOrUnknown(
          data['exercise_goal_min']!,
          _exerciseGoalMinMeta,
        ),
      );
    }
    if (data.containsKey('steps_goal')) {
      context.handle(
        _stepsGoalMeta,
        stepsGoal.isAcceptableOrUnknown(data['steps_goal']!, _stepsGoalMeta),
      );
    }
    if (data.containsKey('water_goal_ml')) {
      context.handle(
        _waterGoalMlMeta,
        waterGoalMl.isAcceptableOrUnknown(
          data['water_goal_ml']!,
          _waterGoalMlMeta,
        ),
      );
    }
    if (data.containsKey('onboarding_complete')) {
      context.handle(
        _onboardingCompleteMeta,
        onboardingComplete.isAcceptableOrUnknown(
          data['onboarding_complete']!,
          _onboardingCompleteMeta,
        ),
      );
    }
    if (data.containsKey('xp')) {
      context.handle(_xpMeta, xp.isAcceptableOrUnknown(data['xp']!, _xpMeta));
    }
    if (data.containsKey('dashboard_cards')) {
      context.handle(
        _dashboardCardsMeta,
        dashboardCards.isAcceptableOrUnknown(
          data['dashboard_cards']!,
          _dashboardCardsMeta,
        ),
      );
    }
    if (data.containsKey('reminders_enabled')) {
      context.handle(
        _remindersEnabledMeta,
        remindersEnabled.isAcceptableOrUnknown(
          data['reminders_enabled']!,
          _remindersEnabledMeta,
        ),
      );
    }
    if (data.containsKey('reminder_minute')) {
      context.handle(
        _reminderMinuteMeta,
        reminderMinute.isAcceptableOrUnknown(
          data['reminder_minute']!,
          _reminderMinuteMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $UsersProfileTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      avatarPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_path'],
      ),
      goal: $UsersProfileTable.$convertergoaln.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}goal'],
        ),
      ),
      experience: $UsersProfileTable.$converterexperiencen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}experience'],
        ),
      ),
      equipment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment'],
      )!,
      trainingDaysPerWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}training_days_per_week'],
      ),
      heightCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_cm'],
      ),
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      birthYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birth_year'],
      ),
      sex: $UsersProfileTable.$convertersexn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sex'],
        ),
      ),
      weightUnit: $UsersProfileTable.$converterweightUnit.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}weight_unit'],
        )!,
      ),
      distanceUnit: $UsersProfileTable.$converterdistanceUnit.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}distance_unit'],
        )!,
      ),
      themeMode: $UsersProfileTable.$converterthemeMode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}theme_mode'],
        )!,
      ),
      moveGoalKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}move_goal_kcal'],
      )!,
      exerciseGoalMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_goal_min'],
      )!,
      stepsGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps_goal'],
      )!,
      waterGoalMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}water_goal_ml'],
      )!,
      onboardingComplete: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarding_complete'],
      )!,
      xp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}xp'],
      )!,
      dashboardCards: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dashboard_cards'],
      )!,
      remindersEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminders_enabled'],
      )!,
      reminderMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_minute'],
      )!,
    );
  }

  @override
  $UsersProfileTable createAlias(String alias) {
    return $UsersProfileTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<TrainingGoal, String, String> $convertergoal =
      const EnumNameConverter<TrainingGoal>(TrainingGoal.values);
  static JsonTypeConverter2<TrainingGoal?, String?, String?> $convertergoaln =
      JsonTypeConverter2.asNullable($convertergoal);
  static JsonTypeConverter2<ExperienceLevel, String, String>
  $converterexperience = const EnumNameConverter<ExperienceLevel>(
    ExperienceLevel.values,
  );
  static JsonTypeConverter2<ExperienceLevel?, String?, String?>
  $converterexperiencen = JsonTypeConverter2.asNullable($converterexperience);
  static JsonTypeConverter2<Sex, String, String> $convertersex =
      const EnumNameConverter<Sex>(Sex.values);
  static JsonTypeConverter2<Sex?, String?, String?> $convertersexn =
      JsonTypeConverter2.asNullable($convertersex);
  static JsonTypeConverter2<WeightUnit, String, String> $converterweightUnit =
      const EnumNameConverter<WeightUnit>(WeightUnit.values);
  static JsonTypeConverter2<DistanceUnit, String, String>
  $converterdistanceUnit = const EnumNameConverter<DistanceUnit>(
    DistanceUnit.values,
  );
  static JsonTypeConverter2<AppThemeMode, String, String> $converterthemeMode =
      const EnumNameConverter<AppThemeMode>(AppThemeMode.values);
}

class UserProfileRow extends DataClass implements Insertable<UserProfileRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String? displayName;
  final String? avatarPath;
  final TrainingGoal? goal;
  final ExperienceLevel? experience;

  /// JSON list of [Equipment] names.
  final String equipment;
  final int? trainingDaysPerWeek;
  final double? heightCm;
  final double? weightKg;
  final int? birthYear;
  final Sex? sex;
  final WeightUnit weightUnit;
  final DistanceUnit distanceUnit;
  final AppThemeMode themeMode;
  final int moveGoalKcal;
  final int exerciseGoalMin;
  final int stepsGoal;
  final int waterGoalMl;
  final bool onboardingComplete;
  final int xp;

  /// Home dashboard card order (JSON list); hidden cards are prefixed with `!`. Added in schema v2.
  final String dashboardCards;

  /// Local reminders on/off and their time of day (minutes after midnight). Added in schema v3.
  final bool remindersEnabled;
  final int reminderMinute;
  const UserProfileRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    this.displayName,
    this.avatarPath,
    this.goal,
    this.experience,
    required this.equipment,
    this.trainingDaysPerWeek,
    this.heightCm,
    this.weightKg,
    this.birthYear,
    this.sex,
    required this.weightUnit,
    required this.distanceUnit,
    required this.themeMode,
    required this.moveGoalKcal,
    required this.exerciseGoalMin,
    required this.stepsGoal,
    required this.waterGoalMl,
    required this.onboardingComplete,
    required this.xp,
    required this.dashboardCards,
    required this.remindersEnabled,
    required this.reminderMinute,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $UsersProfileTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || avatarPath != null) {
      map['avatar_path'] = Variable<String>(avatarPath);
    }
    if (!nullToAbsent || goal != null) {
      map['goal'] = Variable<String>(
        $UsersProfileTable.$convertergoaln.toSql(goal),
      );
    }
    if (!nullToAbsent || experience != null) {
      map['experience'] = Variable<String>(
        $UsersProfileTable.$converterexperiencen.toSql(experience),
      );
    }
    map['equipment'] = Variable<String>(equipment);
    if (!nullToAbsent || trainingDaysPerWeek != null) {
      map['training_days_per_week'] = Variable<int>(trainingDaysPerWeek);
    }
    if (!nullToAbsent || heightCm != null) {
      map['height_cm'] = Variable<double>(heightCm);
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || birthYear != null) {
      map['birth_year'] = Variable<int>(birthYear);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(
        $UsersProfileTable.$convertersexn.toSql(sex),
      );
    }
    {
      map['weight_unit'] = Variable<String>(
        $UsersProfileTable.$converterweightUnit.toSql(weightUnit),
      );
    }
    {
      map['distance_unit'] = Variable<String>(
        $UsersProfileTable.$converterdistanceUnit.toSql(distanceUnit),
      );
    }
    {
      map['theme_mode'] = Variable<String>(
        $UsersProfileTable.$converterthemeMode.toSql(themeMode),
      );
    }
    map['move_goal_kcal'] = Variable<int>(moveGoalKcal);
    map['exercise_goal_min'] = Variable<int>(exerciseGoalMin);
    map['steps_goal'] = Variable<int>(stepsGoal);
    map['water_goal_ml'] = Variable<int>(waterGoalMl);
    map['onboarding_complete'] = Variable<bool>(onboardingComplete);
    map['xp'] = Variable<int>(xp);
    map['dashboard_cards'] = Variable<String>(dashboardCards);
    map['reminders_enabled'] = Variable<bool>(remindersEnabled);
    map['reminder_minute'] = Variable<int>(reminderMinute);
    return map;
  }

  UsersProfileCompanion toCompanion(bool nullToAbsent) {
    return UsersProfileCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      avatarPath: avatarPath == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarPath),
      goal: goal == null && nullToAbsent ? const Value.absent() : Value(goal),
      experience: experience == null && nullToAbsent
          ? const Value.absent()
          : Value(experience),
      equipment: Value(equipment),
      trainingDaysPerWeek: trainingDaysPerWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(trainingDaysPerWeek),
      heightCm: heightCm == null && nullToAbsent
          ? const Value.absent()
          : Value(heightCm),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      birthYear: birthYear == null && nullToAbsent
          ? const Value.absent()
          : Value(birthYear),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      weightUnit: Value(weightUnit),
      distanceUnit: Value(distanceUnit),
      themeMode: Value(themeMode),
      moveGoalKcal: Value(moveGoalKcal),
      exerciseGoalMin: Value(exerciseGoalMin),
      stepsGoal: Value(stepsGoal),
      waterGoalMl: Value(waterGoalMl),
      onboardingComplete: Value(onboardingComplete),
      xp: Value(xp),
      dashboardCards: Value(dashboardCards),
      remindersEnabled: Value(remindersEnabled),
      reminderMinute: Value(reminderMinute),
    );
  }

  factory UserProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $UsersProfileTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      displayName: serializer.fromJson<String?>(json['displayName']),
      avatarPath: serializer.fromJson<String?>(json['avatarPath']),
      goal: $UsersProfileTable.$convertergoaln.fromJson(
        serializer.fromJson<String?>(json['goal']),
      ),
      experience: $UsersProfileTable.$converterexperiencen.fromJson(
        serializer.fromJson<String?>(json['experience']),
      ),
      equipment: serializer.fromJson<String>(json['equipment']),
      trainingDaysPerWeek: serializer.fromJson<int?>(
        json['trainingDaysPerWeek'],
      ),
      heightCm: serializer.fromJson<double?>(json['heightCm']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      birthYear: serializer.fromJson<int?>(json['birthYear']),
      sex: $UsersProfileTable.$convertersexn.fromJson(
        serializer.fromJson<String?>(json['sex']),
      ),
      weightUnit: $UsersProfileTable.$converterweightUnit.fromJson(
        serializer.fromJson<String>(json['weightUnit']),
      ),
      distanceUnit: $UsersProfileTable.$converterdistanceUnit.fromJson(
        serializer.fromJson<String>(json['distanceUnit']),
      ),
      themeMode: $UsersProfileTable.$converterthemeMode.fromJson(
        serializer.fromJson<String>(json['themeMode']),
      ),
      moveGoalKcal: serializer.fromJson<int>(json['moveGoalKcal']),
      exerciseGoalMin: serializer.fromJson<int>(json['exerciseGoalMin']),
      stepsGoal: serializer.fromJson<int>(json['stepsGoal']),
      waterGoalMl: serializer.fromJson<int>(json['waterGoalMl']),
      onboardingComplete: serializer.fromJson<bool>(json['onboardingComplete']),
      xp: serializer.fromJson<int>(json['xp']),
      dashboardCards: serializer.fromJson<String>(json['dashboardCards']),
      remindersEnabled: serializer.fromJson<bool>(json['remindersEnabled']),
      reminderMinute: serializer.fromJson<int>(json['reminderMinute']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $UsersProfileTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'displayName': serializer.toJson<String?>(displayName),
      'avatarPath': serializer.toJson<String?>(avatarPath),
      'goal': serializer.toJson<String?>(
        $UsersProfileTable.$convertergoaln.toJson(goal),
      ),
      'experience': serializer.toJson<String?>(
        $UsersProfileTable.$converterexperiencen.toJson(experience),
      ),
      'equipment': serializer.toJson<String>(equipment),
      'trainingDaysPerWeek': serializer.toJson<int?>(trainingDaysPerWeek),
      'heightCm': serializer.toJson<double?>(heightCm),
      'weightKg': serializer.toJson<double?>(weightKg),
      'birthYear': serializer.toJson<int?>(birthYear),
      'sex': serializer.toJson<String?>(
        $UsersProfileTable.$convertersexn.toJson(sex),
      ),
      'weightUnit': serializer.toJson<String>(
        $UsersProfileTable.$converterweightUnit.toJson(weightUnit),
      ),
      'distanceUnit': serializer.toJson<String>(
        $UsersProfileTable.$converterdistanceUnit.toJson(distanceUnit),
      ),
      'themeMode': serializer.toJson<String>(
        $UsersProfileTable.$converterthemeMode.toJson(themeMode),
      ),
      'moveGoalKcal': serializer.toJson<int>(moveGoalKcal),
      'exerciseGoalMin': serializer.toJson<int>(exerciseGoalMin),
      'stepsGoal': serializer.toJson<int>(stepsGoal),
      'waterGoalMl': serializer.toJson<int>(waterGoalMl),
      'onboardingComplete': serializer.toJson<bool>(onboardingComplete),
      'xp': serializer.toJson<int>(xp),
      'dashboardCards': serializer.toJson<String>(dashboardCards),
      'remindersEnabled': serializer.toJson<bool>(remindersEnabled),
      'reminderMinute': serializer.toJson<int>(reminderMinute),
    };
  }

  UserProfileRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    Value<String?> displayName = const Value.absent(),
    Value<String?> avatarPath = const Value.absent(),
    Value<TrainingGoal?> goal = const Value.absent(),
    Value<ExperienceLevel?> experience = const Value.absent(),
    String? equipment,
    Value<int?> trainingDaysPerWeek = const Value.absent(),
    Value<double?> heightCm = const Value.absent(),
    Value<double?> weightKg = const Value.absent(),
    Value<int?> birthYear = const Value.absent(),
    Value<Sex?> sex = const Value.absent(),
    WeightUnit? weightUnit,
    DistanceUnit? distanceUnit,
    AppThemeMode? themeMode,
    int? moveGoalKcal,
    int? exerciseGoalMin,
    int? stepsGoal,
    int? waterGoalMl,
    bool? onboardingComplete,
    int? xp,
    String? dashboardCards,
    bool? remindersEnabled,
    int? reminderMinute,
  }) => UserProfileRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    displayName: displayName.present ? displayName.value : this.displayName,
    avatarPath: avatarPath.present ? avatarPath.value : this.avatarPath,
    goal: goal.present ? goal.value : this.goal,
    experience: experience.present ? experience.value : this.experience,
    equipment: equipment ?? this.equipment,
    trainingDaysPerWeek: trainingDaysPerWeek.present
        ? trainingDaysPerWeek.value
        : this.trainingDaysPerWeek,
    heightCm: heightCm.present ? heightCm.value : this.heightCm,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    birthYear: birthYear.present ? birthYear.value : this.birthYear,
    sex: sex.present ? sex.value : this.sex,
    weightUnit: weightUnit ?? this.weightUnit,
    distanceUnit: distanceUnit ?? this.distanceUnit,
    themeMode: themeMode ?? this.themeMode,
    moveGoalKcal: moveGoalKcal ?? this.moveGoalKcal,
    exerciseGoalMin: exerciseGoalMin ?? this.exerciseGoalMin,
    stepsGoal: stepsGoal ?? this.stepsGoal,
    waterGoalMl: waterGoalMl ?? this.waterGoalMl,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    xp: xp ?? this.xp,
    dashboardCards: dashboardCards ?? this.dashboardCards,
    remindersEnabled: remindersEnabled ?? this.remindersEnabled,
    reminderMinute: reminderMinute ?? this.reminderMinute,
  );
  UserProfileRow copyWithCompanion(UsersProfileCompanion data) {
    return UserProfileRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      avatarPath: data.avatarPath.present
          ? data.avatarPath.value
          : this.avatarPath,
      goal: data.goal.present ? data.goal.value : this.goal,
      experience: data.experience.present
          ? data.experience.value
          : this.experience,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      trainingDaysPerWeek: data.trainingDaysPerWeek.present
          ? data.trainingDaysPerWeek.value
          : this.trainingDaysPerWeek,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      birthYear: data.birthYear.present ? data.birthYear.value : this.birthYear,
      sex: data.sex.present ? data.sex.value : this.sex,
      weightUnit: data.weightUnit.present
          ? data.weightUnit.value
          : this.weightUnit,
      distanceUnit: data.distanceUnit.present
          ? data.distanceUnit.value
          : this.distanceUnit,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      moveGoalKcal: data.moveGoalKcal.present
          ? data.moveGoalKcal.value
          : this.moveGoalKcal,
      exerciseGoalMin: data.exerciseGoalMin.present
          ? data.exerciseGoalMin.value
          : this.exerciseGoalMin,
      stepsGoal: data.stepsGoal.present ? data.stepsGoal.value : this.stepsGoal,
      waterGoalMl: data.waterGoalMl.present
          ? data.waterGoalMl.value
          : this.waterGoalMl,
      onboardingComplete: data.onboardingComplete.present
          ? data.onboardingComplete.value
          : this.onboardingComplete,
      xp: data.xp.present ? data.xp.value : this.xp,
      dashboardCards: data.dashboardCards.present
          ? data.dashboardCards.value
          : this.dashboardCards,
      remindersEnabled: data.remindersEnabled.present
          ? data.remindersEnabled.value
          : this.remindersEnabled,
      reminderMinute: data.reminderMinute.present
          ? data.reminderMinute.value
          : this.reminderMinute,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('displayName: $displayName, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('goal: $goal, ')
          ..write('experience: $experience, ')
          ..write('equipment: $equipment, ')
          ..write('trainingDaysPerWeek: $trainingDaysPerWeek, ')
          ..write('heightCm: $heightCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('birthYear: $birthYear, ')
          ..write('sex: $sex, ')
          ..write('weightUnit: $weightUnit, ')
          ..write('distanceUnit: $distanceUnit, ')
          ..write('themeMode: $themeMode, ')
          ..write('moveGoalKcal: $moveGoalKcal, ')
          ..write('exerciseGoalMin: $exerciseGoalMin, ')
          ..write('stepsGoal: $stepsGoal, ')
          ..write('waterGoalMl: $waterGoalMl, ')
          ..write('onboardingComplete: $onboardingComplete, ')
          ..write('xp: $xp, ')
          ..write('dashboardCards: $dashboardCards, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write('reminderMinute: $reminderMinute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    displayName,
    avatarPath,
    goal,
    experience,
    equipment,
    trainingDaysPerWeek,
    heightCm,
    weightKg,
    birthYear,
    sex,
    weightUnit,
    distanceUnit,
    themeMode,
    moveGoalKcal,
    exerciseGoalMin,
    stepsGoal,
    waterGoalMl,
    onboardingComplete,
    xp,
    dashboardCards,
    remindersEnabled,
    reminderMinute,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.displayName == this.displayName &&
          other.avatarPath == this.avatarPath &&
          other.goal == this.goal &&
          other.experience == this.experience &&
          other.equipment == this.equipment &&
          other.trainingDaysPerWeek == this.trainingDaysPerWeek &&
          other.heightCm == this.heightCm &&
          other.weightKg == this.weightKg &&
          other.birthYear == this.birthYear &&
          other.sex == this.sex &&
          other.weightUnit == this.weightUnit &&
          other.distanceUnit == this.distanceUnit &&
          other.themeMode == this.themeMode &&
          other.moveGoalKcal == this.moveGoalKcal &&
          other.exerciseGoalMin == this.exerciseGoalMin &&
          other.stepsGoal == this.stepsGoal &&
          other.waterGoalMl == this.waterGoalMl &&
          other.onboardingComplete == this.onboardingComplete &&
          other.xp == this.xp &&
          other.dashboardCards == this.dashboardCards &&
          other.remindersEnabled == this.remindersEnabled &&
          other.reminderMinute == this.reminderMinute);
}

class UsersProfileCompanion extends UpdateCompanion<UserProfileRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String?> displayName;
  final Value<String?> avatarPath;
  final Value<TrainingGoal?> goal;
  final Value<ExperienceLevel?> experience;
  final Value<String> equipment;
  final Value<int?> trainingDaysPerWeek;
  final Value<double?> heightCm;
  final Value<double?> weightKg;
  final Value<int?> birthYear;
  final Value<Sex?> sex;
  final Value<WeightUnit> weightUnit;
  final Value<DistanceUnit> distanceUnit;
  final Value<AppThemeMode> themeMode;
  final Value<int> moveGoalKcal;
  final Value<int> exerciseGoalMin;
  final Value<int> stepsGoal;
  final Value<int> waterGoalMl;
  final Value<bool> onboardingComplete;
  final Value<int> xp;
  final Value<String> dashboardCards;
  final Value<bool> remindersEnabled;
  final Value<int> reminderMinute;
  final Value<int> rowid;
  const UsersProfileCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.displayName = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.goal = const Value.absent(),
    this.experience = const Value.absent(),
    this.equipment = const Value.absent(),
    this.trainingDaysPerWeek = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.birthYear = const Value.absent(),
    this.sex = const Value.absent(),
    this.weightUnit = const Value.absent(),
    this.distanceUnit = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.moveGoalKcal = const Value.absent(),
    this.exerciseGoalMin = const Value.absent(),
    this.stepsGoal = const Value.absent(),
    this.waterGoalMl = const Value.absent(),
    this.onboardingComplete = const Value.absent(),
    this.xp = const Value.absent(),
    this.dashboardCards = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.reminderMinute = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersProfileCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.displayName = const Value.absent(),
    this.avatarPath = const Value.absent(),
    this.goal = const Value.absent(),
    this.experience = const Value.absent(),
    this.equipment = const Value.absent(),
    this.trainingDaysPerWeek = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.birthYear = const Value.absent(),
    this.sex = const Value.absent(),
    this.weightUnit = const Value.absent(),
    this.distanceUnit = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.moveGoalKcal = const Value.absent(),
    this.exerciseGoalMin = const Value.absent(),
    this.stepsGoal = const Value.absent(),
    this.waterGoalMl = const Value.absent(),
    this.onboardingComplete = const Value.absent(),
    this.xp = const Value.absent(),
    this.dashboardCards = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.reminderMinute = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<UserProfileRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? displayName,
    Expression<String>? avatarPath,
    Expression<String>? goal,
    Expression<String>? experience,
    Expression<String>? equipment,
    Expression<int>? trainingDaysPerWeek,
    Expression<double>? heightCm,
    Expression<double>? weightKg,
    Expression<int>? birthYear,
    Expression<String>? sex,
    Expression<String>? weightUnit,
    Expression<String>? distanceUnit,
    Expression<String>? themeMode,
    Expression<int>? moveGoalKcal,
    Expression<int>? exerciseGoalMin,
    Expression<int>? stepsGoal,
    Expression<int>? waterGoalMl,
    Expression<bool>? onboardingComplete,
    Expression<int>? xp,
    Expression<String>? dashboardCards,
    Expression<bool>? remindersEnabled,
    Expression<int>? reminderMinute,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (displayName != null) 'display_name': displayName,
      if (avatarPath != null) 'avatar_path': avatarPath,
      if (goal != null) 'goal': goal,
      if (experience != null) 'experience': experience,
      if (equipment != null) 'equipment': equipment,
      if (trainingDaysPerWeek != null)
        'training_days_per_week': trainingDaysPerWeek,
      if (heightCm != null) 'height_cm': heightCm,
      if (weightKg != null) 'weight_kg': weightKg,
      if (birthYear != null) 'birth_year': birthYear,
      if (sex != null) 'sex': sex,
      if (weightUnit != null) 'weight_unit': weightUnit,
      if (distanceUnit != null) 'distance_unit': distanceUnit,
      if (themeMode != null) 'theme_mode': themeMode,
      if (moveGoalKcal != null) 'move_goal_kcal': moveGoalKcal,
      if (exerciseGoalMin != null) 'exercise_goal_min': exerciseGoalMin,
      if (stepsGoal != null) 'steps_goal': stepsGoal,
      if (waterGoalMl != null) 'water_goal_ml': waterGoalMl,
      if (onboardingComplete != null) 'onboarding_complete': onboardingComplete,
      if (xp != null) 'xp': xp,
      if (dashboardCards != null) 'dashboard_cards': dashboardCards,
      if (remindersEnabled != null) 'reminders_enabled': remindersEnabled,
      if (reminderMinute != null) 'reminder_minute': reminderMinute,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersProfileCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String?>? displayName,
    Value<String?>? avatarPath,
    Value<TrainingGoal?>? goal,
    Value<ExperienceLevel?>? experience,
    Value<String>? equipment,
    Value<int?>? trainingDaysPerWeek,
    Value<double?>? heightCm,
    Value<double?>? weightKg,
    Value<int?>? birthYear,
    Value<Sex?>? sex,
    Value<WeightUnit>? weightUnit,
    Value<DistanceUnit>? distanceUnit,
    Value<AppThemeMode>? themeMode,
    Value<int>? moveGoalKcal,
    Value<int>? exerciseGoalMin,
    Value<int>? stepsGoal,
    Value<int>? waterGoalMl,
    Value<bool>? onboardingComplete,
    Value<int>? xp,
    Value<String>? dashboardCards,
    Value<bool>? remindersEnabled,
    Value<int>? reminderMinute,
    Value<int>? rowid,
  }) {
    return UsersProfileCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      displayName: displayName ?? this.displayName,
      avatarPath: avatarPath ?? this.avatarPath,
      goal: goal ?? this.goal,
      experience: experience ?? this.experience,
      equipment: equipment ?? this.equipment,
      trainingDaysPerWeek: trainingDaysPerWeek ?? this.trainingDaysPerWeek,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      birthYear: birthYear ?? this.birthYear,
      sex: sex ?? this.sex,
      weightUnit: weightUnit ?? this.weightUnit,
      distanceUnit: distanceUnit ?? this.distanceUnit,
      themeMode: themeMode ?? this.themeMode,
      moveGoalKcal: moveGoalKcal ?? this.moveGoalKcal,
      exerciseGoalMin: exerciseGoalMin ?? this.exerciseGoalMin,
      stepsGoal: stepsGoal ?? this.stepsGoal,
      waterGoalMl: waterGoalMl ?? this.waterGoalMl,
      onboardingComplete: onboardingComplete ?? this.onboardingComplete,
      xp: xp ?? this.xp,
      dashboardCards: dashboardCards ?? this.dashboardCards,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      reminderMinute: reminderMinute ?? this.reminderMinute,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $UsersProfileTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (avatarPath.present) {
      map['avatar_path'] = Variable<String>(avatarPath.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String>(
        $UsersProfileTable.$convertergoaln.toSql(goal.value),
      );
    }
    if (experience.present) {
      map['experience'] = Variable<String>(
        $UsersProfileTable.$converterexperiencen.toSql(experience.value),
      );
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(equipment.value);
    }
    if (trainingDaysPerWeek.present) {
      map['training_days_per_week'] = Variable<int>(trainingDaysPerWeek.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (birthYear.present) {
      map['birth_year'] = Variable<int>(birthYear.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(
        $UsersProfileTable.$convertersexn.toSql(sex.value),
      );
    }
    if (weightUnit.present) {
      map['weight_unit'] = Variable<String>(
        $UsersProfileTable.$converterweightUnit.toSql(weightUnit.value),
      );
    }
    if (distanceUnit.present) {
      map['distance_unit'] = Variable<String>(
        $UsersProfileTable.$converterdistanceUnit.toSql(distanceUnit.value),
      );
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(
        $UsersProfileTable.$converterthemeMode.toSql(themeMode.value),
      );
    }
    if (moveGoalKcal.present) {
      map['move_goal_kcal'] = Variable<int>(moveGoalKcal.value);
    }
    if (exerciseGoalMin.present) {
      map['exercise_goal_min'] = Variable<int>(exerciseGoalMin.value);
    }
    if (stepsGoal.present) {
      map['steps_goal'] = Variable<int>(stepsGoal.value);
    }
    if (waterGoalMl.present) {
      map['water_goal_ml'] = Variable<int>(waterGoalMl.value);
    }
    if (onboardingComplete.present) {
      map['onboarding_complete'] = Variable<bool>(onboardingComplete.value);
    }
    if (xp.present) {
      map['xp'] = Variable<int>(xp.value);
    }
    if (dashboardCards.present) {
      map['dashboard_cards'] = Variable<String>(dashboardCards.value);
    }
    if (remindersEnabled.present) {
      map['reminders_enabled'] = Variable<bool>(remindersEnabled.value);
    }
    if (reminderMinute.present) {
      map['reminder_minute'] = Variable<int>(reminderMinute.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersProfileCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('displayName: $displayName, ')
          ..write('avatarPath: $avatarPath, ')
          ..write('goal: $goal, ')
          ..write('experience: $experience, ')
          ..write('equipment: $equipment, ')
          ..write('trainingDaysPerWeek: $trainingDaysPerWeek, ')
          ..write('heightCm: $heightCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('birthYear: $birthYear, ')
          ..write('sex: $sex, ')
          ..write('weightUnit: $weightUnit, ')
          ..write('distanceUnit: $distanceUnit, ')
          ..write('themeMode: $themeMode, ')
          ..write('moveGoalKcal: $moveGoalKcal, ')
          ..write('exerciseGoalMin: $exerciseGoalMin, ')
          ..write('stepsGoal: $stepsGoal, ')
          ..write('waterGoalMl: $waterGoalMl, ')
          ..write('onboardingComplete: $onboardingComplete, ')
          ..write('xp: $xp, ')
          ..write('dashboardCards: $dashboardCards, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write('reminderMinute: $reminderMinute, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, ExerciseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($ExercisesTable.$convertersyncStatus);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MuscleGroup, String>
  primaryMuscle = GeneratedColumn<String>(
    'primary_muscle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<MuscleGroup>($ExercisesTable.$converterprimaryMuscle);
  static const VerificationMeta _secondaryMusclesMeta = const VerificationMeta(
    'secondaryMuscles',
  );
  @override
  late final GeneratedColumn<String> secondaryMuscles = GeneratedColumn<String>(
    'secondary_muscles',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Equipment, String> equipment =
      GeneratedColumn<String>(
        'equipment',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Equipment>($ExercisesTable.$converterequipment);
  @override
  late final GeneratedColumnWithTypeConverter<Difficulty, String> difficulty =
      GeneratedColumn<String>(
        'difficulty',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Difficulty>($ExercisesTable.$converterdifficulty);
  @override
  late final GeneratedColumnWithTypeConverter<MovementPattern, String>
  movementPattern = GeneratedColumn<String>(
    'movement_pattern',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<MovementPattern>($ExercisesTable.$convertermovementPattern);
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _mistakesMeta = const VerificationMeta(
    'mistakes',
  );
  @override
  late final GeneratedColumn<String> mistakes = GeneratedColumn<String>(
    'mistakes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _animationAssetMeta = const VerificationMeta(
    'animationAsset',
  );
  @override
  late final GeneratedColumn<String> animationAsset = GeneratedColumn<String>(
    'animation_asset',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    slug,
    name,
    primaryMuscle,
    secondaryMuscles,
    equipment,
    difficulty,
    movementPattern,
    instructions,
    mistakes,
    animationAsset,
    isCustom,
    isFavorite,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('secondary_muscles')) {
      context.handle(
        _secondaryMusclesMeta,
        secondaryMuscles.isAcceptableOrUnknown(
          data['secondary_muscles']!,
          _secondaryMusclesMeta,
        ),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('mistakes')) {
      context.handle(
        _mistakesMeta,
        mistakes.isAcceptableOrUnknown(data['mistakes']!, _mistakesMeta),
      );
    }
    if (data.containsKey('animation_asset')) {
      context.handle(
        _animationAssetMeta,
        animationAsset.isAcceptableOrUnknown(
          data['animation_asset']!,
          _animationAssetMeta,
        ),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $ExercisesTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      primaryMuscle: $ExercisesTable.$converterprimaryMuscle.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}primary_muscle'],
        )!,
      ),
      secondaryMuscles: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secondary_muscles'],
      )!,
      equipment: $ExercisesTable.$converterequipment.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}equipment'],
        )!,
      ),
      difficulty: $ExercisesTable.$converterdifficulty.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}difficulty'],
        )!,
      ),
      movementPattern: $ExercisesTable.$convertermovementPattern.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}movement_pattern'],
        )!,
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      )!,
      mistakes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mistakes'],
      )!,
      animationAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}animation_asset'],
      ),
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<MuscleGroup, String, String>
  $converterprimaryMuscle = const EnumNameConverter<MuscleGroup>(
    MuscleGroup.values,
  );
  static JsonTypeConverter2<Equipment, String, String> $converterequipment =
      const EnumNameConverter<Equipment>(Equipment.values);
  static JsonTypeConverter2<Difficulty, String, String> $converterdifficulty =
      const EnumNameConverter<Difficulty>(Difficulty.values);
  static JsonTypeConverter2<MovementPattern, String, String>
  $convertermovementPattern = const EnumNameConverter<MovementPattern>(
    MovementPattern.values,
  );
}

class ExerciseRow extends DataClass implements Insertable<ExerciseRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String? slug;
  final String name;
  final MuscleGroup primaryMuscle;

  /// JSON list of [MuscleGroup] names.
  final String secondaryMuscles;
  final Equipment equipment;
  final Difficulty difficulty;
  final MovementPattern movementPattern;

  /// JSON list of step-by-step instructions.
  final String instructions;

  /// JSON list of common mistakes.
  final String mistakes;
  final String? animationAsset;
  final bool isCustom;
  final bool isFavorite;
  const ExerciseRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    this.slug,
    required this.name,
    required this.primaryMuscle,
    required this.secondaryMuscles,
    required this.equipment,
    required this.difficulty,
    required this.movementPattern,
    required this.instructions,
    required this.mistakes,
    this.animationAsset,
    required this.isCustom,
    required this.isFavorite,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $ExercisesTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    if (!nullToAbsent || slug != null) {
      map['slug'] = Variable<String>(slug);
    }
    map['name'] = Variable<String>(name);
    {
      map['primary_muscle'] = Variable<String>(
        $ExercisesTable.$converterprimaryMuscle.toSql(primaryMuscle),
      );
    }
    map['secondary_muscles'] = Variable<String>(secondaryMuscles);
    {
      map['equipment'] = Variable<String>(
        $ExercisesTable.$converterequipment.toSql(equipment),
      );
    }
    {
      map['difficulty'] = Variable<String>(
        $ExercisesTable.$converterdifficulty.toSql(difficulty),
      );
    }
    {
      map['movement_pattern'] = Variable<String>(
        $ExercisesTable.$convertermovementPattern.toSql(movementPattern),
      );
    }
    map['instructions'] = Variable<String>(instructions);
    map['mistakes'] = Variable<String>(mistakes);
    if (!nullToAbsent || animationAsset != null) {
      map['animation_asset'] = Variable<String>(animationAsset);
    }
    map['is_custom'] = Variable<bool>(isCustom);
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      slug: slug == null && nullToAbsent ? const Value.absent() : Value(slug),
      name: Value(name),
      primaryMuscle: Value(primaryMuscle),
      secondaryMuscles: Value(secondaryMuscles),
      equipment: Value(equipment),
      difficulty: Value(difficulty),
      movementPattern: Value(movementPattern),
      instructions: Value(instructions),
      mistakes: Value(mistakes),
      animationAsset: animationAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(animationAsset),
      isCustom: Value(isCustom),
      isFavorite: Value(isFavorite),
    );
  }

  factory ExerciseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $ExercisesTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      slug: serializer.fromJson<String?>(json['slug']),
      name: serializer.fromJson<String>(json['name']),
      primaryMuscle: $ExercisesTable.$converterprimaryMuscle.fromJson(
        serializer.fromJson<String>(json['primaryMuscle']),
      ),
      secondaryMuscles: serializer.fromJson<String>(json['secondaryMuscles']),
      equipment: $ExercisesTable.$converterequipment.fromJson(
        serializer.fromJson<String>(json['equipment']),
      ),
      difficulty: $ExercisesTable.$converterdifficulty.fromJson(
        serializer.fromJson<String>(json['difficulty']),
      ),
      movementPattern: $ExercisesTable.$convertermovementPattern.fromJson(
        serializer.fromJson<String>(json['movementPattern']),
      ),
      instructions: serializer.fromJson<String>(json['instructions']),
      mistakes: serializer.fromJson<String>(json['mistakes']),
      animationAsset: serializer.fromJson<String?>(json['animationAsset']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $ExercisesTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'slug': serializer.toJson<String?>(slug),
      'name': serializer.toJson<String>(name),
      'primaryMuscle': serializer.toJson<String>(
        $ExercisesTable.$converterprimaryMuscle.toJson(primaryMuscle),
      ),
      'secondaryMuscles': serializer.toJson<String>(secondaryMuscles),
      'equipment': serializer.toJson<String>(
        $ExercisesTable.$converterequipment.toJson(equipment),
      ),
      'difficulty': serializer.toJson<String>(
        $ExercisesTable.$converterdifficulty.toJson(difficulty),
      ),
      'movementPattern': serializer.toJson<String>(
        $ExercisesTable.$convertermovementPattern.toJson(movementPattern),
      ),
      'instructions': serializer.toJson<String>(instructions),
      'mistakes': serializer.toJson<String>(mistakes),
      'animationAsset': serializer.toJson<String?>(animationAsset),
      'isCustom': serializer.toJson<bool>(isCustom),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  ExerciseRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    Value<String?> slug = const Value.absent(),
    String? name,
    MuscleGroup? primaryMuscle,
    String? secondaryMuscles,
    Equipment? equipment,
    Difficulty? difficulty,
    MovementPattern? movementPattern,
    String? instructions,
    String? mistakes,
    Value<String?> animationAsset = const Value.absent(),
    bool? isCustom,
    bool? isFavorite,
  }) => ExerciseRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    slug: slug.present ? slug.value : this.slug,
    name: name ?? this.name,
    primaryMuscle: primaryMuscle ?? this.primaryMuscle,
    secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
    equipment: equipment ?? this.equipment,
    difficulty: difficulty ?? this.difficulty,
    movementPattern: movementPattern ?? this.movementPattern,
    instructions: instructions ?? this.instructions,
    mistakes: mistakes ?? this.mistakes,
    animationAsset: animationAsset.present
        ? animationAsset.value
        : this.animationAsset,
    isCustom: isCustom ?? this.isCustom,
    isFavorite: isFavorite ?? this.isFavorite,
  );
  ExerciseRow copyWithCompanion(ExercisesCompanion data) {
    return ExerciseRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      slug: data.slug.present ? data.slug.value : this.slug,
      name: data.name.present ? data.name.value : this.name,
      primaryMuscle: data.primaryMuscle.present
          ? data.primaryMuscle.value
          : this.primaryMuscle,
      secondaryMuscles: data.secondaryMuscles.present
          ? data.secondaryMuscles.value
          : this.secondaryMuscles,
      equipment: data.equipment.present ? data.equipment.value : this.equipment,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      movementPattern: data.movementPattern.present
          ? data.movementPattern.value
          : this.movementPattern,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      mistakes: data.mistakes.present ? data.mistakes.value : this.mistakes,
      animationAsset: data.animationAsset.present
          ? data.animationAsset.value
          : this.animationAsset,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('primaryMuscle: $primaryMuscle, ')
          ..write('secondaryMuscles: $secondaryMuscles, ')
          ..write('equipment: $equipment, ')
          ..write('difficulty: $difficulty, ')
          ..write('movementPattern: $movementPattern, ')
          ..write('instructions: $instructions, ')
          ..write('mistakes: $mistakes, ')
          ..write('animationAsset: $animationAsset, ')
          ..write('isCustom: $isCustom, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    slug,
    name,
    primaryMuscle,
    secondaryMuscles,
    equipment,
    difficulty,
    movementPattern,
    instructions,
    mistakes,
    animationAsset,
    isCustom,
    isFavorite,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.slug == this.slug &&
          other.name == this.name &&
          other.primaryMuscle == this.primaryMuscle &&
          other.secondaryMuscles == this.secondaryMuscles &&
          other.equipment == this.equipment &&
          other.difficulty == this.difficulty &&
          other.movementPattern == this.movementPattern &&
          other.instructions == this.instructions &&
          other.mistakes == this.mistakes &&
          other.animationAsset == this.animationAsset &&
          other.isCustom == this.isCustom &&
          other.isFavorite == this.isFavorite);
}

class ExercisesCompanion extends UpdateCompanion<ExerciseRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String?> slug;
  final Value<String> name;
  final Value<MuscleGroup> primaryMuscle;
  final Value<String> secondaryMuscles;
  final Value<Equipment> equipment;
  final Value<Difficulty> difficulty;
  final Value<MovementPattern> movementPattern;
  final Value<String> instructions;
  final Value<String> mistakes;
  final Value<String?> animationAsset;
  final Value<bool> isCustom;
  final Value<bool> isFavorite;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.primaryMuscle = const Value.absent(),
    this.secondaryMuscles = const Value.absent(),
    this.equipment = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.movementPattern = const Value.absent(),
    this.instructions = const Value.absent(),
    this.mistakes = const Value.absent(),
    this.animationAsset = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.slug = const Value.absent(),
    required String name,
    required MuscleGroup primaryMuscle,
    this.secondaryMuscles = const Value.absent(),
    required Equipment equipment,
    required Difficulty difficulty,
    required MovementPattern movementPattern,
    this.instructions = const Value.absent(),
    this.mistakes = const Value.absent(),
    this.animationAsset = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       primaryMuscle = Value(primaryMuscle),
       equipment = Value(equipment),
       difficulty = Value(difficulty),
       movementPattern = Value(movementPattern);
  static Insertable<ExerciseRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? slug,
    Expression<String>? name,
    Expression<String>? primaryMuscle,
    Expression<String>? secondaryMuscles,
    Expression<String>? equipment,
    Expression<String>? difficulty,
    Expression<String>? movementPattern,
    Expression<String>? instructions,
    Expression<String>? mistakes,
    Expression<String>? animationAsset,
    Expression<bool>? isCustom,
    Expression<bool>? isFavorite,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (primaryMuscle != null) 'primary_muscle': primaryMuscle,
      if (secondaryMuscles != null) 'secondary_muscles': secondaryMuscles,
      if (equipment != null) 'equipment': equipment,
      if (difficulty != null) 'difficulty': difficulty,
      if (movementPattern != null) 'movement_pattern': movementPattern,
      if (instructions != null) 'instructions': instructions,
      if (mistakes != null) 'mistakes': mistakes,
      if (animationAsset != null) 'animation_asset': animationAsset,
      if (isCustom != null) 'is_custom': isCustom,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String?>? slug,
    Value<String>? name,
    Value<MuscleGroup>? primaryMuscle,
    Value<String>? secondaryMuscles,
    Value<Equipment>? equipment,
    Value<Difficulty>? difficulty,
    Value<MovementPattern>? movementPattern,
    Value<String>? instructions,
    Value<String>? mistakes,
    Value<String?>? animationAsset,
    Value<bool>? isCustom,
    Value<bool>? isFavorite,
    Value<int>? rowid,
  }) {
    return ExercisesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      primaryMuscle: primaryMuscle ?? this.primaryMuscle,
      secondaryMuscles: secondaryMuscles ?? this.secondaryMuscles,
      equipment: equipment ?? this.equipment,
      difficulty: difficulty ?? this.difficulty,
      movementPattern: movementPattern ?? this.movementPattern,
      instructions: instructions ?? this.instructions,
      mistakes: mistakes ?? this.mistakes,
      animationAsset: animationAsset ?? this.animationAsset,
      isCustom: isCustom ?? this.isCustom,
      isFavorite: isFavorite ?? this.isFavorite,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $ExercisesTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (primaryMuscle.present) {
      map['primary_muscle'] = Variable<String>(
        $ExercisesTable.$converterprimaryMuscle.toSql(primaryMuscle.value),
      );
    }
    if (secondaryMuscles.present) {
      map['secondary_muscles'] = Variable<String>(secondaryMuscles.value);
    }
    if (equipment.present) {
      map['equipment'] = Variable<String>(
        $ExercisesTable.$converterequipment.toSql(equipment.value),
      );
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(
        $ExercisesTable.$converterdifficulty.toSql(difficulty.value),
      );
    }
    if (movementPattern.present) {
      map['movement_pattern'] = Variable<String>(
        $ExercisesTable.$convertermovementPattern.toSql(movementPattern.value),
      );
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (mistakes.present) {
      map['mistakes'] = Variable<String>(mistakes.value);
    }
    if (animationAsset.present) {
      map['animation_asset'] = Variable<String>(animationAsset.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('primaryMuscle: $primaryMuscle, ')
          ..write('secondaryMuscles: $secondaryMuscles, ')
          ..write('equipment: $equipment, ')
          ..write('difficulty: $difficulty, ')
          ..write('movementPattern: $movementPattern, ')
          ..write('instructions: $instructions, ')
          ..write('mistakes: $mistakes, ')
          ..write('animationAsset: $animationAsset, ')
          ..write('isCustom: $isCustom, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutTemplatesTable extends WorkoutTemplates
    with TableInfo<$WorkoutTemplatesTable, WorkoutTemplateRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($WorkoutTemplatesTable.$convertersyncStatus);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exercisesMeta = const VerificationMeta(
    'exercises',
  );
  @override
  late final GeneratedColumn<String> exercises = GeneratedColumn<String>(
    'exercises',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    name,
    notes,
    exercises,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutTemplateRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('exercises')) {
      context.handle(
        _exercisesMeta,
        exercises.isAcceptableOrUnknown(data['exercises']!, _exercisesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTemplateRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTemplateRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $WorkoutTemplatesTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      exercises: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercises'],
      )!,
    );
  }

  @override
  $WorkoutTemplatesTable createAlias(String alias) {
    return $WorkoutTemplatesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class WorkoutTemplateRow extends DataClass
    implements Insertable<WorkoutTemplateRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String name;
  final String? notes;
  final String exercises;
  const WorkoutTemplateRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.name,
    this.notes,
    required this.exercises,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $WorkoutTemplatesTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['exercises'] = Variable<String>(exercises);
    return map;
  }

  WorkoutTemplatesCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTemplatesCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      name: Value(name),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      exercises: Value(exercises),
    );
  }

  factory WorkoutTemplateRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTemplateRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $WorkoutTemplatesTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      name: serializer.fromJson<String>(json['name']),
      notes: serializer.fromJson<String?>(json['notes']),
      exercises: serializer.fromJson<String>(json['exercises']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $WorkoutTemplatesTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'name': serializer.toJson<String>(name),
      'notes': serializer.toJson<String?>(notes),
      'exercises': serializer.toJson<String>(exercises),
    };
  }

  WorkoutTemplateRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? name,
    Value<String?> notes = const Value.absent(),
    String? exercises,
  }) => WorkoutTemplateRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    name: name ?? this.name,
    notes: notes.present ? notes.value : this.notes,
    exercises: exercises ?? this.exercises,
  );
  WorkoutTemplateRow copyWithCompanion(WorkoutTemplatesCompanion data) {
    return WorkoutTemplateRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      name: data.name.present ? data.name.value : this.name,
      notes: data.notes.present ? data.notes.value : this.notes,
      exercises: data.exercises.present ? data.exercises.value : this.exercises,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplateRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('exercises: $exercises')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    name,
    notes,
    exercises,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTemplateRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.name == this.name &&
          other.notes == this.notes &&
          other.exercises == this.exercises);
}

class WorkoutTemplatesCompanion extends UpdateCompanion<WorkoutTemplateRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> name;
  final Value<String?> notes;
  final Value<String> exercises;
  final Value<int> rowid;
  const WorkoutTemplatesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.name = const Value.absent(),
    this.notes = const Value.absent(),
    this.exercises = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutTemplatesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String name,
    this.notes = const Value.absent(),
    this.exercises = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<WorkoutTemplateRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? name,
    Expression<String>? notes,
    Expression<String>? exercises,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (name != null) 'name': name,
      if (notes != null) 'notes': notes,
      if (exercises != null) 'exercises': exercises,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? name,
    Value<String?>? notes,
    Value<String>? exercises,
    Value<int>? rowid,
  }) {
    return WorkoutTemplatesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      exercises: exercises ?? this.exercises,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $WorkoutTemplatesTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (exercises.present) {
      map['exercises'] = Variable<String>(exercises.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('exercises: $exercises, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSessionsTable extends WorkoutSessions
    with TableInfo<$WorkoutSessionsTable, WorkoutSessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($WorkoutSessionsTable.$convertersyncStatus);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _planDayIdMeta = const VerificationMeta(
    'planDayId',
  );
  @override
  late final GeneratedColumn<String> planDayId = GeneratedColumn<String>(
    'plan_day_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalVolumeKgMeta = const VerificationMeta(
    'totalVolumeKg',
  );
  @override
  late final GeneratedColumn<double> totalVolumeKg = GeneratedColumn<double>(
    'total_volume_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _caloriesKcalMeta = const VerificationMeta(
    'caloriesKcal',
  );
  @override
  late final GeneratedColumn<double> caloriesKcal = GeneratedColumn<double>(
    'calories_kcal',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<WorkoutSource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(WorkoutSource.live.name),
      ).withConverter<WorkoutSource>($WorkoutSessionsTable.$convertersource);
  static const VerificationMeta _healthSyncedMeta = const VerificationMeta(
    'healthSynced',
  );
  @override
  late final GeneratedColumn<bool> healthSynced = GeneratedColumn<bool>(
    'health_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("health_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    name,
    templateId,
    planDayId,
    startedAt,
    endedAt,
    notes,
    totalVolumeKg,
    caloriesKcal,
    source,
    healthSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkoutSessionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    }
    if (data.containsKey('plan_day_id')) {
      context.handle(
        _planDayIdMeta,
        planDayId.isAcceptableOrUnknown(data['plan_day_id']!, _planDayIdMeta),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('total_volume_kg')) {
      context.handle(
        _totalVolumeKgMeta,
        totalVolumeKg.isAcceptableOrUnknown(
          data['total_volume_kg']!,
          _totalVolumeKgMeta,
        ),
      );
    }
    if (data.containsKey('calories_kcal')) {
      context.handle(
        _caloriesKcalMeta,
        caloriesKcal.isAcceptableOrUnknown(
          data['calories_kcal']!,
          _caloriesKcalMeta,
        ),
      );
    }
    if (data.containsKey('health_synced')) {
      context.handle(
        _healthSyncedMeta,
        healthSynced.isAcceptableOrUnknown(
          data['health_synced']!,
          _healthSyncedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSessionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $WorkoutSessionsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      ),
      planDayId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_day_id'],
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      totalVolumeKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_volume_kg'],
      )!,
      caloriesKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories_kcal'],
      ),
      source: $WorkoutSessionsTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
      healthSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}health_synced'],
      )!,
    );
  }

  @override
  $WorkoutSessionsTable createAlias(String alias) {
    return $WorkoutSessionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<WorkoutSource, String, String> $convertersource =
      const EnumNameConverter<WorkoutSource>(WorkoutSource.values);
}

class WorkoutSessionRow extends DataClass
    implements Insertable<WorkoutSessionRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String name;
  final String? templateId;
  final String? planDayId;
  final DateTime startedAt;
  final DateTime? endedAt;
  final String? notes;
  final double totalVolumeKg;
  final double? caloriesKcal;
  final WorkoutSource source;
  final bool healthSynced;
  const WorkoutSessionRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.name,
    this.templateId,
    this.planDayId,
    required this.startedAt,
    this.endedAt,
    this.notes,
    required this.totalVolumeKg,
    this.caloriesKcal,
    required this.source,
    required this.healthSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $WorkoutSessionsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || templateId != null) {
      map['template_id'] = Variable<String>(templateId);
    }
    if (!nullToAbsent || planDayId != null) {
      map['plan_day_id'] = Variable<String>(planDayId);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['total_volume_kg'] = Variable<double>(totalVolumeKg);
    if (!nullToAbsent || caloriesKcal != null) {
      map['calories_kcal'] = Variable<double>(caloriesKcal);
    }
    {
      map['source'] = Variable<String>(
        $WorkoutSessionsTable.$convertersource.toSql(source),
      );
    }
    map['health_synced'] = Variable<bool>(healthSynced);
    return map;
  }

  WorkoutSessionsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSessionsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      name: Value(name),
      templateId: templateId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateId),
      planDayId: planDayId == null && nullToAbsent
          ? const Value.absent()
          : Value(planDayId),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      totalVolumeKg: Value(totalVolumeKg),
      caloriesKcal: caloriesKcal == null && nullToAbsent
          ? const Value.absent()
          : Value(caloriesKcal),
      source: Value(source),
      healthSynced: Value(healthSynced),
    );
  }

  factory WorkoutSessionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSessionRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $WorkoutSessionsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      name: serializer.fromJson<String>(json['name']),
      templateId: serializer.fromJson<String?>(json['templateId']),
      planDayId: serializer.fromJson<String?>(json['planDayId']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      totalVolumeKg: serializer.fromJson<double>(json['totalVolumeKg']),
      caloriesKcal: serializer.fromJson<double?>(json['caloriesKcal']),
      source: $WorkoutSessionsTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
      healthSynced: serializer.fromJson<bool>(json['healthSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $WorkoutSessionsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'name': serializer.toJson<String>(name),
      'templateId': serializer.toJson<String?>(templateId),
      'planDayId': serializer.toJson<String?>(planDayId),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'notes': serializer.toJson<String?>(notes),
      'totalVolumeKg': serializer.toJson<double>(totalVolumeKg),
      'caloriesKcal': serializer.toJson<double?>(caloriesKcal),
      'source': serializer.toJson<String>(
        $WorkoutSessionsTable.$convertersource.toJson(source),
      ),
      'healthSynced': serializer.toJson<bool>(healthSynced),
    };
  }

  WorkoutSessionRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? name,
    Value<String?> templateId = const Value.absent(),
    Value<String?> planDayId = const Value.absent(),
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    double? totalVolumeKg,
    Value<double?> caloriesKcal = const Value.absent(),
    WorkoutSource? source,
    bool? healthSynced,
  }) => WorkoutSessionRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    name: name ?? this.name,
    templateId: templateId.present ? templateId.value : this.templateId,
    planDayId: planDayId.present ? planDayId.value : this.planDayId,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    notes: notes.present ? notes.value : this.notes,
    totalVolumeKg: totalVolumeKg ?? this.totalVolumeKg,
    caloriesKcal: caloriesKcal.present ? caloriesKcal.value : this.caloriesKcal,
    source: source ?? this.source,
    healthSynced: healthSynced ?? this.healthSynced,
  );
  WorkoutSessionRow copyWithCompanion(WorkoutSessionsCompanion data) {
    return WorkoutSessionRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      name: data.name.present ? data.name.value : this.name,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      planDayId: data.planDayId.present ? data.planDayId.value : this.planDayId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      totalVolumeKg: data.totalVolumeKg.present
          ? data.totalVolumeKg.value
          : this.totalVolumeKg,
      caloriesKcal: data.caloriesKcal.present
          ? data.caloriesKcal.value
          : this.caloriesKcal,
      source: data.source.present ? data.source.value : this.source,
      healthSynced: data.healthSynced.present
          ? data.healthSynced.value
          : this.healthSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('name: $name, ')
          ..write('templateId: $templateId, ')
          ..write('planDayId: $planDayId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('notes: $notes, ')
          ..write('totalVolumeKg: $totalVolumeKg, ')
          ..write('caloriesKcal: $caloriesKcal, ')
          ..write('source: $source, ')
          ..write('healthSynced: $healthSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    name,
    templateId,
    planDayId,
    startedAt,
    endedAt,
    notes,
    totalVolumeKg,
    caloriesKcal,
    source,
    healthSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSessionRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.name == this.name &&
          other.templateId == this.templateId &&
          other.planDayId == this.planDayId &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.notes == this.notes &&
          other.totalVolumeKg == this.totalVolumeKg &&
          other.caloriesKcal == this.caloriesKcal &&
          other.source == this.source &&
          other.healthSynced == this.healthSynced);
}

class WorkoutSessionsCompanion extends UpdateCompanion<WorkoutSessionRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> name;
  final Value<String?> templateId;
  final Value<String?> planDayId;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<String?> notes;
  final Value<double> totalVolumeKg;
  final Value<double?> caloriesKcal;
  final Value<WorkoutSource> source;
  final Value<bool> healthSynced;
  final Value<int> rowid;
  const WorkoutSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.name = const Value.absent(),
    this.templateId = const Value.absent(),
    this.planDayId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.totalVolumeKg = const Value.absent(),
    this.caloriesKcal = const Value.absent(),
    this.source = const Value.absent(),
    this.healthSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutSessionsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String name,
    this.templateId = const Value.absent(),
    this.planDayId = const Value.absent(),
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.totalVolumeKg = const Value.absent(),
    this.caloriesKcal = const Value.absent(),
    this.source = const Value.absent(),
    this.healthSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       startedAt = Value(startedAt);
  static Insertable<WorkoutSessionRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? name,
    Expression<String>? templateId,
    Expression<String>? planDayId,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<String>? notes,
    Expression<double>? totalVolumeKg,
    Expression<double>? caloriesKcal,
    Expression<String>? source,
    Expression<bool>? healthSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (name != null) 'name': name,
      if (templateId != null) 'template_id': templateId,
      if (planDayId != null) 'plan_day_id': planDayId,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (notes != null) 'notes': notes,
      if (totalVolumeKg != null) 'total_volume_kg': totalVolumeKg,
      if (caloriesKcal != null) 'calories_kcal': caloriesKcal,
      if (source != null) 'source': source,
      if (healthSynced != null) 'health_synced': healthSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutSessionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? name,
    Value<String?>? templateId,
    Value<String?>? planDayId,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<String?>? notes,
    Value<double>? totalVolumeKg,
    Value<double?>? caloriesKcal,
    Value<WorkoutSource>? source,
    Value<bool>? healthSynced,
    Value<int>? rowid,
  }) {
    return WorkoutSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      name: name ?? this.name,
      templateId: templateId ?? this.templateId,
      planDayId: planDayId ?? this.planDayId,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      notes: notes ?? this.notes,
      totalVolumeKg: totalVolumeKg ?? this.totalVolumeKg,
      caloriesKcal: caloriesKcal ?? this.caloriesKcal,
      source: source ?? this.source,
      healthSynced: healthSynced ?? this.healthSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $WorkoutSessionsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (planDayId.present) {
      map['plan_day_id'] = Variable<String>(planDayId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (totalVolumeKg.present) {
      map['total_volume_kg'] = Variable<double>(totalVolumeKg.value);
    }
    if (caloriesKcal.present) {
      map['calories_kcal'] = Variable<double>(caloriesKcal.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $WorkoutSessionsTable.$convertersource.toSql(source.value),
      );
    }
    if (healthSynced.present) {
      map['health_synced'] = Variable<bool>(healthSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('name: $name, ')
          ..write('templateId: $templateId, ')
          ..write('planDayId: $planDayId, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('notes: $notes, ')
          ..write('totalVolumeKg: $totalVolumeKg, ')
          ..write('caloriesKcal: $caloriesKcal, ')
          ..write('source: $source, ')
          ..write('healthSynced: $healthSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseEntriesTable extends ExerciseEntries
    with TableInfo<$ExerciseEntriesTable, ExerciseEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($ExerciseEntriesTable.$convertersyncStatus);
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supersetGroupMeta = const VerificationMeta(
    'supersetGroup',
  );
  @override
  late final GeneratedColumn<int> supersetGroup = GeneratedColumn<int>(
    'superset_group',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _restSecondsMeta = const VerificationMeta(
    'restSeconds',
  );
  @override
  late final GeneratedColumn<int> restSeconds = GeneratedColumn<int>(
    'rest_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(90),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    sessionId,
    exerciseId,
    position,
    supersetGroup,
    restSeconds,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('superset_group')) {
      context.handle(
        _supersetGroupMeta,
        supersetGroup.isAcceptableOrUnknown(
          data['superset_group']!,
          _supersetGroupMeta,
        ),
      );
    }
    if (data.containsKey('rest_seconds')) {
      context.handle(
        _restSecondsMeta,
        restSeconds.isAcceptableOrUnknown(
          data['rest_seconds']!,
          _restSecondsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $ExerciseEntriesTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      supersetGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}superset_group'],
      ),
      restSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rest_seconds'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ExerciseEntriesTable createAlias(String alias) {
    return $ExerciseEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class ExerciseEntryRow extends DataClass
    implements Insertable<ExerciseEntryRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String sessionId;
  final String exerciseId;
  final int position;
  final int? supersetGroup;
  final int restSeconds;
  final String? notes;
  const ExerciseEntryRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.sessionId,
    required this.exerciseId,
    required this.position,
    this.supersetGroup,
    required this.restSeconds,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $ExerciseEntriesTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['session_id'] = Variable<String>(sessionId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['position'] = Variable<int>(position);
    if (!nullToAbsent || supersetGroup != null) {
      map['superset_group'] = Variable<int>(supersetGroup);
    }
    map['rest_seconds'] = Variable<int>(restSeconds);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ExerciseEntriesCompanion toCompanion(bool nullToAbsent) {
    return ExerciseEntriesCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      sessionId: Value(sessionId),
      exerciseId: Value(exerciseId),
      position: Value(position),
      supersetGroup: supersetGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(supersetGroup),
      restSeconds: Value(restSeconds),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory ExerciseEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseEntryRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $ExerciseEntriesTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      position: serializer.fromJson<int>(json['position']),
      supersetGroup: serializer.fromJson<int?>(json['supersetGroup']),
      restSeconds: serializer.fromJson<int>(json['restSeconds']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $ExerciseEntriesTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'sessionId': serializer.toJson<String>(sessionId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'position': serializer.toJson<int>(position),
      'supersetGroup': serializer.toJson<int?>(supersetGroup),
      'restSeconds': serializer.toJson<int>(restSeconds),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  ExerciseEntryRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? sessionId,
    String? exerciseId,
    int? position,
    Value<int?> supersetGroup = const Value.absent(),
    int? restSeconds,
    Value<String?> notes = const Value.absent(),
  }) => ExerciseEntryRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    sessionId: sessionId ?? this.sessionId,
    exerciseId: exerciseId ?? this.exerciseId,
    position: position ?? this.position,
    supersetGroup: supersetGroup.present
        ? supersetGroup.value
        : this.supersetGroup,
    restSeconds: restSeconds ?? this.restSeconds,
    notes: notes.present ? notes.value : this.notes,
  );
  ExerciseEntryRow copyWithCompanion(ExerciseEntriesCompanion data) {
    return ExerciseEntryRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      position: data.position.present ? data.position.value : this.position,
      supersetGroup: data.supersetGroup.present
          ? data.supersetGroup.value
          : this.supersetGroup,
      restSeconds: data.restSeconds.present
          ? data.restSeconds.value
          : this.restSeconds,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseEntryRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('position: $position, ')
          ..write('supersetGroup: $supersetGroup, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    sessionId,
    exerciseId,
    position,
    supersetGroup,
    restSeconds,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseEntryRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.sessionId == this.sessionId &&
          other.exerciseId == this.exerciseId &&
          other.position == this.position &&
          other.supersetGroup == this.supersetGroup &&
          other.restSeconds == this.restSeconds &&
          other.notes == this.notes);
}

class ExerciseEntriesCompanion extends UpdateCompanion<ExerciseEntryRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> sessionId;
  final Value<String> exerciseId;
  final Value<int> position;
  final Value<int?> supersetGroup;
  final Value<int> restSeconds;
  final Value<String?> notes;
  final Value<int> rowid;
  const ExerciseEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.position = const Value.absent(),
    this.supersetGroup = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExerciseEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String sessionId,
    required String exerciseId,
    required int position,
    this.supersetGroup = const Value.absent(),
    this.restSeconds = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : sessionId = Value(sessionId),
       exerciseId = Value(exerciseId),
       position = Value(position);
  static Insertable<ExerciseEntryRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? sessionId,
    Expression<String>? exerciseId,
    Expression<int>? position,
    Expression<int>? supersetGroup,
    Expression<int>? restSeconds,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (sessionId != null) 'session_id': sessionId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (position != null) 'position': position,
      if (supersetGroup != null) 'superset_group': supersetGroup,
      if (restSeconds != null) 'rest_seconds': restSeconds,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExerciseEntriesCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? sessionId,
    Value<String>? exerciseId,
    Value<int>? position,
    Value<int?>? supersetGroup,
    Value<int>? restSeconds,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ExerciseEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      sessionId: sessionId ?? this.sessionId,
      exerciseId: exerciseId ?? this.exerciseId,
      position: position ?? this.position,
      supersetGroup: supersetGroup ?? this.supersetGroup,
      restSeconds: restSeconds ?? this.restSeconds,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $ExerciseEntriesTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (supersetGroup.present) {
      map['superset_group'] = Variable<int>(supersetGroup.value);
    }
    if (restSeconds.present) {
      map['rest_seconds'] = Variable<int>(restSeconds.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('sessionId: $sessionId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('position: $position, ')
          ..write('supersetGroup: $supersetGroup, ')
          ..write('restSeconds: $restSeconds, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SetEntriesTable extends SetEntries
    with TableInfo<$SetEntriesTable, SetEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SetEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($SetEntriesTable.$convertersyncStatus);
  static const VerificationMeta _exerciseEntryIdMeta = const VerificationMeta(
    'exerciseEntryId',
  );
  @override
  late final GeneratedColumn<String> exerciseEntryId = GeneratedColumn<String>(
    'exercise_entry_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SetType, String> setType =
      GeneratedColumn<String>(
        'set_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SetType.working.name),
      ).withConverter<SetType>($SetEntriesTable.$convertersetType);
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rpeMeta = const VerificationMeta('rpe');
  @override
  late final GeneratedColumn<double> rpe = GeneratedColumn<double>(
    'rpe',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecMeta = const VerificationMeta(
    'durationSec',
  );
  @override
  late final GeneratedColumn<int> durationSec = GeneratedColumn<int>(
    'duration_sec',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceMMeta = const VerificationMeta(
    'distanceM',
  );
  @override
  late final GeneratedColumn<double> distanceM = GeneratedColumn<double>(
    'distance_m',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    exerciseEntryId,
    position,
    setType,
    weightKg,
    reps,
    rpe,
    durationSec,
    distanceM,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'set_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SetEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('exercise_entry_id')) {
      context.handle(
        _exerciseEntryIdMeta,
        exerciseEntryId.isAcceptableOrUnknown(
          data['exercise_entry_id']!,
          _exerciseEntryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseEntryIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('rpe')) {
      context.handle(
        _rpeMeta,
        rpe.isAcceptableOrUnknown(data['rpe']!, _rpeMeta),
      );
    }
    if (data.containsKey('duration_sec')) {
      context.handle(
        _durationSecMeta,
        durationSec.isAcceptableOrUnknown(
          data['duration_sec']!,
          _durationSecMeta,
        ),
      );
    }
    if (data.containsKey('distance_m')) {
      context.handle(
        _distanceMMeta,
        distanceM.isAcceptableOrUnknown(data['distance_m']!, _distanceMMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SetEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SetEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $SetEntriesTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      exerciseEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_entry_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      setType: $SetEntriesTable.$convertersetType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}set_type'],
        )!,
      ),
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      ),
      rpe: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rpe'],
      ),
      durationSec: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_sec'],
      ),
      distanceM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_m'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
    );
  }

  @override
  $SetEntriesTable createAlias(String alias) {
    return $SetEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<SetType, String, String> $convertersetType =
      const EnumNameConverter<SetType>(SetType.values);
}

class SetEntryRow extends DataClass implements Insertable<SetEntryRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String exerciseEntryId;
  final int position;
  final SetType setType;
  final double? weightKg;
  final int? reps;
  final double? rpe;
  final int? durationSec;
  final double? distanceM;
  final DateTime? completedAt;
  const SetEntryRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.exerciseEntryId,
    required this.position,
    required this.setType,
    this.weightKg,
    this.reps,
    this.rpe,
    this.durationSec,
    this.distanceM,
    this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $SetEntriesTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['exercise_entry_id'] = Variable<String>(exerciseEntryId);
    map['position'] = Variable<int>(position);
    {
      map['set_type'] = Variable<String>(
        $SetEntriesTable.$convertersetType.toSql(setType),
      );
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    if (!nullToAbsent || rpe != null) {
      map['rpe'] = Variable<double>(rpe);
    }
    if (!nullToAbsent || durationSec != null) {
      map['duration_sec'] = Variable<int>(durationSec);
    }
    if (!nullToAbsent || distanceM != null) {
      map['distance_m'] = Variable<double>(distanceM);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  SetEntriesCompanion toCompanion(bool nullToAbsent) {
    return SetEntriesCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      exerciseEntryId: Value(exerciseEntryId),
      position: Value(position),
      setType: Value(setType),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      rpe: rpe == null && nullToAbsent ? const Value.absent() : Value(rpe),
      durationSec: durationSec == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSec),
      distanceM: distanceM == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceM),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory SetEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SetEntryRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $SetEntriesTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      exerciseEntryId: serializer.fromJson<String>(json['exerciseEntryId']),
      position: serializer.fromJson<int>(json['position']),
      setType: $SetEntriesTable.$convertersetType.fromJson(
        serializer.fromJson<String>(json['setType']),
      ),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      reps: serializer.fromJson<int?>(json['reps']),
      rpe: serializer.fromJson<double?>(json['rpe']),
      durationSec: serializer.fromJson<int?>(json['durationSec']),
      distanceM: serializer.fromJson<double?>(json['distanceM']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $SetEntriesTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'exerciseEntryId': serializer.toJson<String>(exerciseEntryId),
      'position': serializer.toJson<int>(position),
      'setType': serializer.toJson<String>(
        $SetEntriesTable.$convertersetType.toJson(setType),
      ),
      'weightKg': serializer.toJson<double?>(weightKg),
      'reps': serializer.toJson<int?>(reps),
      'rpe': serializer.toJson<double?>(rpe),
      'durationSec': serializer.toJson<int?>(durationSec),
      'distanceM': serializer.toJson<double?>(distanceM),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  SetEntryRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? exerciseEntryId,
    int? position,
    SetType? setType,
    Value<double?> weightKg = const Value.absent(),
    Value<int?> reps = const Value.absent(),
    Value<double?> rpe = const Value.absent(),
    Value<int?> durationSec = const Value.absent(),
    Value<double?> distanceM = const Value.absent(),
    Value<DateTime?> completedAt = const Value.absent(),
  }) => SetEntryRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    exerciseEntryId: exerciseEntryId ?? this.exerciseEntryId,
    position: position ?? this.position,
    setType: setType ?? this.setType,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    reps: reps.present ? reps.value : this.reps,
    rpe: rpe.present ? rpe.value : this.rpe,
    durationSec: durationSec.present ? durationSec.value : this.durationSec,
    distanceM: distanceM.present ? distanceM.value : this.distanceM,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
  );
  SetEntryRow copyWithCompanion(SetEntriesCompanion data) {
    return SetEntryRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      exerciseEntryId: data.exerciseEntryId.present
          ? data.exerciseEntryId.value
          : this.exerciseEntryId,
      position: data.position.present ? data.position.value : this.position,
      setType: data.setType.present ? data.setType.value : this.setType,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      reps: data.reps.present ? data.reps.value : this.reps,
      rpe: data.rpe.present ? data.rpe.value : this.rpe,
      durationSec: data.durationSec.present
          ? data.durationSec.value
          : this.durationSec,
      distanceM: data.distanceM.present ? data.distanceM.value : this.distanceM,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SetEntryRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('exerciseEntryId: $exerciseEntryId, ')
          ..write('position: $position, ')
          ..write('setType: $setType, ')
          ..write('weightKg: $weightKg, ')
          ..write('reps: $reps, ')
          ..write('rpe: $rpe, ')
          ..write('durationSec: $durationSec, ')
          ..write('distanceM: $distanceM, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    exerciseEntryId,
    position,
    setType,
    weightKg,
    reps,
    rpe,
    durationSec,
    distanceM,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetEntryRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.exerciseEntryId == this.exerciseEntryId &&
          other.position == this.position &&
          other.setType == this.setType &&
          other.weightKg == this.weightKg &&
          other.reps == this.reps &&
          other.rpe == this.rpe &&
          other.durationSec == this.durationSec &&
          other.distanceM == this.distanceM &&
          other.completedAt == this.completedAt);
}

class SetEntriesCompanion extends UpdateCompanion<SetEntryRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> exerciseEntryId;
  final Value<int> position;
  final Value<SetType> setType;
  final Value<double?> weightKg;
  final Value<int?> reps;
  final Value<double?> rpe;
  final Value<int?> durationSec;
  final Value<double?> distanceM;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const SetEntriesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.exerciseEntryId = const Value.absent(),
    this.position = const Value.absent(),
    this.setType = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.reps = const Value.absent(),
    this.rpe = const Value.absent(),
    this.durationSec = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SetEntriesCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String exerciseEntryId,
    required int position,
    this.setType = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.reps = const Value.absent(),
    this.rpe = const Value.absent(),
    this.durationSec = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : exerciseEntryId = Value(exerciseEntryId),
       position = Value(position);
  static Insertable<SetEntryRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? exerciseEntryId,
    Expression<int>? position,
    Expression<String>? setType,
    Expression<double>? weightKg,
    Expression<int>? reps,
    Expression<double>? rpe,
    Expression<int>? durationSec,
    Expression<double>? distanceM,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (exerciseEntryId != null) 'exercise_entry_id': exerciseEntryId,
      if (position != null) 'position': position,
      if (setType != null) 'set_type': setType,
      if (weightKg != null) 'weight_kg': weightKg,
      if (reps != null) 'reps': reps,
      if (rpe != null) 'rpe': rpe,
      if (durationSec != null) 'duration_sec': durationSec,
      if (distanceM != null) 'distance_m': distanceM,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SetEntriesCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? exerciseEntryId,
    Value<int>? position,
    Value<SetType>? setType,
    Value<double?>? weightKg,
    Value<int?>? reps,
    Value<double?>? rpe,
    Value<int?>? durationSec,
    Value<double?>? distanceM,
    Value<DateTime?>? completedAt,
    Value<int>? rowid,
  }) {
    return SetEntriesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      exerciseEntryId: exerciseEntryId ?? this.exerciseEntryId,
      position: position ?? this.position,
      setType: setType ?? this.setType,
      weightKg: weightKg ?? this.weightKg,
      reps: reps ?? this.reps,
      rpe: rpe ?? this.rpe,
      durationSec: durationSec ?? this.durationSec,
      distanceM: distanceM ?? this.distanceM,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $SetEntriesTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (exerciseEntryId.present) {
      map['exercise_entry_id'] = Variable<String>(exerciseEntryId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (setType.present) {
      map['set_type'] = Variable<String>(
        $SetEntriesTable.$convertersetType.toSql(setType.value),
      );
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (rpe.present) {
      map['rpe'] = Variable<double>(rpe.value);
    }
    if (durationSec.present) {
      map['duration_sec'] = Variable<int>(durationSec.value);
    }
    if (distanceM.present) {
      map['distance_m'] = Variable<double>(distanceM.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SetEntriesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('exerciseEntryId: $exerciseEntryId, ')
          ..write('position: $position, ')
          ..write('setType: $setType, ')
          ..write('weightKg: $weightKg, ')
          ..write('reps: $reps, ')
          ..write('rpe: $rpe, ')
          ..write('durationSec: $durationSec, ')
          ..write('distanceM: $distanceM, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlansTable extends Plans with TableInfo<$PlansTable, PlanRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($PlansTable.$convertersyncStatus);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPrebuiltMeta = const VerificationMeta(
    'isPrebuilt',
  );
  @override
  late final GeneratedColumn<bool> isPrebuilt = GeneratedColumn<bool>(
    'is_prebuilt',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_prebuilt" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weeksMeta = const VerificationMeta('weeks');
  @override
  late final GeneratedColumn<int> weeks = GeneratedColumn<int>(
    'weeks',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    name,
    description,
    isPrebuilt,
    active,
    startDate,
    weeks,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_prebuilt')) {
      context.handle(
        _isPrebuiltMeta,
        isPrebuilt.isAcceptableOrUnknown(data['is_prebuilt']!, _isPrebuiltMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('weeks')) {
      context.handle(
        _weeksMeta,
        weeks.isAcceptableOrUnknown(data['weeks']!, _weeksMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $PlansTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isPrebuilt: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_prebuilt'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      weeks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weeks'],
      ),
    );
  }

  @override
  $PlansTable createAlias(String alias) {
    return $PlansTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class PlanRow extends DataClass implements Insertable<PlanRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String name;
  final String? description;
  final bool isPrebuilt;
  final bool active;
  final DateTime? startDate;
  final int? weeks;
  const PlanRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.name,
    this.description,
    required this.isPrebuilt,
    required this.active,
    this.startDate,
    this.weeks,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $PlansTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_prebuilt'] = Variable<bool>(isPrebuilt);
    map['active'] = Variable<bool>(active);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || weeks != null) {
      map['weeks'] = Variable<int>(weeks);
    }
    return map;
  }

  PlansCompanion toCompanion(bool nullToAbsent) {
    return PlansCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isPrebuilt: Value(isPrebuilt),
      active: Value(active),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      weeks: weeks == null && nullToAbsent
          ? const Value.absent()
          : Value(weeks),
    );
  }

  factory PlanRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $PlansTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      isPrebuilt: serializer.fromJson<bool>(json['isPrebuilt']),
      active: serializer.fromJson<bool>(json['active']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      weeks: serializer.fromJson<int?>(json['weeks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $PlansTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'isPrebuilt': serializer.toJson<bool>(isPrebuilt),
      'active': serializer.toJson<bool>(active),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'weeks': serializer.toJson<int?>(weeks),
    };
  }

  PlanRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? name,
    Value<String?> description = const Value.absent(),
    bool? isPrebuilt,
    bool? active,
    Value<DateTime?> startDate = const Value.absent(),
    Value<int?> weeks = const Value.absent(),
  }) => PlanRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    isPrebuilt: isPrebuilt ?? this.isPrebuilt,
    active: active ?? this.active,
    startDate: startDate.present ? startDate.value : this.startDate,
    weeks: weeks.present ? weeks.value : this.weeks,
  );
  PlanRow copyWithCompanion(PlansCompanion data) {
    return PlanRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isPrebuilt: data.isPrebuilt.present
          ? data.isPrebuilt.value
          : this.isPrebuilt,
      active: data.active.present ? data.active.value : this.active,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      weeks: data.weeks.present ? data.weeks.value : this.weeks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isPrebuilt: $isPrebuilt, ')
          ..write('active: $active, ')
          ..write('startDate: $startDate, ')
          ..write('weeks: $weeks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    name,
    description,
    isPrebuilt,
    active,
    startDate,
    weeks,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.name == this.name &&
          other.description == this.description &&
          other.isPrebuilt == this.isPrebuilt &&
          other.active == this.active &&
          other.startDate == this.startDate &&
          other.weeks == this.weeks);
}

class PlansCompanion extends UpdateCompanion<PlanRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> isPrebuilt;
  final Value<bool> active;
  final Value<DateTime?> startDate;
  final Value<int?> weeks;
  final Value<int> rowid;
  const PlansCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isPrebuilt = const Value.absent(),
    this.active = const Value.absent(),
    this.startDate = const Value.absent(),
    this.weeks = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlansCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.isPrebuilt = const Value.absent(),
    this.active = const Value.absent(),
    this.startDate = const Value.absent(),
    this.weeks = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PlanRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isPrebuilt,
    Expression<bool>? active,
    Expression<DateTime>? startDate,
    Expression<int>? weeks,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isPrebuilt != null) 'is_prebuilt': isPrebuilt,
      if (active != null) 'active': active,
      if (startDate != null) 'start_date': startDate,
      if (weeks != null) 'weeks': weeks,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlansCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? name,
    Value<String?>? description,
    Value<bool>? isPrebuilt,
    Value<bool>? active,
    Value<DateTime?>? startDate,
    Value<int?>? weeks,
    Value<int>? rowid,
  }) {
    return PlansCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      name: name ?? this.name,
      description: description ?? this.description,
      isPrebuilt: isPrebuilt ?? this.isPrebuilt,
      active: active ?? this.active,
      startDate: startDate ?? this.startDate,
      weeks: weeks ?? this.weeks,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $PlansTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isPrebuilt.present) {
      map['is_prebuilt'] = Variable<bool>(isPrebuilt.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (weeks.present) {
      map['weeks'] = Variable<int>(weeks.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlansCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isPrebuilt: $isPrebuilt, ')
          ..write('active: $active, ')
          ..write('startDate: $startDate, ')
          ..write('weeks: $weeks, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanDaysTable extends PlanDays
    with TableInfo<$PlanDaysTable, PlanDayRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanDaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($PlanDaysTable.$convertersyncStatus);
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
    'plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekdayMeta = const VerificationMeta(
    'weekday',
  );
  @override
  late final GeneratedColumn<int> weekday = GeneratedColumn<int>(
    'weekday',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exercisesMeta = const VerificationMeta(
    'exercises',
  );
  @override
  late final GeneratedColumn<String> exercises = GeneratedColumn<String>(
    'exercises',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    planId,
    position,
    name,
    weekday,
    exercises,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_days';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlanDayRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('plan_id')) {
      context.handle(
        _planIdMeta,
        planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta),
      );
    } else if (isInserting) {
      context.missing(_planIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weekday')) {
      context.handle(
        _weekdayMeta,
        weekday.isAcceptableOrUnknown(data['weekday']!, _weekdayMeta),
      );
    }
    if (data.containsKey('exercises')) {
      context.handle(
        _exercisesMeta,
        exercises.isAcceptableOrUnknown(data['exercises']!, _exercisesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanDayRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanDayRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $PlanDaysTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      planId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plan_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weekday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekday'],
      ),
      exercises: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercises'],
      )!,
    );
  }

  @override
  $PlanDaysTable createAlias(String alias) {
    return $PlanDaysTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class PlanDayRow extends DataClass implements Insertable<PlanDayRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String planId;
  final int position;
  final String name;

  /// ISO weekday 1 (Mon) … 7 (Sun) when scheduled to a fixed day.
  final int? weekday;
  final String exercises;
  const PlanDayRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.planId,
    required this.position,
    required this.name,
    this.weekday,
    required this.exercises,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $PlanDaysTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['plan_id'] = Variable<String>(planId);
    map['position'] = Variable<int>(position);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || weekday != null) {
      map['weekday'] = Variable<int>(weekday);
    }
    map['exercises'] = Variable<String>(exercises);
    return map;
  }

  PlanDaysCompanion toCompanion(bool nullToAbsent) {
    return PlanDaysCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      planId: Value(planId),
      position: Value(position),
      name: Value(name),
      weekday: weekday == null && nullToAbsent
          ? const Value.absent()
          : Value(weekday),
      exercises: Value(exercises),
    );
  }

  factory PlanDayRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanDayRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $PlanDaysTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      planId: serializer.fromJson<String>(json['planId']),
      position: serializer.fromJson<int>(json['position']),
      name: serializer.fromJson<String>(json['name']),
      weekday: serializer.fromJson<int?>(json['weekday']),
      exercises: serializer.fromJson<String>(json['exercises']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $PlanDaysTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'planId': serializer.toJson<String>(planId),
      'position': serializer.toJson<int>(position),
      'name': serializer.toJson<String>(name),
      'weekday': serializer.toJson<int?>(weekday),
      'exercises': serializer.toJson<String>(exercises),
    };
  }

  PlanDayRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? planId,
    int? position,
    String? name,
    Value<int?> weekday = const Value.absent(),
    String? exercises,
  }) => PlanDayRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    planId: planId ?? this.planId,
    position: position ?? this.position,
    name: name ?? this.name,
    weekday: weekday.present ? weekday.value : this.weekday,
    exercises: exercises ?? this.exercises,
  );
  PlanDayRow copyWithCompanion(PlanDaysCompanion data) {
    return PlanDayRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      planId: data.planId.present ? data.planId.value : this.planId,
      position: data.position.present ? data.position.value : this.position,
      name: data.name.present ? data.name.value : this.name,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      exercises: data.exercises.present ? data.exercises.value : this.exercises,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanDayRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('planId: $planId, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('weekday: $weekday, ')
          ..write('exercises: $exercises')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    planId,
    position,
    name,
    weekday,
    exercises,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanDayRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.planId == this.planId &&
          other.position == this.position &&
          other.name == this.name &&
          other.weekday == this.weekday &&
          other.exercises == this.exercises);
}

class PlanDaysCompanion extends UpdateCompanion<PlanDayRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> planId;
  final Value<int> position;
  final Value<String> name;
  final Value<int?> weekday;
  final Value<String> exercises;
  final Value<int> rowid;
  const PlanDaysCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.planId = const Value.absent(),
    this.position = const Value.absent(),
    this.name = const Value.absent(),
    this.weekday = const Value.absent(),
    this.exercises = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanDaysCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String planId,
    required int position,
    required String name,
    this.weekday = const Value.absent(),
    this.exercises = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : planId = Value(planId),
       position = Value(position),
       name = Value(name);
  static Insertable<PlanDayRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? planId,
    Expression<int>? position,
    Expression<String>? name,
    Expression<int>? weekday,
    Expression<String>? exercises,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (planId != null) 'plan_id': planId,
      if (position != null) 'position': position,
      if (name != null) 'name': name,
      if (weekday != null) 'weekday': weekday,
      if (exercises != null) 'exercises': exercises,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanDaysCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? planId,
    Value<int>? position,
    Value<String>? name,
    Value<int?>? weekday,
    Value<String>? exercises,
    Value<int>? rowid,
  }) {
    return PlanDaysCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      planId: planId ?? this.planId,
      position: position ?? this.position,
      name: name ?? this.name,
      weekday: weekday ?? this.weekday,
      exercises: exercises ?? this.exercises,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $PlanDaysTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<int>(weekday.value);
    }
    if (exercises.present) {
      map['exercises'] = Variable<String>(exercises.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanDaysCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('planId: $planId, ')
          ..write('position: $position, ')
          ..write('name: $name, ')
          ..write('weekday: $weekday, ')
          ..write('exercises: $exercises, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardioSessionsTable extends CardioSessions
    with TableInfo<$CardioSessionsTable, CardioSessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardioSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($CardioSessionsTable.$convertersyncStatus);
  @override
  late final GeneratedColumnWithTypeConverter<CardioType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CardioType>($CardioSessionsTable.$convertertype);
  @override
  late final GeneratedColumnWithTypeConverter<CardioSource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CardioSource>($CardioSessionsTable.$convertersource);
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecMeta = const VerificationMeta(
    'durationSec',
  );
  @override
  late final GeneratedColumn<int> durationSec = GeneratedColumn<int>(
    'duration_sec',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _distanceMMeta = const VerificationMeta(
    'distanceM',
  );
  @override
  late final GeneratedColumn<double> distanceM = GeneratedColumn<double>(
    'distance_m',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _caloriesKcalMeta = const VerificationMeta(
    'caloriesKcal',
  );
  @override
  late final GeneratedColumn<double> caloriesKcal = GeneratedColumn<double>(
    'calories_kcal',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _elevationGainMMeta = const VerificationMeta(
    'elevationGainM',
  );
  @override
  late final GeneratedColumn<double> elevationGainM = GeneratedColumn<double>(
    'elevation_gain_m',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avgHeartRateMeta = const VerificationMeta(
    'avgHeartRate',
  );
  @override
  late final GeneratedColumn<int> avgHeartRate = GeneratedColumn<int>(
    'avg_heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _maxHeartRateMeta = const VerificationMeta(
    'maxHeartRate',
  );
  @override
  late final GeneratedColumn<int> maxHeartRate = GeneratedColumn<int>(
    'max_heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    type,
    source,
    startedAt,
    endedAt,
    durationSec,
    distanceM,
    caloriesKcal,
    elevationGainM,
    avgHeartRate,
    maxHeartRate,
    steps,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cardio_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<CardioSessionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('duration_sec')) {
      context.handle(
        _durationSecMeta,
        durationSec.isAcceptableOrUnknown(
          data['duration_sec']!,
          _durationSecMeta,
        ),
      );
    }
    if (data.containsKey('distance_m')) {
      context.handle(
        _distanceMMeta,
        distanceM.isAcceptableOrUnknown(data['distance_m']!, _distanceMMeta),
      );
    }
    if (data.containsKey('calories_kcal')) {
      context.handle(
        _caloriesKcalMeta,
        caloriesKcal.isAcceptableOrUnknown(
          data['calories_kcal']!,
          _caloriesKcalMeta,
        ),
      );
    }
    if (data.containsKey('elevation_gain_m')) {
      context.handle(
        _elevationGainMMeta,
        elevationGainM.isAcceptableOrUnknown(
          data['elevation_gain_m']!,
          _elevationGainMMeta,
        ),
      );
    }
    if (data.containsKey('avg_heart_rate')) {
      context.handle(
        _avgHeartRateMeta,
        avgHeartRate.isAcceptableOrUnknown(
          data['avg_heart_rate']!,
          _avgHeartRateMeta,
        ),
      );
    }
    if (data.containsKey('max_heart_rate')) {
      context.handle(
        _maxHeartRateMeta,
        maxHeartRate.isAcceptableOrUnknown(
          data['max_heart_rate']!,
          _maxHeartRateMeta,
        ),
      );
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardioSessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardioSessionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $CardioSessionsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      type: $CardioSessionsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      source: $CardioSessionsTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      durationSec: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_sec'],
      )!,
      distanceM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_m'],
      )!,
      caloriesKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories_kcal'],
      ),
      elevationGainM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}elevation_gain_m'],
      ),
      avgHeartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}avg_heart_rate'],
      ),
      maxHeartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_heart_rate'],
      ),
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $CardioSessionsTable createAlias(String alias) {
    return $CardioSessionsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<CardioType, String, String> $convertertype =
      const EnumNameConverter<CardioType>(CardioType.values);
  static JsonTypeConverter2<CardioSource, String, String> $convertersource =
      const EnumNameConverter<CardioSource>(CardioSource.values);
}

class CardioSessionRow extends DataClass
    implements Insertable<CardioSessionRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final CardioType type;
  final CardioSource source;
  final DateTime startedAt;
  final DateTime? endedAt;

  /// Moving time (excludes pauses).
  final int durationSec;
  final double distanceM;
  final double? caloriesKcal;
  final double? elevationGainM;
  final int? avgHeartRate;
  final int? maxHeartRate;
  final int? steps;
  final String? notes;
  const CardioSessionRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.type,
    required this.source,
    required this.startedAt,
    this.endedAt,
    required this.durationSec,
    required this.distanceM,
    this.caloriesKcal,
    this.elevationGainM,
    this.avgHeartRate,
    this.maxHeartRate,
    this.steps,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $CardioSessionsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    {
      map['type'] = Variable<String>(
        $CardioSessionsTable.$convertertype.toSql(type),
      );
    }
    {
      map['source'] = Variable<String>(
        $CardioSessionsTable.$convertersource.toSql(source),
      );
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['duration_sec'] = Variable<int>(durationSec);
    map['distance_m'] = Variable<double>(distanceM);
    if (!nullToAbsent || caloriesKcal != null) {
      map['calories_kcal'] = Variable<double>(caloriesKcal);
    }
    if (!nullToAbsent || elevationGainM != null) {
      map['elevation_gain_m'] = Variable<double>(elevationGainM);
    }
    if (!nullToAbsent || avgHeartRate != null) {
      map['avg_heart_rate'] = Variable<int>(avgHeartRate);
    }
    if (!nullToAbsent || maxHeartRate != null) {
      map['max_heart_rate'] = Variable<int>(maxHeartRate);
    }
    if (!nullToAbsent || steps != null) {
      map['steps'] = Variable<int>(steps);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  CardioSessionsCompanion toCompanion(bool nullToAbsent) {
    return CardioSessionsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      type: Value(type),
      source: Value(source),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      durationSec: Value(durationSec),
      distanceM: Value(distanceM),
      caloriesKcal: caloriesKcal == null && nullToAbsent
          ? const Value.absent()
          : Value(caloriesKcal),
      elevationGainM: elevationGainM == null && nullToAbsent
          ? const Value.absent()
          : Value(elevationGainM),
      avgHeartRate: avgHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(avgHeartRate),
      maxHeartRate: maxHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(maxHeartRate),
      steps: steps == null && nullToAbsent
          ? const Value.absent()
          : Value(steps),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory CardioSessionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardioSessionRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $CardioSessionsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      type: $CardioSessionsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      source: $CardioSessionsTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      durationSec: serializer.fromJson<int>(json['durationSec']),
      distanceM: serializer.fromJson<double>(json['distanceM']),
      caloriesKcal: serializer.fromJson<double?>(json['caloriesKcal']),
      elevationGainM: serializer.fromJson<double?>(json['elevationGainM']),
      avgHeartRate: serializer.fromJson<int?>(json['avgHeartRate']),
      maxHeartRate: serializer.fromJson<int?>(json['maxHeartRate']),
      steps: serializer.fromJson<int?>(json['steps']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $CardioSessionsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'type': serializer.toJson<String>(
        $CardioSessionsTable.$convertertype.toJson(type),
      ),
      'source': serializer.toJson<String>(
        $CardioSessionsTable.$convertersource.toJson(source),
      ),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'durationSec': serializer.toJson<int>(durationSec),
      'distanceM': serializer.toJson<double>(distanceM),
      'caloriesKcal': serializer.toJson<double?>(caloriesKcal),
      'elevationGainM': serializer.toJson<double?>(elevationGainM),
      'avgHeartRate': serializer.toJson<int?>(avgHeartRate),
      'maxHeartRate': serializer.toJson<int?>(maxHeartRate),
      'steps': serializer.toJson<int?>(steps),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  CardioSessionRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    CardioType? type,
    CardioSource? source,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    int? durationSec,
    double? distanceM,
    Value<double?> caloriesKcal = const Value.absent(),
    Value<double?> elevationGainM = const Value.absent(),
    Value<int?> avgHeartRate = const Value.absent(),
    Value<int?> maxHeartRate = const Value.absent(),
    Value<int?> steps = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => CardioSessionRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    type: type ?? this.type,
    source: source ?? this.source,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    durationSec: durationSec ?? this.durationSec,
    distanceM: distanceM ?? this.distanceM,
    caloriesKcal: caloriesKcal.present ? caloriesKcal.value : this.caloriesKcal,
    elevationGainM: elevationGainM.present
        ? elevationGainM.value
        : this.elevationGainM,
    avgHeartRate: avgHeartRate.present ? avgHeartRate.value : this.avgHeartRate,
    maxHeartRate: maxHeartRate.present ? maxHeartRate.value : this.maxHeartRate,
    steps: steps.present ? steps.value : this.steps,
    notes: notes.present ? notes.value : this.notes,
  );
  CardioSessionRow copyWithCompanion(CardioSessionsCompanion data) {
    return CardioSessionRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      type: data.type.present ? data.type.value : this.type,
      source: data.source.present ? data.source.value : this.source,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      durationSec: data.durationSec.present
          ? data.durationSec.value
          : this.durationSec,
      distanceM: data.distanceM.present ? data.distanceM.value : this.distanceM,
      caloriesKcal: data.caloriesKcal.present
          ? data.caloriesKcal.value
          : this.caloriesKcal,
      elevationGainM: data.elevationGainM.present
          ? data.elevationGainM.value
          : this.elevationGainM,
      avgHeartRate: data.avgHeartRate.present
          ? data.avgHeartRate.value
          : this.avgHeartRate,
      maxHeartRate: data.maxHeartRate.present
          ? data.maxHeartRate.value
          : this.maxHeartRate,
      steps: data.steps.present ? data.steps.value : this.steps,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardioSessionRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('type: $type, ')
          ..write('source: $source, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('durationSec: $durationSec, ')
          ..write('distanceM: $distanceM, ')
          ..write('caloriesKcal: $caloriesKcal, ')
          ..write('elevationGainM: $elevationGainM, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write('maxHeartRate: $maxHeartRate, ')
          ..write('steps: $steps, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    type,
    source,
    startedAt,
    endedAt,
    durationSec,
    distanceM,
    caloriesKcal,
    elevationGainM,
    avgHeartRate,
    maxHeartRate,
    steps,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardioSessionRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.type == this.type &&
          other.source == this.source &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.durationSec == this.durationSec &&
          other.distanceM == this.distanceM &&
          other.caloriesKcal == this.caloriesKcal &&
          other.elevationGainM == this.elevationGainM &&
          other.avgHeartRate == this.avgHeartRate &&
          other.maxHeartRate == this.maxHeartRate &&
          other.steps == this.steps &&
          other.notes == this.notes);
}

class CardioSessionsCompanion extends UpdateCompanion<CardioSessionRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<CardioType> type;
  final Value<CardioSource> source;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<int> durationSec;
  final Value<double> distanceM;
  final Value<double?> caloriesKcal;
  final Value<double?> elevationGainM;
  final Value<int?> avgHeartRate;
  final Value<int?> maxHeartRate;
  final Value<int?> steps;
  final Value<String?> notes;
  final Value<int> rowid;
  const CardioSessionsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.type = const Value.absent(),
    this.source = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.durationSec = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.caloriesKcal = const Value.absent(),
    this.elevationGainM = const Value.absent(),
    this.avgHeartRate = const Value.absent(),
    this.maxHeartRate = const Value.absent(),
    this.steps = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardioSessionsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required CardioType type,
    required CardioSource source,
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    this.durationSec = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.caloriesKcal = const Value.absent(),
    this.elevationGainM = const Value.absent(),
    this.avgHeartRate = const Value.absent(),
    this.maxHeartRate = const Value.absent(),
    this.steps = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : type = Value(type),
       source = Value(source),
       startedAt = Value(startedAt);
  static Insertable<CardioSessionRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? type,
    Expression<String>? source,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<int>? durationSec,
    Expression<double>? distanceM,
    Expression<double>? caloriesKcal,
    Expression<double>? elevationGainM,
    Expression<int>? avgHeartRate,
    Expression<int>? maxHeartRate,
    Expression<int>? steps,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (type != null) 'type': type,
      if (source != null) 'source': source,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (durationSec != null) 'duration_sec': durationSec,
      if (distanceM != null) 'distance_m': distanceM,
      if (caloriesKcal != null) 'calories_kcal': caloriesKcal,
      if (elevationGainM != null) 'elevation_gain_m': elevationGainM,
      if (avgHeartRate != null) 'avg_heart_rate': avgHeartRate,
      if (maxHeartRate != null) 'max_heart_rate': maxHeartRate,
      if (steps != null) 'steps': steps,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardioSessionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<CardioType>? type,
    Value<CardioSource>? source,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<int>? durationSec,
    Value<double>? distanceM,
    Value<double?>? caloriesKcal,
    Value<double?>? elevationGainM,
    Value<int?>? avgHeartRate,
    Value<int?>? maxHeartRate,
    Value<int?>? steps,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return CardioSessionsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      type: type ?? this.type,
      source: source ?? this.source,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      durationSec: durationSec ?? this.durationSec,
      distanceM: distanceM ?? this.distanceM,
      caloriesKcal: caloriesKcal ?? this.caloriesKcal,
      elevationGainM: elevationGainM ?? this.elevationGainM,
      avgHeartRate: avgHeartRate ?? this.avgHeartRate,
      maxHeartRate: maxHeartRate ?? this.maxHeartRate,
      steps: steps ?? this.steps,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $CardioSessionsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $CardioSessionsTable.$convertertype.toSql(type.value),
      );
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $CardioSessionsTable.$convertersource.toSql(source.value),
      );
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (durationSec.present) {
      map['duration_sec'] = Variable<int>(durationSec.value);
    }
    if (distanceM.present) {
      map['distance_m'] = Variable<double>(distanceM.value);
    }
    if (caloriesKcal.present) {
      map['calories_kcal'] = Variable<double>(caloriesKcal.value);
    }
    if (elevationGainM.present) {
      map['elevation_gain_m'] = Variable<double>(elevationGainM.value);
    }
    if (avgHeartRate.present) {
      map['avg_heart_rate'] = Variable<int>(avgHeartRate.value);
    }
    if (maxHeartRate.present) {
      map['max_heart_rate'] = Variable<int>(maxHeartRate.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardioSessionsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('type: $type, ')
          ..write('source: $source, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('durationSec: $durationSec, ')
          ..write('distanceM: $distanceM, ')
          ..write('caloriesKcal: $caloriesKcal, ')
          ..write('elevationGainM: $elevationGainM, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write('maxHeartRate: $maxHeartRate, ')
          ..write('steps: $steps, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoutePointsTable extends RoutePoints
    with TableInfo<$RoutePointsTable, RoutePointRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutePointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($RoutePointsTable.$convertersyncStatus);
  static const VerificationMeta _cardioSessionIdMeta = const VerificationMeta(
    'cardioSessionId',
  );
  @override
  late final GeneratedColumn<String> cardioSessionId = GeneratedColumn<String>(
    'cardio_session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _altitudeMMeta = const VerificationMeta(
    'altitudeM',
  );
  @override
  late final GeneratedColumn<double> altitudeM = GeneratedColumn<double>(
    'altitude_m',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speedMpsMeta = const VerificationMeta(
    'speedMps',
  );
  @override
  late final GeneratedColumn<double> speedMps = GeneratedColumn<double>(
    'speed_mps',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accuracyMMeta = const VerificationMeta(
    'accuracyM',
  );
  @override
  late final GeneratedColumn<double> accuracyM = GeneratedColumn<double>(
    'accuracy_m',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heartRateMeta = const VerificationMeta(
    'heartRate',
  );
  @override
  late final GeneratedColumn<int> heartRate = GeneratedColumn<int>(
    'heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    cardioSessionId,
    recordedAt,
    latitude,
    longitude,
    altitudeM,
    speedMps,
    accuracyM,
    heartRate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'route_points';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoutePointRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('cardio_session_id')) {
      context.handle(
        _cardioSessionIdMeta,
        cardioSessionId.isAcceptableOrUnknown(
          data['cardio_session_id']!,
          _cardioSessionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cardioSessionIdMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('altitude_m')) {
      context.handle(
        _altitudeMMeta,
        altitudeM.isAcceptableOrUnknown(data['altitude_m']!, _altitudeMMeta),
      );
    }
    if (data.containsKey('speed_mps')) {
      context.handle(
        _speedMpsMeta,
        speedMps.isAcceptableOrUnknown(data['speed_mps']!, _speedMpsMeta),
      );
    }
    if (data.containsKey('accuracy_m')) {
      context.handle(
        _accuracyMMeta,
        accuracyM.isAcceptableOrUnknown(data['accuracy_m']!, _accuracyMMeta),
      );
    }
    if (data.containsKey('heart_rate')) {
      context.handle(
        _heartRateMeta,
        heartRate.isAcceptableOrUnknown(data['heart_rate']!, _heartRateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutePointRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoutePointRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $RoutePointsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      cardioSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cardio_session_id'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      altitudeM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}altitude_m'],
      ),
      speedMps: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}speed_mps'],
      ),
      accuracyM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}accuracy_m'],
      ),
      heartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}heart_rate'],
      ),
    );
  }

  @override
  $RoutePointsTable createAlias(String alias) {
    return $RoutePointsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class RoutePointRow extends DataClass implements Insertable<RoutePointRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String cardioSessionId;
  final DateTime recordedAt;
  final double latitude;
  final double longitude;
  final double? altitudeM;
  final double? speedMps;
  final double? accuracyM;
  final int? heartRate;
  const RoutePointRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.cardioSessionId,
    required this.recordedAt,
    required this.latitude,
    required this.longitude,
    this.altitudeM,
    this.speedMps,
    this.accuracyM,
    this.heartRate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $RoutePointsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['cardio_session_id'] = Variable<String>(cardioSessionId);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || altitudeM != null) {
      map['altitude_m'] = Variable<double>(altitudeM);
    }
    if (!nullToAbsent || speedMps != null) {
      map['speed_mps'] = Variable<double>(speedMps);
    }
    if (!nullToAbsent || accuracyM != null) {
      map['accuracy_m'] = Variable<double>(accuracyM);
    }
    if (!nullToAbsent || heartRate != null) {
      map['heart_rate'] = Variable<int>(heartRate);
    }
    return map;
  }

  RoutePointsCompanion toCompanion(bool nullToAbsent) {
    return RoutePointsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      cardioSessionId: Value(cardioSessionId),
      recordedAt: Value(recordedAt),
      latitude: Value(latitude),
      longitude: Value(longitude),
      altitudeM: altitudeM == null && nullToAbsent
          ? const Value.absent()
          : Value(altitudeM),
      speedMps: speedMps == null && nullToAbsent
          ? const Value.absent()
          : Value(speedMps),
      accuracyM: accuracyM == null && nullToAbsent
          ? const Value.absent()
          : Value(accuracyM),
      heartRate: heartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(heartRate),
    );
  }

  factory RoutePointRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutePointRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $RoutePointsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      cardioSessionId: serializer.fromJson<String>(json['cardioSessionId']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      altitudeM: serializer.fromJson<double?>(json['altitudeM']),
      speedMps: serializer.fromJson<double?>(json['speedMps']),
      accuracyM: serializer.fromJson<double?>(json['accuracyM']),
      heartRate: serializer.fromJson<int?>(json['heartRate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $RoutePointsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'cardioSessionId': serializer.toJson<String>(cardioSessionId),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'altitudeM': serializer.toJson<double?>(altitudeM),
      'speedMps': serializer.toJson<double?>(speedMps),
      'accuracyM': serializer.toJson<double?>(accuracyM),
      'heartRate': serializer.toJson<int?>(heartRate),
    };
  }

  RoutePointRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? cardioSessionId,
    DateTime? recordedAt,
    double? latitude,
    double? longitude,
    Value<double?> altitudeM = const Value.absent(),
    Value<double?> speedMps = const Value.absent(),
    Value<double?> accuracyM = const Value.absent(),
    Value<int?> heartRate = const Value.absent(),
  }) => RoutePointRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    cardioSessionId: cardioSessionId ?? this.cardioSessionId,
    recordedAt: recordedAt ?? this.recordedAt,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    altitudeM: altitudeM.present ? altitudeM.value : this.altitudeM,
    speedMps: speedMps.present ? speedMps.value : this.speedMps,
    accuracyM: accuracyM.present ? accuracyM.value : this.accuracyM,
    heartRate: heartRate.present ? heartRate.value : this.heartRate,
  );
  RoutePointRow copyWithCompanion(RoutePointsCompanion data) {
    return RoutePointRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      cardioSessionId: data.cardioSessionId.present
          ? data.cardioSessionId.value
          : this.cardioSessionId,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      altitudeM: data.altitudeM.present ? data.altitudeM.value : this.altitudeM,
      speedMps: data.speedMps.present ? data.speedMps.value : this.speedMps,
      accuracyM: data.accuracyM.present ? data.accuracyM.value : this.accuracyM,
      heartRate: data.heartRate.present ? data.heartRate.value : this.heartRate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoutePointRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('cardioSessionId: $cardioSessionId, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('altitudeM: $altitudeM, ')
          ..write('speedMps: $speedMps, ')
          ..write('accuracyM: $accuracyM, ')
          ..write('heartRate: $heartRate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    cardioSessionId,
    recordedAt,
    latitude,
    longitude,
    altitudeM,
    speedMps,
    accuracyM,
    heartRate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutePointRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.cardioSessionId == this.cardioSessionId &&
          other.recordedAt == this.recordedAt &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.altitudeM == this.altitudeM &&
          other.speedMps == this.speedMps &&
          other.accuracyM == this.accuracyM &&
          other.heartRate == this.heartRate);
}

class RoutePointsCompanion extends UpdateCompanion<RoutePointRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> cardioSessionId;
  final Value<DateTime> recordedAt;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double?> altitudeM;
  final Value<double?> speedMps;
  final Value<double?> accuracyM;
  final Value<int?> heartRate;
  final Value<int> rowid;
  const RoutePointsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.cardioSessionId = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.altitudeM = const Value.absent(),
    this.speedMps = const Value.absent(),
    this.accuracyM = const Value.absent(),
    this.heartRate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoutePointsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String cardioSessionId,
    required DateTime recordedAt,
    required double latitude,
    required double longitude,
    this.altitudeM = const Value.absent(),
    this.speedMps = const Value.absent(),
    this.accuracyM = const Value.absent(),
    this.heartRate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cardioSessionId = Value(cardioSessionId),
       recordedAt = Value(recordedAt),
       latitude = Value(latitude),
       longitude = Value(longitude);
  static Insertable<RoutePointRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? cardioSessionId,
    Expression<DateTime>? recordedAt,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? altitudeM,
    Expression<double>? speedMps,
    Expression<double>? accuracyM,
    Expression<int>? heartRate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (cardioSessionId != null) 'cardio_session_id': cardioSessionId,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (altitudeM != null) 'altitude_m': altitudeM,
      if (speedMps != null) 'speed_mps': speedMps,
      if (accuracyM != null) 'accuracy_m': accuracyM,
      if (heartRate != null) 'heart_rate': heartRate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoutePointsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? cardioSessionId,
    Value<DateTime>? recordedAt,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<double?>? altitudeM,
    Value<double?>? speedMps,
    Value<double?>? accuracyM,
    Value<int?>? heartRate,
    Value<int>? rowid,
  }) {
    return RoutePointsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      cardioSessionId: cardioSessionId ?? this.cardioSessionId,
      recordedAt: recordedAt ?? this.recordedAt,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      altitudeM: altitudeM ?? this.altitudeM,
      speedMps: speedMps ?? this.speedMps,
      accuracyM: accuracyM ?? this.accuracyM,
      heartRate: heartRate ?? this.heartRate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $RoutePointsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (cardioSessionId.present) {
      map['cardio_session_id'] = Variable<String>(cardioSessionId.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (altitudeM.present) {
      map['altitude_m'] = Variable<double>(altitudeM.value);
    }
    if (speedMps.present) {
      map['speed_mps'] = Variable<double>(speedMps.value);
    }
    if (accuracyM.present) {
      map['accuracy_m'] = Variable<double>(accuracyM.value);
    }
    if (heartRate.present) {
      map['heart_rate'] = Variable<int>(heartRate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutePointsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('cardioSessionId: $cardioSessionId, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('altitudeM: $altitudeM, ')
          ..write('speedMps: $speedMps, ')
          ..write('accuracyM: $accuracyM, ')
          ..write('heartRate: $heartRate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyActivityTable extends DailyActivity
    with TableInfo<$DailyActivityTable, DailyActivityRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyActivityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($DailyActivityTable.$convertersyncStatus);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _distanceMMeta = const VerificationMeta(
    'distanceM',
  );
  @override
  late final GeneratedColumn<double> distanceM = GeneratedColumn<double>(
    'distance_m',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _floorsMeta = const VerificationMeta('floors');
  @override
  late final GeneratedColumn<int> floors = GeneratedColumn<int>(
    'floors',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _activeKcalMeta = const VerificationMeta(
    'activeKcal',
  );
  @override
  late final GeneratedColumn<double> activeKcal = GeneratedColumn<double>(
    'active_kcal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _exerciseMinMeta = const VerificationMeta(
    'exerciseMin',
  );
  @override
  late final GeneratedColumn<int> exerciseMin = GeneratedColumn<int>(
    'exercise_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _restingHeartRateMeta = const VerificationMeta(
    'restingHeartRate',
  );
  @override
  late final GeneratedColumn<int> restingHeartRate = GeneratedColumn<int>(
    'resting_heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avgHeartRateMeta = const VerificationMeta(
    'avgHeartRate',
  );
  @override
  late final GeneratedColumn<int> avgHeartRate = GeneratedColumn<int>(
    'avg_heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hrvMsMeta = const VerificationMeta('hrvMs');
  @override
  late final GeneratedColumn<double> hrvMs = GeneratedColumn<double>(
    'hrv_ms',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vo2MaxMeta = const VerificationMeta('vo2Max');
  @override
  late final GeneratedColumn<double> vo2Max = GeneratedColumn<double>(
    'vo2_max',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sleepMinutesMeta = const VerificationMeta(
    'sleepMinutes',
  );
  @override
  late final GeneratedColumn<int> sleepMinutes = GeneratedColumn<int>(
    'sleep_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ActivitySource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(ActivitySource.device.name),
      ).withConverter<ActivitySource>($DailyActivityTable.$convertersource);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    day,
    steps,
    distanceM,
    floors,
    activeKcal,
    exerciseMin,
    restingHeartRate,
    avgHeartRate,
    hrvMs,
    vo2Max,
    sleepMinutes,
    source,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_activity';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyActivityRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    }
    if (data.containsKey('distance_m')) {
      context.handle(
        _distanceMMeta,
        distanceM.isAcceptableOrUnknown(data['distance_m']!, _distanceMMeta),
      );
    }
    if (data.containsKey('floors')) {
      context.handle(
        _floorsMeta,
        floors.isAcceptableOrUnknown(data['floors']!, _floorsMeta),
      );
    }
    if (data.containsKey('active_kcal')) {
      context.handle(
        _activeKcalMeta,
        activeKcal.isAcceptableOrUnknown(data['active_kcal']!, _activeKcalMeta),
      );
    }
    if (data.containsKey('exercise_min')) {
      context.handle(
        _exerciseMinMeta,
        exerciseMin.isAcceptableOrUnknown(
          data['exercise_min']!,
          _exerciseMinMeta,
        ),
      );
    }
    if (data.containsKey('resting_heart_rate')) {
      context.handle(
        _restingHeartRateMeta,
        restingHeartRate.isAcceptableOrUnknown(
          data['resting_heart_rate']!,
          _restingHeartRateMeta,
        ),
      );
    }
    if (data.containsKey('avg_heart_rate')) {
      context.handle(
        _avgHeartRateMeta,
        avgHeartRate.isAcceptableOrUnknown(
          data['avg_heart_rate']!,
          _avgHeartRateMeta,
        ),
      );
    }
    if (data.containsKey('hrv_ms')) {
      context.handle(
        _hrvMsMeta,
        hrvMs.isAcceptableOrUnknown(data['hrv_ms']!, _hrvMsMeta),
      );
    }
    if (data.containsKey('vo2_max')) {
      context.handle(
        _vo2MaxMeta,
        vo2Max.isAcceptableOrUnknown(data['vo2_max']!, _vo2MaxMeta),
      );
    }
    if (data.containsKey('sleep_minutes')) {
      context.handle(
        _sleepMinutesMeta,
        sleepMinutes.isAcceptableOrUnknown(
          data['sleep_minutes']!,
          _sleepMinutesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyActivityRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyActivityRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $DailyActivityTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day'],
      )!,
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
      )!,
      distanceM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance_m'],
      )!,
      floors: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}floors'],
      )!,
      activeKcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}active_kcal'],
      )!,
      exerciseMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_min'],
      )!,
      restingHeartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}resting_heart_rate'],
      ),
      avgHeartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}avg_heart_rate'],
      ),
      hrvMs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}hrv_ms'],
      ),
      vo2Max: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vo2_max'],
      ),
      sleepMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sleep_minutes'],
      ),
      source: $DailyActivityTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
    );
  }

  @override
  $DailyActivityTable createAlias(String alias) {
    return $DailyActivityTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<ActivitySource, String, String> $convertersource =
      const EnumNameConverter<ActivitySource>(ActivitySource.values);
}

class DailyActivityRow extends DataClass
    implements Insertable<DailyActivityRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;

  /// Local calendar day as `yyyy-MM-dd`.
  final String day;
  final int steps;
  final double distanceM;
  final int floors;
  final double activeKcal;
  final int exerciseMin;
  final int? restingHeartRate;
  final int? avgHeartRate;
  final double? hrvMs;
  final double? vo2Max;
  final int? sleepMinutes;
  final ActivitySource source;
  const DailyActivityRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.day,
    required this.steps,
    required this.distanceM,
    required this.floors,
    required this.activeKcal,
    required this.exerciseMin,
    this.restingHeartRate,
    this.avgHeartRate,
    this.hrvMs,
    this.vo2Max,
    this.sleepMinutes,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $DailyActivityTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['day'] = Variable<String>(day);
    map['steps'] = Variable<int>(steps);
    map['distance_m'] = Variable<double>(distanceM);
    map['floors'] = Variable<int>(floors);
    map['active_kcal'] = Variable<double>(activeKcal);
    map['exercise_min'] = Variable<int>(exerciseMin);
    if (!nullToAbsent || restingHeartRate != null) {
      map['resting_heart_rate'] = Variable<int>(restingHeartRate);
    }
    if (!nullToAbsent || avgHeartRate != null) {
      map['avg_heart_rate'] = Variable<int>(avgHeartRate);
    }
    if (!nullToAbsent || hrvMs != null) {
      map['hrv_ms'] = Variable<double>(hrvMs);
    }
    if (!nullToAbsent || vo2Max != null) {
      map['vo2_max'] = Variable<double>(vo2Max);
    }
    if (!nullToAbsent || sleepMinutes != null) {
      map['sleep_minutes'] = Variable<int>(sleepMinutes);
    }
    {
      map['source'] = Variable<String>(
        $DailyActivityTable.$convertersource.toSql(source),
      );
    }
    return map;
  }

  DailyActivityCompanion toCompanion(bool nullToAbsent) {
    return DailyActivityCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      day: Value(day),
      steps: Value(steps),
      distanceM: Value(distanceM),
      floors: Value(floors),
      activeKcal: Value(activeKcal),
      exerciseMin: Value(exerciseMin),
      restingHeartRate: restingHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(restingHeartRate),
      avgHeartRate: avgHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(avgHeartRate),
      hrvMs: hrvMs == null && nullToAbsent
          ? const Value.absent()
          : Value(hrvMs),
      vo2Max: vo2Max == null && nullToAbsent
          ? const Value.absent()
          : Value(vo2Max),
      sleepMinutes: sleepMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepMinutes),
      source: Value(source),
    );
  }

  factory DailyActivityRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyActivityRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $DailyActivityTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      day: serializer.fromJson<String>(json['day']),
      steps: serializer.fromJson<int>(json['steps']),
      distanceM: serializer.fromJson<double>(json['distanceM']),
      floors: serializer.fromJson<int>(json['floors']),
      activeKcal: serializer.fromJson<double>(json['activeKcal']),
      exerciseMin: serializer.fromJson<int>(json['exerciseMin']),
      restingHeartRate: serializer.fromJson<int?>(json['restingHeartRate']),
      avgHeartRate: serializer.fromJson<int?>(json['avgHeartRate']),
      hrvMs: serializer.fromJson<double?>(json['hrvMs']),
      vo2Max: serializer.fromJson<double?>(json['vo2Max']),
      sleepMinutes: serializer.fromJson<int?>(json['sleepMinutes']),
      source: $DailyActivityTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $DailyActivityTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'day': serializer.toJson<String>(day),
      'steps': serializer.toJson<int>(steps),
      'distanceM': serializer.toJson<double>(distanceM),
      'floors': serializer.toJson<int>(floors),
      'activeKcal': serializer.toJson<double>(activeKcal),
      'exerciseMin': serializer.toJson<int>(exerciseMin),
      'restingHeartRate': serializer.toJson<int?>(restingHeartRate),
      'avgHeartRate': serializer.toJson<int?>(avgHeartRate),
      'hrvMs': serializer.toJson<double?>(hrvMs),
      'vo2Max': serializer.toJson<double?>(vo2Max),
      'sleepMinutes': serializer.toJson<int?>(sleepMinutes),
      'source': serializer.toJson<String>(
        $DailyActivityTable.$convertersource.toJson(source),
      ),
    };
  }

  DailyActivityRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? day,
    int? steps,
    double? distanceM,
    int? floors,
    double? activeKcal,
    int? exerciseMin,
    Value<int?> restingHeartRate = const Value.absent(),
    Value<int?> avgHeartRate = const Value.absent(),
    Value<double?> hrvMs = const Value.absent(),
    Value<double?> vo2Max = const Value.absent(),
    Value<int?> sleepMinutes = const Value.absent(),
    ActivitySource? source,
  }) => DailyActivityRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    day: day ?? this.day,
    steps: steps ?? this.steps,
    distanceM: distanceM ?? this.distanceM,
    floors: floors ?? this.floors,
    activeKcal: activeKcal ?? this.activeKcal,
    exerciseMin: exerciseMin ?? this.exerciseMin,
    restingHeartRate: restingHeartRate.present
        ? restingHeartRate.value
        : this.restingHeartRate,
    avgHeartRate: avgHeartRate.present ? avgHeartRate.value : this.avgHeartRate,
    hrvMs: hrvMs.present ? hrvMs.value : this.hrvMs,
    vo2Max: vo2Max.present ? vo2Max.value : this.vo2Max,
    sleepMinutes: sleepMinutes.present ? sleepMinutes.value : this.sleepMinutes,
    source: source ?? this.source,
  );
  DailyActivityRow copyWithCompanion(DailyActivityCompanion data) {
    return DailyActivityRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      day: data.day.present ? data.day.value : this.day,
      steps: data.steps.present ? data.steps.value : this.steps,
      distanceM: data.distanceM.present ? data.distanceM.value : this.distanceM,
      floors: data.floors.present ? data.floors.value : this.floors,
      activeKcal: data.activeKcal.present
          ? data.activeKcal.value
          : this.activeKcal,
      exerciseMin: data.exerciseMin.present
          ? data.exerciseMin.value
          : this.exerciseMin,
      restingHeartRate: data.restingHeartRate.present
          ? data.restingHeartRate.value
          : this.restingHeartRate,
      avgHeartRate: data.avgHeartRate.present
          ? data.avgHeartRate.value
          : this.avgHeartRate,
      hrvMs: data.hrvMs.present ? data.hrvMs.value : this.hrvMs,
      vo2Max: data.vo2Max.present ? data.vo2Max.value : this.vo2Max,
      sleepMinutes: data.sleepMinutes.present
          ? data.sleepMinutes.value
          : this.sleepMinutes,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyActivityRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('day: $day, ')
          ..write('steps: $steps, ')
          ..write('distanceM: $distanceM, ')
          ..write('floors: $floors, ')
          ..write('activeKcal: $activeKcal, ')
          ..write('exerciseMin: $exerciseMin, ')
          ..write('restingHeartRate: $restingHeartRate, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write('hrvMs: $hrvMs, ')
          ..write('vo2Max: $vo2Max, ')
          ..write('sleepMinutes: $sleepMinutes, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    day,
    steps,
    distanceM,
    floors,
    activeKcal,
    exerciseMin,
    restingHeartRate,
    avgHeartRate,
    hrvMs,
    vo2Max,
    sleepMinutes,
    source,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyActivityRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.day == this.day &&
          other.steps == this.steps &&
          other.distanceM == this.distanceM &&
          other.floors == this.floors &&
          other.activeKcal == this.activeKcal &&
          other.exerciseMin == this.exerciseMin &&
          other.restingHeartRate == this.restingHeartRate &&
          other.avgHeartRate == this.avgHeartRate &&
          other.hrvMs == this.hrvMs &&
          other.vo2Max == this.vo2Max &&
          other.sleepMinutes == this.sleepMinutes &&
          other.source == this.source);
}

class DailyActivityCompanion extends UpdateCompanion<DailyActivityRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> day;
  final Value<int> steps;
  final Value<double> distanceM;
  final Value<int> floors;
  final Value<double> activeKcal;
  final Value<int> exerciseMin;
  final Value<int?> restingHeartRate;
  final Value<int?> avgHeartRate;
  final Value<double?> hrvMs;
  final Value<double?> vo2Max;
  final Value<int?> sleepMinutes;
  final Value<ActivitySource> source;
  final Value<int> rowid;
  const DailyActivityCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.day = const Value.absent(),
    this.steps = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.floors = const Value.absent(),
    this.activeKcal = const Value.absent(),
    this.exerciseMin = const Value.absent(),
    this.restingHeartRate = const Value.absent(),
    this.avgHeartRate = const Value.absent(),
    this.hrvMs = const Value.absent(),
    this.vo2Max = const Value.absent(),
    this.sleepMinutes = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyActivityCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String day,
    this.steps = const Value.absent(),
    this.distanceM = const Value.absent(),
    this.floors = const Value.absent(),
    this.activeKcal = const Value.absent(),
    this.exerciseMin = const Value.absent(),
    this.restingHeartRate = const Value.absent(),
    this.avgHeartRate = const Value.absent(),
    this.hrvMs = const Value.absent(),
    this.vo2Max = const Value.absent(),
    this.sleepMinutes = const Value.absent(),
    this.source = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : day = Value(day);
  static Insertable<DailyActivityRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? day,
    Expression<int>? steps,
    Expression<double>? distanceM,
    Expression<int>? floors,
    Expression<double>? activeKcal,
    Expression<int>? exerciseMin,
    Expression<int>? restingHeartRate,
    Expression<int>? avgHeartRate,
    Expression<double>? hrvMs,
    Expression<double>? vo2Max,
    Expression<int>? sleepMinutes,
    Expression<String>? source,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (day != null) 'day': day,
      if (steps != null) 'steps': steps,
      if (distanceM != null) 'distance_m': distanceM,
      if (floors != null) 'floors': floors,
      if (activeKcal != null) 'active_kcal': activeKcal,
      if (exerciseMin != null) 'exercise_min': exerciseMin,
      if (restingHeartRate != null) 'resting_heart_rate': restingHeartRate,
      if (avgHeartRate != null) 'avg_heart_rate': avgHeartRate,
      if (hrvMs != null) 'hrv_ms': hrvMs,
      if (vo2Max != null) 'vo2_max': vo2Max,
      if (sleepMinutes != null) 'sleep_minutes': sleepMinutes,
      if (source != null) 'source': source,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyActivityCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? day,
    Value<int>? steps,
    Value<double>? distanceM,
    Value<int>? floors,
    Value<double>? activeKcal,
    Value<int>? exerciseMin,
    Value<int?>? restingHeartRate,
    Value<int?>? avgHeartRate,
    Value<double?>? hrvMs,
    Value<double?>? vo2Max,
    Value<int?>? sleepMinutes,
    Value<ActivitySource>? source,
    Value<int>? rowid,
  }) {
    return DailyActivityCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      day: day ?? this.day,
      steps: steps ?? this.steps,
      distanceM: distanceM ?? this.distanceM,
      floors: floors ?? this.floors,
      activeKcal: activeKcal ?? this.activeKcal,
      exerciseMin: exerciseMin ?? this.exerciseMin,
      restingHeartRate: restingHeartRate ?? this.restingHeartRate,
      avgHeartRate: avgHeartRate ?? this.avgHeartRate,
      hrvMs: hrvMs ?? this.hrvMs,
      vo2Max: vo2Max ?? this.vo2Max,
      sleepMinutes: sleepMinutes ?? this.sleepMinutes,
      source: source ?? this.source,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $DailyActivityTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (distanceM.present) {
      map['distance_m'] = Variable<double>(distanceM.value);
    }
    if (floors.present) {
      map['floors'] = Variable<int>(floors.value);
    }
    if (activeKcal.present) {
      map['active_kcal'] = Variable<double>(activeKcal.value);
    }
    if (exerciseMin.present) {
      map['exercise_min'] = Variable<int>(exerciseMin.value);
    }
    if (restingHeartRate.present) {
      map['resting_heart_rate'] = Variable<int>(restingHeartRate.value);
    }
    if (avgHeartRate.present) {
      map['avg_heart_rate'] = Variable<int>(avgHeartRate.value);
    }
    if (hrvMs.present) {
      map['hrv_ms'] = Variable<double>(hrvMs.value);
    }
    if (vo2Max.present) {
      map['vo2_max'] = Variable<double>(vo2Max.value);
    }
    if (sleepMinutes.present) {
      map['sleep_minutes'] = Variable<int>(sleepMinutes.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $DailyActivityTable.$convertersource.toSql(source.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyActivityCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('day: $day, ')
          ..write('steps: $steps, ')
          ..write('distanceM: $distanceM, ')
          ..write('floors: $floors, ')
          ..write('activeKcal: $activeKcal, ')
          ..write('exerciseMin: $exerciseMin, ')
          ..write('restingHeartRate: $restingHeartRate, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write('hrvMs: $hrvMs, ')
          ..write('vo2Max: $vo2Max, ')
          ..write('sleepMinutes: $sleepMinutes, ')
          ..write('source: $source, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BodyMeasurementsTable extends BodyMeasurements
    with TableInfo<$BodyMeasurementsTable, BodyMeasurementRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyMeasurementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($BodyMeasurementsTable.$convertersyncStatus);
  @override
  late final GeneratedColumnWithTypeConverter<MeasurementType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MeasurementType>($BodyMeasurementsTable.$convertertype);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _measuredAtMeta = const VerificationMeta(
    'measuredAt',
  );
  @override
  late final GeneratedColumn<DateTime> measuredAt = GeneratedColumn<DateTime>(
    'measured_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    type,
    value,
    measuredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'body_measurements';
  @override
  VerificationContext validateIntegrity(
    Insertable<BodyMeasurementRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('measured_at')) {
      context.handle(
        _measuredAtMeta,
        measuredAt.isAcceptableOrUnknown(data['measured_at']!, _measuredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_measuredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyMeasurementRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyMeasurementRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $BodyMeasurementsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      type: $BodyMeasurementsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      measuredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}measured_at'],
      )!,
    );
  }

  @override
  $BodyMeasurementsTable createAlias(String alias) {
    return $BodyMeasurementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<MeasurementType, String, String> $convertertype =
      const EnumNameConverter<MeasurementType>(MeasurementType.values);
}

class BodyMeasurementRow extends DataClass
    implements Insertable<BodyMeasurementRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final MeasurementType type;
  final double value;
  final DateTime measuredAt;
  const BodyMeasurementRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.type,
    required this.value,
    required this.measuredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $BodyMeasurementsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    {
      map['type'] = Variable<String>(
        $BodyMeasurementsTable.$convertertype.toSql(type),
      );
    }
    map['value'] = Variable<double>(value);
    map['measured_at'] = Variable<DateTime>(measuredAt);
    return map;
  }

  BodyMeasurementsCompanion toCompanion(bool nullToAbsent) {
    return BodyMeasurementsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      type: Value(type),
      value: Value(value),
      measuredAt: Value(measuredAt),
    );
  }

  factory BodyMeasurementRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyMeasurementRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $BodyMeasurementsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      type: $BodyMeasurementsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      value: serializer.fromJson<double>(json['value']),
      measuredAt: serializer.fromJson<DateTime>(json['measuredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $BodyMeasurementsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'type': serializer.toJson<String>(
        $BodyMeasurementsTable.$convertertype.toJson(type),
      ),
      'value': serializer.toJson<double>(value),
      'measuredAt': serializer.toJson<DateTime>(measuredAt),
    };
  }

  BodyMeasurementRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    MeasurementType? type,
    double? value,
    DateTime? measuredAt,
  }) => BodyMeasurementRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    type: type ?? this.type,
    value: value ?? this.value,
    measuredAt: measuredAt ?? this.measuredAt,
  );
  BodyMeasurementRow copyWithCompanion(BodyMeasurementsCompanion data) {
    return BodyMeasurementRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      type: data.type.present ? data.type.value : this.type,
      value: data.value.present ? data.value.value : this.value,
      measuredAt: data.measuredAt.present
          ? data.measuredAt.value
          : this.measuredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('measuredAt: $measuredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    type,
    value,
    measuredAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyMeasurementRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.type == this.type &&
          other.value == this.value &&
          other.measuredAt == this.measuredAt);
}

class BodyMeasurementsCompanion extends UpdateCompanion<BodyMeasurementRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<MeasurementType> type;
  final Value<double> value;
  final Value<DateTime> measuredAt;
  final Value<int> rowid;
  const BodyMeasurementsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.type = const Value.absent(),
    this.value = const Value.absent(),
    this.measuredAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BodyMeasurementsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required MeasurementType type,
    required double value,
    required DateTime measuredAt,
    this.rowid = const Value.absent(),
  }) : type = Value(type),
       value = Value(value),
       measuredAt = Value(measuredAt);
  static Insertable<BodyMeasurementRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? type,
    Expression<double>? value,
    Expression<DateTime>? measuredAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
      if (measuredAt != null) 'measured_at': measuredAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BodyMeasurementsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<MeasurementType>? type,
    Value<double>? value,
    Value<DateTime>? measuredAt,
    Value<int>? rowid,
  }) {
    return BodyMeasurementsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      type: type ?? this.type,
      value: value ?? this.value,
      measuredAt: measuredAt ?? this.measuredAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $BodyMeasurementsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $BodyMeasurementsTable.$convertertype.toSql(type.value),
      );
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (measuredAt.present) {
      map['measured_at'] = Variable<DateTime>(measuredAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasurementsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgressPhotosTable extends ProgressPhotos
    with TableInfo<$ProgressPhotosTable, ProgressPhotoRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgressPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($ProgressPhotosTable.$convertersyncStatus);
  static const VerificationMeta _takenAtMeta = const VerificationMeta(
    'takenAt',
  );
  @override
  late final GeneratedColumn<DateTime> takenAt = GeneratedColumn<DateTime>(
    'taken_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PhotoPose, String> pose =
      GeneratedColumn<String>(
        'pose',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<PhotoPose>($ProgressPhotosTable.$converterpose);
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    takenAt,
    pose,
    localPath,
    weightKg,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'progress_photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgressPhotoRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('taken_at')) {
      context.handle(
        _takenAtMeta,
        takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta),
      );
    } else if (isInserting) {
      context.missing(_takenAtMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgressPhotoRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgressPhotoRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $ProgressPhotosTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      takenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}taken_at'],
      )!,
      pose: $ProgressPhotosTable.$converterpose.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}pose'],
        )!,
      ),
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $ProgressPhotosTable createAlias(String alias) {
    return $ProgressPhotosTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<PhotoPose, String, String> $converterpose =
      const EnumNameConverter<PhotoPose>(PhotoPose.values);
}

class ProgressPhotoRow extends DataClass
    implements Insertable<ProgressPhotoRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final DateTime takenAt;
  final PhotoPose pose;
  final String localPath;
  final double? weightKg;
  final String? note;
  const ProgressPhotoRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.takenAt,
    required this.pose,
    required this.localPath,
    this.weightKg,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $ProgressPhotosTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['taken_at'] = Variable<DateTime>(takenAt);
    {
      map['pose'] = Variable<String>(
        $ProgressPhotosTable.$converterpose.toSql(pose),
      );
    }
    map['local_path'] = Variable<String>(localPath);
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ProgressPhotosCompanion toCompanion(bool nullToAbsent) {
    return ProgressPhotosCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      takenAt: Value(takenAt),
      pose: Value(pose),
      localPath: Value(localPath),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory ProgressPhotoRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgressPhotoRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $ProgressPhotosTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      takenAt: serializer.fromJson<DateTime>(json['takenAt']),
      pose: $ProgressPhotosTable.$converterpose.fromJson(
        serializer.fromJson<String>(json['pose']),
      ),
      localPath: serializer.fromJson<String>(json['localPath']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $ProgressPhotosTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'takenAt': serializer.toJson<DateTime>(takenAt),
      'pose': serializer.toJson<String>(
        $ProgressPhotosTable.$converterpose.toJson(pose),
      ),
      'localPath': serializer.toJson<String>(localPath),
      'weightKg': serializer.toJson<double?>(weightKg),
      'note': serializer.toJson<String?>(note),
    };
  }

  ProgressPhotoRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    DateTime? takenAt,
    PhotoPose? pose,
    String? localPath,
    Value<double?> weightKg = const Value.absent(),
    Value<String?> note = const Value.absent(),
  }) => ProgressPhotoRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    takenAt: takenAt ?? this.takenAt,
    pose: pose ?? this.pose,
    localPath: localPath ?? this.localPath,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    note: note.present ? note.value : this.note,
  );
  ProgressPhotoRow copyWithCompanion(ProgressPhotosCompanion data) {
    return ProgressPhotoRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
      pose: data.pose.present ? data.pose.value : this.pose,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgressPhotoRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('takenAt: $takenAt, ')
          ..write('pose: $pose, ')
          ..write('localPath: $localPath, ')
          ..write('weightKg: $weightKg, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    takenAt,
    pose,
    localPath,
    weightKg,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgressPhotoRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.takenAt == this.takenAt &&
          other.pose == this.pose &&
          other.localPath == this.localPath &&
          other.weightKg == this.weightKg &&
          other.note == this.note);
}

class ProgressPhotosCompanion extends UpdateCompanion<ProgressPhotoRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> takenAt;
  final Value<PhotoPose> pose;
  final Value<String> localPath;
  final Value<double?> weightKg;
  final Value<String?> note;
  final Value<int> rowid;
  const ProgressPhotosCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.pose = const Value.absent(),
    this.localPath = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgressPhotosCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required DateTime takenAt,
    required PhotoPose pose,
    required String localPath,
    this.weightKg = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : takenAt = Value(takenAt),
       pose = Value(pose),
       localPath = Value(localPath);
  static Insertable<ProgressPhotoRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<DateTime>? takenAt,
    Expression<String>? pose,
    Expression<String>? localPath,
    Expression<double>? weightKg,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (takenAt != null) 'taken_at': takenAt,
      if (pose != null) 'pose': pose,
      if (localPath != null) 'local_path': localPath,
      if (weightKg != null) 'weight_kg': weightKg,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgressPhotosCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? takenAt,
    Value<PhotoPose>? pose,
    Value<String>? localPath,
    Value<double?>? weightKg,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return ProgressPhotosCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      takenAt: takenAt ?? this.takenAt,
      pose: pose ?? this.pose,
      localPath: localPath ?? this.localPath,
      weightKg: weightKg ?? this.weightKg,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $ProgressPhotosTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<DateTime>(takenAt.value);
    }
    if (pose.present) {
      map['pose'] = Variable<String>(
        $ProgressPhotosTable.$converterpose.toSql(pose.value),
      );
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgressPhotosCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('takenAt: $takenAt, ')
          ..write('pose: $pose, ')
          ..write('localPath: $localPath, ')
          ..write('weightKg: $weightKg, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WaterLogsTable extends WaterLogs
    with TableInfo<$WaterLogsTable, WaterLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaterLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($WaterLogsTable.$convertersyncStatus);
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMlMeta = const VerificationMeta(
    'amountMl',
  );
  @override
  late final GeneratedColumn<int> amountMl = GeneratedColumn<int>(
    'amount_ml',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    loggedAt,
    amountMl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'water_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<WaterLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('amount_ml')) {
      context.handle(
        _amountMlMeta,
        amountMl.isAcceptableOrUnknown(data['amount_ml']!, _amountMlMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaterLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaterLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $WaterLogsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      amountMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_ml'],
      )!,
    );
  }

  @override
  $WaterLogsTable createAlias(String alias) {
    return $WaterLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class WaterLogRow extends DataClass implements Insertable<WaterLogRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final DateTime loggedAt;
  final int amountMl;
  const WaterLogRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.loggedAt,
    required this.amountMl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $WaterLogsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    map['amount_ml'] = Variable<int>(amountMl);
    return map;
  }

  WaterLogsCompanion toCompanion(bool nullToAbsent) {
    return WaterLogsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      loggedAt: Value(loggedAt),
      amountMl: Value(amountMl),
    );
  }

  factory WaterLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaterLogRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $WaterLogsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      amountMl: serializer.fromJson<int>(json['amountMl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $WaterLogsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'amountMl': serializer.toJson<int>(amountMl),
    };
  }

  WaterLogRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    DateTime? loggedAt,
    int? amountMl,
  }) => WaterLogRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    loggedAt: loggedAt ?? this.loggedAt,
    amountMl: amountMl ?? this.amountMl,
  );
  WaterLogRow copyWithCompanion(WaterLogsCompanion data) {
    return WaterLogRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      amountMl: data.amountMl.present ? data.amountMl.value : this.amountMl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaterLogRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('amountMl: $amountMl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    loggedAt,
    amountMl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaterLogRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.loggedAt == this.loggedAt &&
          other.amountMl == this.amountMl);
}

class WaterLogsCompanion extends UpdateCompanion<WaterLogRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> loggedAt;
  final Value<int> amountMl;
  final Value<int> rowid;
  const WaterLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.amountMl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WaterLogsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required DateTime loggedAt,
    required int amountMl,
    this.rowid = const Value.absent(),
  }) : loggedAt = Value(loggedAt),
       amountMl = Value(amountMl);
  static Insertable<WaterLogRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<DateTime>? loggedAt,
    Expression<int>? amountMl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (amountMl != null) 'amount_ml': amountMl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WaterLogsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? loggedAt,
    Value<int>? amountMl,
    Value<int>? rowid,
  }) {
    return WaterLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      loggedAt: loggedAt ?? this.loggedAt,
      amountMl: amountMl ?? this.amountMl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $WaterLogsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (amountMl.present) {
      map['amount_ml'] = Variable<int>(amountMl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaterLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('amountMl: $amountMl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NutritionLogsTable extends NutritionLogs
    with TableInfo<$NutritionLogsTable, NutritionLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutritionLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($NutritionLogsTable.$convertersyncStatus);
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MealType, String> meal =
      GeneratedColumn<String>(
        'meal',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<MealType>($NutritionLogsTable.$convertermeal);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _proteinGMeta = const VerificationMeta(
    'proteinG',
  );
  @override
  late final GeneratedColumn<double> proteinG = GeneratedColumn<double>(
    'protein_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _carbsGMeta = const VerificationMeta('carbsG');
  @override
  late final GeneratedColumn<double> carbsG = GeneratedColumn<double>(
    'carbs_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fatGMeta = const VerificationMeta('fatG');
  @override
  late final GeneratedColumn<double> fatG = GeneratedColumn<double>(
    'fat_g',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    loggedAt,
    meal,
    name,
    calories,
    proteinG,
    carbsG,
    fatG,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nutrition_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<NutritionLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein_g')) {
      context.handle(
        _proteinGMeta,
        proteinG.isAcceptableOrUnknown(data['protein_g']!, _proteinGMeta),
      );
    }
    if (data.containsKey('carbs_g')) {
      context.handle(
        _carbsGMeta,
        carbsG.isAcceptableOrUnknown(data['carbs_g']!, _carbsGMeta),
      );
    }
    if (data.containsKey('fat_g')) {
      context.handle(
        _fatGMeta,
        fatG.isAcceptableOrUnknown(data['fat_g']!, _fatGMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NutritionLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NutritionLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $NutritionLogsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      meal: $NutritionLogsTable.$convertermeal.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}meal'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories'],
      )!,
      proteinG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein_g'],
      )!,
      carbsG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs_g'],
      )!,
      fatG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat_g'],
      )!,
    );
  }

  @override
  $NutritionLogsTable createAlias(String alias) {
    return $NutritionLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<MealType, String, String> $convertermeal =
      const EnumNameConverter<MealType>(MealType.values);
}

class NutritionLogRow extends DataClass implements Insertable<NutritionLogRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final DateTime loggedAt;
  final MealType meal;
  final String name;
  final int calories;
  final double proteinG;
  final double carbsG;
  final double fatG;
  const NutritionLogRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.loggedAt,
    required this.meal,
    required this.name,
    required this.calories,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $NutritionLogsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    {
      map['meal'] = Variable<String>(
        $NutritionLogsTable.$convertermeal.toSql(meal),
      );
    }
    map['name'] = Variable<String>(name);
    map['calories'] = Variable<int>(calories);
    map['protein_g'] = Variable<double>(proteinG);
    map['carbs_g'] = Variable<double>(carbsG);
    map['fat_g'] = Variable<double>(fatG);
    return map;
  }

  NutritionLogsCompanion toCompanion(bool nullToAbsent) {
    return NutritionLogsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      loggedAt: Value(loggedAt),
      meal: Value(meal),
      name: Value(name),
      calories: Value(calories),
      proteinG: Value(proteinG),
      carbsG: Value(carbsG),
      fatG: Value(fatG),
    );
  }

  factory NutritionLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NutritionLogRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $NutritionLogsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      meal: $NutritionLogsTable.$convertermeal.fromJson(
        serializer.fromJson<String>(json['meal']),
      ),
      name: serializer.fromJson<String>(json['name']),
      calories: serializer.fromJson<int>(json['calories']),
      proteinG: serializer.fromJson<double>(json['proteinG']),
      carbsG: serializer.fromJson<double>(json['carbsG']),
      fatG: serializer.fromJson<double>(json['fatG']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $NutritionLogsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'meal': serializer.toJson<String>(
        $NutritionLogsTable.$convertermeal.toJson(meal),
      ),
      'name': serializer.toJson<String>(name),
      'calories': serializer.toJson<int>(calories),
      'proteinG': serializer.toJson<double>(proteinG),
      'carbsG': serializer.toJson<double>(carbsG),
      'fatG': serializer.toJson<double>(fatG),
    };
  }

  NutritionLogRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    DateTime? loggedAt,
    MealType? meal,
    String? name,
    int? calories,
    double? proteinG,
    double? carbsG,
    double? fatG,
  }) => NutritionLogRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    loggedAt: loggedAt ?? this.loggedAt,
    meal: meal ?? this.meal,
    name: name ?? this.name,
    calories: calories ?? this.calories,
    proteinG: proteinG ?? this.proteinG,
    carbsG: carbsG ?? this.carbsG,
    fatG: fatG ?? this.fatG,
  );
  NutritionLogRow copyWithCompanion(NutritionLogsCompanion data) {
    return NutritionLogRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      meal: data.meal.present ? data.meal.value : this.meal,
      name: data.name.present ? data.name.value : this.name,
      calories: data.calories.present ? data.calories.value : this.calories,
      proteinG: data.proteinG.present ? data.proteinG.value : this.proteinG,
      carbsG: data.carbsG.present ? data.carbsG.value : this.carbsG,
      fatG: data.fatG.present ? data.fatG.value : this.fatG,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NutritionLogRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('meal: $meal, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('proteinG: $proteinG, ')
          ..write('carbsG: $carbsG, ')
          ..write('fatG: $fatG')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    loggedAt,
    meal,
    name,
    calories,
    proteinG,
    carbsG,
    fatG,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NutritionLogRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.loggedAt == this.loggedAt &&
          other.meal == this.meal &&
          other.name == this.name &&
          other.calories == this.calories &&
          other.proteinG == this.proteinG &&
          other.carbsG == this.carbsG &&
          other.fatG == this.fatG);
}

class NutritionLogsCompanion extends UpdateCompanion<NutritionLogRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<DateTime> loggedAt;
  final Value<MealType> meal;
  final Value<String> name;
  final Value<int> calories;
  final Value<double> proteinG;
  final Value<double> carbsG;
  final Value<double> fatG;
  final Value<int> rowid;
  const NutritionLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.meal = const Value.absent(),
    this.name = const Value.absent(),
    this.calories = const Value.absent(),
    this.proteinG = const Value.absent(),
    this.carbsG = const Value.absent(),
    this.fatG = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NutritionLogsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required DateTime loggedAt,
    required MealType meal,
    required String name,
    required int calories,
    this.proteinG = const Value.absent(),
    this.carbsG = const Value.absent(),
    this.fatG = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : loggedAt = Value(loggedAt),
       meal = Value(meal),
       name = Value(name),
       calories = Value(calories);
  static Insertable<NutritionLogRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<DateTime>? loggedAt,
    Expression<String>? meal,
    Expression<String>? name,
    Expression<int>? calories,
    Expression<double>? proteinG,
    Expression<double>? carbsG,
    Expression<double>? fatG,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (meal != null) 'meal': meal,
      if (name != null) 'name': name,
      if (calories != null) 'calories': calories,
      if (proteinG != null) 'protein_g': proteinG,
      if (carbsG != null) 'carbs_g': carbsG,
      if (fatG != null) 'fat_g': fatG,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NutritionLogsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<DateTime>? loggedAt,
    Value<MealType>? meal,
    Value<String>? name,
    Value<int>? calories,
    Value<double>? proteinG,
    Value<double>? carbsG,
    Value<double>? fatG,
    Value<int>? rowid,
  }) {
    return NutritionLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      loggedAt: loggedAt ?? this.loggedAt,
      meal: meal ?? this.meal,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      proteinG: proteinG ?? this.proteinG,
      carbsG: carbsG ?? this.carbsG,
      fatG: fatG ?? this.fatG,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $NutritionLogsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (meal.present) {
      map['meal'] = Variable<String>(
        $NutritionLogsTable.$convertermeal.toSql(meal.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (proteinG.present) {
      map['protein_g'] = Variable<double>(proteinG.value);
    }
    if (carbsG.present) {
      map['carbs_g'] = Variable<double>(carbsG.value);
    }
    if (fatG.present) {
      map['fat_g'] = Variable<double>(fatG.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutritionLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('meal: $meal, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('proteinG: $proteinG, ')
          ..write('carbsG: $carbsG, ')
          ..write('fatG: $fatG, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, AchievementRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($AchievementsTable.$convertersyncStatus);
  static const VerificationMeta _achievementKeyMeta = const VerificationMeta(
    'achievementKey',
  );
  @override
  late final GeneratedColumn<String> achievementKey = GeneratedColumn<String>(
    'achievement_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _unlockedAtMeta = const VerificationMeta(
    'unlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> unlockedAt = GeneratedColumn<DateTime>(
    'unlocked_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    achievementKey,
    progress,
    unlockedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
    Insertable<AchievementRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('achievement_key')) {
      context.handle(
        _achievementKeyMeta,
        achievementKey.isAcceptableOrUnknown(
          data['achievement_key']!,
          _achievementKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_achievementKeyMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('unlocked_at')) {
      context.handle(
        _unlockedAtMeta,
        unlockedAt.isAcceptableOrUnknown(data['unlocked_at']!, _unlockedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AchievementRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AchievementRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $AchievementsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      achievementKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}achievement_key'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      unlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}unlocked_at'],
      ),
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
}

class AchievementRow extends DataClass implements Insertable<AchievementRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String achievementKey;
  final double progress;
  final DateTime? unlockedAt;
  const AchievementRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.achievementKey,
    required this.progress,
    this.unlockedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $AchievementsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['achievement_key'] = Variable<String>(achievementKey);
    map['progress'] = Variable<double>(progress);
    if (!nullToAbsent || unlockedAt != null) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt);
    }
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      achievementKey: Value(achievementKey),
      progress: Value(progress),
      unlockedAt: unlockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockedAt),
    );
  }

  factory AchievementRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AchievementRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $AchievementsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      achievementKey: serializer.fromJson<String>(json['achievementKey']),
      progress: serializer.fromJson<double>(json['progress']),
      unlockedAt: serializer.fromJson<DateTime?>(json['unlockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $AchievementsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'achievementKey': serializer.toJson<String>(achievementKey),
      'progress': serializer.toJson<double>(progress),
      'unlockedAt': serializer.toJson<DateTime?>(unlockedAt),
    };
  }

  AchievementRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? achievementKey,
    double? progress,
    Value<DateTime?> unlockedAt = const Value.absent(),
  }) => AchievementRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    achievementKey: achievementKey ?? this.achievementKey,
    progress: progress ?? this.progress,
    unlockedAt: unlockedAt.present ? unlockedAt.value : this.unlockedAt,
  );
  AchievementRow copyWithCompanion(AchievementsCompanion data) {
    return AchievementRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      achievementKey: data.achievementKey.present
          ? data.achievementKey.value
          : this.achievementKey,
      progress: data.progress.present ? data.progress.value : this.progress,
      unlockedAt: data.unlockedAt.present
          ? data.unlockedAt.value
          : this.unlockedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AchievementRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('achievementKey: $achievementKey, ')
          ..write('progress: $progress, ')
          ..write('unlockedAt: $unlockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    achievementKey,
    progress,
    unlockedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AchievementRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.achievementKey == this.achievementKey &&
          other.progress == this.progress &&
          other.unlockedAt == this.unlockedAt);
}

class AchievementsCompanion extends UpdateCompanion<AchievementRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> achievementKey;
  final Value<double> progress;
  final Value<DateTime?> unlockedAt;
  final Value<int> rowid;
  const AchievementsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.achievementKey = const Value.absent(),
    this.progress = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String achievementKey,
    this.progress = const Value.absent(),
    this.unlockedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : achievementKey = Value(achievementKey);
  static Insertable<AchievementRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? achievementKey,
    Expression<double>? progress,
    Expression<DateTime>? unlockedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (achievementKey != null) 'achievement_key': achievementKey,
      if (progress != null) 'progress': progress,
      if (unlockedAt != null) 'unlocked_at': unlockedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? achievementKey,
    Value<double>? progress,
    Value<DateTime?>? unlockedAt,
    Value<int>? rowid,
  }) {
    return AchievementsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      achievementKey: achievementKey ?? this.achievementKey,
      progress: progress ?? this.progress,
      unlockedAt: unlockedAt ?? this.unlockedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $AchievementsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (achievementKey.present) {
      map['achievement_key'] = Variable<String>(achievementKey.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (unlockedAt.present) {
      map['unlocked_at'] = Variable<DateTime>(unlockedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('achievementKey: $achievementKey, ')
          ..write('progress: $progress, ')
          ..write('unlockedAt: $unlockedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonalRecordsTable extends PersonalRecords
    with TableInfo<$PersonalRecordsTable, PersonalRecordRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonalRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncStatus, String> syncStatus =
      GeneratedColumn<String>(
        'sync_status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncStatus.pending.name),
      ).withConverter<SyncStatus>($PersonalRecordsTable.$convertersyncStatus);
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RecordType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<RecordType>($PersonalRecordsTable.$convertertype);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
    'reps',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _achievedAtMeta = const VerificationMeta(
    'achievedAt',
  );
  @override
  late final GeneratedColumn<DateTime> achievedAt = GeneratedColumn<DateTime>(
    'achieved_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    exerciseId,
    type,
    value,
    reps,
    achievedAt,
    sessionId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personal_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonalRecordRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
        _repsMeta,
        reps.isAcceptableOrUnknown(data['reps']!, _repsMeta),
      );
    }
    if (data.containsKey('achieved_at')) {
      context.handle(
        _achievedAtMeta,
        achievedAt.isAcceptableOrUnknown(data['achieved_at']!, _achievedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_achievedAtMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonalRecordRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonalRecordRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
      syncStatus: $PersonalRecordsTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      type: $PersonalRecordsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      reps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reps'],
      ),
      achievedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}achieved_at'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      ),
    );
  }

  @override
  $PersonalRecordsTable createAlias(String alias) {
    return $PersonalRecordsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncStatus, String, String> $convertersyncStatus =
      const EnumNameConverter<SyncStatus>(SyncStatus.values);
  static JsonTypeConverter2<RecordType, String, String> $convertertype =
      const EnumNameConverter<RecordType>(RecordType.values);
}

class PersonalRecordRow extends DataClass
    implements Insertable<PersonalRecordRow> {
  final String id;

  /// Always null: the app has no accounts; data lives only on this device.
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final SyncStatus syncStatus;
  final String exerciseId;
  final RecordType type;
  final double value;
  final int? reps;
  final DateTime achievedAt;
  final String? sessionId;
  const PersonalRecordRow({
    required this.id,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
    required this.syncStatus,
    required this.exerciseId,
    required this.type,
    required this.value,
    this.reps,
    required this.achievedAt,
    this.sessionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    {
      map['sync_status'] = Variable<String>(
        $PersonalRecordsTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['exercise_id'] = Variable<String>(exerciseId);
    {
      map['type'] = Variable<String>(
        $PersonalRecordsTable.$convertertype.toSql(type),
      );
    }
    map['value'] = Variable<double>(value);
    if (!nullToAbsent || reps != null) {
      map['reps'] = Variable<int>(reps);
    }
    map['achieved_at'] = Variable<DateTime>(achievedAt);
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    return map;
  }

  PersonalRecordsCompanion toCompanion(bool nullToAbsent) {
    return PersonalRecordsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
      syncStatus: Value(syncStatus),
      exerciseId: Value(exerciseId),
      type: Value(type),
      value: Value(value),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      achievedAt: Value(achievedAt),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
    );
  }

  factory PersonalRecordRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonalRecordRow(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      syncStatus: $PersonalRecordsTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      type: $PersonalRecordsTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      value: serializer.fromJson<double>(json['value']),
      reps: serializer.fromJson<int?>(json['reps']),
      achievedAt: serializer.fromJson<DateTime>(json['achievedAt']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
      'syncStatus': serializer.toJson<String>(
        $PersonalRecordsTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'type': serializer.toJson<String>(
        $PersonalRecordsTable.$convertertype.toJson(type),
      ),
      'value': serializer.toJson<double>(value),
      'reps': serializer.toJson<int?>(reps),
      'achievedAt': serializer.toJson<DateTime>(achievedAt),
      'sessionId': serializer.toJson<String?>(sessionId),
    };
  }

  PersonalRecordRow copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
    SyncStatus? syncStatus,
    String? exerciseId,
    RecordType? type,
    double? value,
    Value<int?> reps = const Value.absent(),
    DateTime? achievedAt,
    Value<String?> sessionId = const Value.absent(),
  }) => PersonalRecordRow(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
    syncStatus: syncStatus ?? this.syncStatus,
    exerciseId: exerciseId ?? this.exerciseId,
    type: type ?? this.type,
    value: value ?? this.value,
    reps: reps.present ? reps.value : this.reps,
    achievedAt: achievedAt ?? this.achievedAt,
    sessionId: sessionId.present ? sessionId.value : this.sessionId,
  );
  PersonalRecordRow copyWithCompanion(PersonalRecordsCompanion data) {
    return PersonalRecordRow(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      type: data.type.present ? data.type.value : this.type,
      value: data.value.present ? data.value.value : this.value,
      reps: data.reps.present ? data.reps.value : this.reps,
      achievedAt: data.achievedAt.present
          ? data.achievedAt.value
          : this.achievedAt,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonalRecordRow(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('reps: $reps, ')
          ..write('achievedAt: $achievedAt, ')
          ..write('sessionId: $sessionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    createdAt,
    updatedAt,
    deleted,
    syncStatus,
    exerciseId,
    type,
    value,
    reps,
    achievedAt,
    sessionId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonalRecordRow &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted &&
          other.syncStatus == this.syncStatus &&
          other.exerciseId == this.exerciseId &&
          other.type == this.type &&
          other.value == this.value &&
          other.reps == this.reps &&
          other.achievedAt == this.achievedAt &&
          other.sessionId == this.sessionId);
}

class PersonalRecordsCompanion extends UpdateCompanion<PersonalRecordRow> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<SyncStatus> syncStatus;
  final Value<String> exerciseId;
  final Value<RecordType> type;
  final Value<double> value;
  final Value<int?> reps;
  final Value<DateTime> achievedAt;
  final Value<String?> sessionId;
  final Value<int> rowid;
  const PersonalRecordsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.type = const Value.absent(),
    this.value = const Value.absent(),
    this.reps = const Value.absent(),
    this.achievedAt = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonalRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String exerciseId,
    required RecordType type,
    required double value,
    this.reps = const Value.absent(),
    required DateTime achievedAt,
    this.sessionId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : exerciseId = Value(exerciseId),
       type = Value(type),
       value = Value(value),
       achievedAt = Value(achievedAt);
  static Insertable<PersonalRecordRow> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<String>? syncStatus,
    Expression<String>? exerciseId,
    Expression<String>? type,
    Expression<double>? value,
    Expression<int>? reps,
    Expression<DateTime>? achievedAt,
    Expression<String>? sessionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
      if (reps != null) 'reps': reps,
      if (achievedAt != null) 'achieved_at': achievedAt,
      if (sessionId != null) 'session_id': sessionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonalRecordsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? deleted,
    Value<SyncStatus>? syncStatus,
    Value<String>? exerciseId,
    Value<RecordType>? type,
    Value<double>? value,
    Value<int?>? reps,
    Value<DateTime>? achievedAt,
    Value<String?>? sessionId,
    Value<int>? rowid,
  }) {
    return PersonalRecordsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      syncStatus: syncStatus ?? this.syncStatus,
      exerciseId: exerciseId ?? this.exerciseId,
      type: type ?? this.type,
      value: value ?? this.value,
      reps: reps ?? this.reps,
      achievedAt: achievedAt ?? this.achievedAt,
      sessionId: sessionId ?? this.sessionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $PersonalRecordsTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $PersonalRecordsTable.$convertertype.toSql(type.value),
      );
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (achievedAt.present) {
      map['achieved_at'] = Variable<DateTime>(achievedAt.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonalRecordsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write('reps: $reps, ')
          ..write('achievedAt: $achievedAt, ')
          ..write('sessionId: $sessionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersProfileTable usersProfile = $UsersProfileTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $WorkoutTemplatesTable workoutTemplates = $WorkoutTemplatesTable(
    this,
  );
  late final $WorkoutSessionsTable workoutSessions = $WorkoutSessionsTable(
    this,
  );
  late final $ExerciseEntriesTable exerciseEntries = $ExerciseEntriesTable(
    this,
  );
  late final $SetEntriesTable setEntries = $SetEntriesTable(this);
  late final $PlansTable plans = $PlansTable(this);
  late final $PlanDaysTable planDays = $PlanDaysTable(this);
  late final $CardioSessionsTable cardioSessions = $CardioSessionsTable(this);
  late final $RoutePointsTable routePoints = $RoutePointsTable(this);
  late final $DailyActivityTable dailyActivity = $DailyActivityTable(this);
  late final $BodyMeasurementsTable bodyMeasurements = $BodyMeasurementsTable(
    this,
  );
  late final $ProgressPhotosTable progressPhotos = $ProgressPhotosTable(this);
  late final $WaterLogsTable waterLogs = $WaterLogsTable(this);
  late final $NutritionLogsTable nutritionLogs = $NutritionLogsTable(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $PersonalRecordsTable personalRecords = $PersonalRecordsTable(
    this,
  );
  late final Index routePointsSession = Index(
    'route_points_session',
    'CREATE INDEX route_points_session ON route_points (cardio_session_id, recorded_at)',
  );
  late final Index personalRecordsExercise = Index(
    'personal_records_exercise',
    'CREATE INDEX personal_records_exercise ON personal_records (exercise_id, type)',
  );
  late final ProfileDao profileDao = ProfileDao(this as AppDatabase);
  late final ExerciseDao exerciseDao = ExerciseDao(this as AppDatabase);
  late final WorkoutDao workoutDao = WorkoutDao(this as AppDatabase);
  late final PlanDao planDao = PlanDao(this as AppDatabase);
  late final ActivityDao activityDao = ActivityDao(this as AppDatabase);
  late final BodyDao bodyDao = BodyDao(this as AppDatabase);
  late final NutritionDao nutritionDao = NutritionDao(this as AppDatabase);
  late final ProgressDao progressDao = ProgressDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usersProfile,
    exercises,
    workoutTemplates,
    workoutSessions,
    exerciseEntries,
    setEntries,
    plans,
    planDays,
    cardioSessions,
    routePoints,
    dailyActivity,
    bodyMeasurements,
    progressPhotos,
    waterLogs,
    nutritionLogs,
    achievements,
    personalRecords,
    routePointsSession,
    personalRecordsExercise,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$UsersProfileTableCreateCompanionBuilder =
    UsersProfileCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String?> displayName,
      Value<String?> avatarPath,
      Value<TrainingGoal?> goal,
      Value<ExperienceLevel?> experience,
      Value<String> equipment,
      Value<int?> trainingDaysPerWeek,
      Value<double?> heightCm,
      Value<double?> weightKg,
      Value<int?> birthYear,
      Value<Sex?> sex,
      Value<WeightUnit> weightUnit,
      Value<DistanceUnit> distanceUnit,
      Value<AppThemeMode> themeMode,
      Value<int> moveGoalKcal,
      Value<int> exerciseGoalMin,
      Value<int> stepsGoal,
      Value<int> waterGoalMl,
      Value<bool> onboardingComplete,
      Value<int> xp,
      Value<String> dashboardCards,
      Value<bool> remindersEnabled,
      Value<int> reminderMinute,
      Value<int> rowid,
    });
typedef $$UsersProfileTableUpdateCompanionBuilder =
    UsersProfileCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String?> displayName,
      Value<String?> avatarPath,
      Value<TrainingGoal?> goal,
      Value<ExperienceLevel?> experience,
      Value<String> equipment,
      Value<int?> trainingDaysPerWeek,
      Value<double?> heightCm,
      Value<double?> weightKg,
      Value<int?> birthYear,
      Value<Sex?> sex,
      Value<WeightUnit> weightUnit,
      Value<DistanceUnit> distanceUnit,
      Value<AppThemeMode> themeMode,
      Value<int> moveGoalKcal,
      Value<int> exerciseGoalMin,
      Value<int> stepsGoal,
      Value<int> waterGoalMl,
      Value<bool> onboardingComplete,
      Value<int> xp,
      Value<String> dashboardCards,
      Value<bool> remindersEnabled,
      Value<int> reminderMinute,
      Value<int> rowid,
    });

class $$UsersProfileTableFilterComposer
    extends Composer<_$AppDatabase, $UsersProfileTable> {
  $$UsersProfileTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TrainingGoal?, TrainingGoal, String>
  get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<ExperienceLevel?, ExperienceLevel, String>
  get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trainingDaysPerWeek => $composableBuilder(
    column: $table.trainingDaysPerWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Sex?, Sex, String> get sex =>
      $composableBuilder(
        column: $table.sex,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<WeightUnit, WeightUnit, String>
  get weightUnit => $composableBuilder(
    column: $table.weightUnit,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<DistanceUnit, DistanceUnit, String>
  get distanceUnit => $composableBuilder(
    column: $table.distanceUnit,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<AppThemeMode, AppThemeMode, String>
  get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get moveGoalKcal => $composableBuilder(
    column: $table.moveGoalKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exerciseGoalMin => $composableBuilder(
    column: $table.exerciseGoalMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stepsGoal => $composableBuilder(
    column: $table.stepsGoal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get waterGoalMl => $composableBuilder(
    column: $table.waterGoalMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dashboardCards => $composableBuilder(
    column: $table.dashboardCards,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminderMinute => $composableBuilder(
    column: $table.reminderMinute,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersProfileTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersProfileTable> {
  $$UsersProfileTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goal => $composableBuilder(
    column: $table.goal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trainingDaysPerWeek => $composableBuilder(
    column: $table.trainingDaysPerWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weightUnit => $composableBuilder(
    column: $table.weightUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distanceUnit => $composableBuilder(
    column: $table.distanceUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moveGoalKcal => $composableBuilder(
    column: $table.moveGoalKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exerciseGoalMin => $composableBuilder(
    column: $table.exerciseGoalMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stepsGoal => $composableBuilder(
    column: $table.stepsGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get waterGoalMl => $composableBuilder(
    column: $table.waterGoalMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get xp => $composableBuilder(
    column: $table.xp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dashboardCards => $composableBuilder(
    column: $table.dashboardCards,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderMinute => $composableBuilder(
    column: $table.reminderMinute,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersProfileTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersProfileTable> {
  $$UsersProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get avatarPath => $composableBuilder(
    column: $table.avatarPath,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TrainingGoal?, String> get goal =>
      $composableBuilder(column: $table.goal, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ExperienceLevel?, String> get experience =>
      $composableBuilder(
        column: $table.experience,
        builder: (column) => column,
      );

  GeneratedColumn<String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumn<int> get trainingDaysPerWeek => $composableBuilder(
    column: $table.trainingDaysPerWeek,
    builder: (column) => column,
  );

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<int> get birthYear =>
      $composableBuilder(column: $table.birthYear, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Sex?, String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WeightUnit, String> get weightUnit =>
      $composableBuilder(
        column: $table.weightUnit,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<DistanceUnit, String> get distanceUnit =>
      $composableBuilder(
        column: $table.distanceUnit,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<AppThemeMode, String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<int> get moveGoalKcal => $composableBuilder(
    column: $table.moveGoalKcal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exerciseGoalMin => $composableBuilder(
    column: $table.exerciseGoalMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stepsGoal =>
      $composableBuilder(column: $table.stepsGoal, builder: (column) => column);

  GeneratedColumn<int> get waterGoalMl => $composableBuilder(
    column: $table.waterGoalMl,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get onboardingComplete => $composableBuilder(
    column: $table.onboardingComplete,
    builder: (column) => column,
  );

  GeneratedColumn<int> get xp =>
      $composableBuilder(column: $table.xp, builder: (column) => column);

  GeneratedColumn<String> get dashboardCards => $composableBuilder(
    column: $table.dashboardCards,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reminderMinute => $composableBuilder(
    column: $table.reminderMinute,
    builder: (column) => column,
  );
}

class $$UsersProfileTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersProfileTable,
          UserProfileRow,
          $$UsersProfileTableFilterComposer,
          $$UsersProfileTableOrderingComposer,
          $$UsersProfileTableAnnotationComposer,
          $$UsersProfileTableCreateCompanionBuilder,
          $$UsersProfileTableUpdateCompanionBuilder,
          (
            UserProfileRow,
            BaseReferences<_$AppDatabase, $UsersProfileTable, UserProfileRow>,
          ),
          UserProfileRow,
          PrefetchHooks Function()
        > {
  $$UsersProfileTableTableManager(_$AppDatabase db, $UsersProfileTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<TrainingGoal?> goal = const Value.absent(),
                Value<ExperienceLevel?> experience = const Value.absent(),
                Value<String> equipment = const Value.absent(),
                Value<int?> trainingDaysPerWeek = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
                Value<Sex?> sex = const Value.absent(),
                Value<WeightUnit> weightUnit = const Value.absent(),
                Value<DistanceUnit> distanceUnit = const Value.absent(),
                Value<AppThemeMode> themeMode = const Value.absent(),
                Value<int> moveGoalKcal = const Value.absent(),
                Value<int> exerciseGoalMin = const Value.absent(),
                Value<int> stepsGoal = const Value.absent(),
                Value<int> waterGoalMl = const Value.absent(),
                Value<bool> onboardingComplete = const Value.absent(),
                Value<int> xp = const Value.absent(),
                Value<String> dashboardCards = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<int> reminderMinute = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersProfileCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                displayName: displayName,
                avatarPath: avatarPath,
                goal: goal,
                experience: experience,
                equipment: equipment,
                trainingDaysPerWeek: trainingDaysPerWeek,
                heightCm: heightCm,
                weightKg: weightKg,
                birthYear: birthYear,
                sex: sex,
                weightUnit: weightUnit,
                distanceUnit: distanceUnit,
                themeMode: themeMode,
                moveGoalKcal: moveGoalKcal,
                exerciseGoalMin: exerciseGoalMin,
                stepsGoal: stepsGoal,
                waterGoalMl: waterGoalMl,
                onboardingComplete: onboardingComplete,
                xp: xp,
                dashboardCards: dashboardCards,
                remindersEnabled: remindersEnabled,
                reminderMinute: reminderMinute,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> avatarPath = const Value.absent(),
                Value<TrainingGoal?> goal = const Value.absent(),
                Value<ExperienceLevel?> experience = const Value.absent(),
                Value<String> equipment = const Value.absent(),
                Value<int?> trainingDaysPerWeek = const Value.absent(),
                Value<double?> heightCm = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
                Value<Sex?> sex = const Value.absent(),
                Value<WeightUnit> weightUnit = const Value.absent(),
                Value<DistanceUnit> distanceUnit = const Value.absent(),
                Value<AppThemeMode> themeMode = const Value.absent(),
                Value<int> moveGoalKcal = const Value.absent(),
                Value<int> exerciseGoalMin = const Value.absent(),
                Value<int> stepsGoal = const Value.absent(),
                Value<int> waterGoalMl = const Value.absent(),
                Value<bool> onboardingComplete = const Value.absent(),
                Value<int> xp = const Value.absent(),
                Value<String> dashboardCards = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<int> reminderMinute = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersProfileCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                displayName: displayName,
                avatarPath: avatarPath,
                goal: goal,
                experience: experience,
                equipment: equipment,
                trainingDaysPerWeek: trainingDaysPerWeek,
                heightCm: heightCm,
                weightKg: weightKg,
                birthYear: birthYear,
                sex: sex,
                weightUnit: weightUnit,
                distanceUnit: distanceUnit,
                themeMode: themeMode,
                moveGoalKcal: moveGoalKcal,
                exerciseGoalMin: exerciseGoalMin,
                stepsGoal: stepsGoal,
                waterGoalMl: waterGoalMl,
                onboardingComplete: onboardingComplete,
                xp: xp,
                dashboardCards: dashboardCards,
                remindersEnabled: remindersEnabled,
                reminderMinute: reminderMinute,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UsersProfileTable, UserProfileRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $UsersProfileTable,
                    UserProfileRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersProfileTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersProfileTable,
      UserProfileRow,
      $$UsersProfileTableFilterComposer,
      $$UsersProfileTableOrderingComposer,
      $$UsersProfileTableAnnotationComposer,
      $$UsersProfileTableCreateCompanionBuilder,
      $$UsersProfileTableUpdateCompanionBuilder,
      (
        UserProfileRow,
        BaseReferences<_$AppDatabase, $UsersProfileTable, UserProfileRow>,
      ),
      UserProfileRow,
      PrefetchHooks Function()
    >;
typedef $$ExercisesTableCreateCompanionBuilder = ExercisesCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  Value<String?> slug,
  required String name,
  required MuscleGroup primaryMuscle,
  Value<String> secondaryMuscles,
  required Equipment equipment,
  required Difficulty difficulty,
  required MovementPattern movementPattern,
  Value<String> instructions,
  Value<String> mistakes,
  Value<String?> animationAsset,
  Value<bool> isCustom,
  Value<bool> isFavorite,
  Value<int> rowid,
});
typedef $$ExercisesTableUpdateCompanionBuilder = ExercisesCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  Value<String?> slug,
  Value<String> name,
  Value<MuscleGroup> primaryMuscle,
  Value<String> secondaryMuscles,
  Value<Equipment> equipment,
  Value<Difficulty> difficulty,
  Value<MovementPattern> movementPattern,
  Value<String> instructions,
  Value<String> mistakes,
  Value<String?> animationAsset,
  Value<bool> isCustom,
  Value<bool> isFavorite,
  Value<int> rowid,
});

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MuscleGroup, MuscleGroup, String>
  get primaryMuscle => $composableBuilder(
    column: $table.primaryMuscle,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get secondaryMuscles => $composableBuilder(
    column: $table.secondaryMuscles,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Equipment, Equipment, String> get equipment =>
      $composableBuilder(
        column: $table.equipment,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Difficulty, Difficulty, String>
  get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<MovementPattern, MovementPattern, String>
  get movementPattern => $composableBuilder(
    column: $table.movementPattern,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mistakes => $composableBuilder(
    column: $table.mistakes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get animationAsset => $composableBuilder(
    column: $table.animationAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get primaryMuscle => $composableBuilder(
    column: $table.primaryMuscle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secondaryMuscles => $composableBuilder(
    column: $table.secondaryMuscles,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get equipment => $composableBuilder(
    column: $table.equipment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get movementPattern => $composableBuilder(
    column: $table.movementPattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mistakes => $composableBuilder(
    column: $table.mistakes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get animationAsset => $composableBuilder(
    column: $table.animationAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MuscleGroup, String> get primaryMuscle =>
      $composableBuilder(
        column: $table.primaryMuscle,
        builder: (column) => column,
      );

  GeneratedColumn<String> get secondaryMuscles => $composableBuilder(
    column: $table.secondaryMuscles,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Equipment, String> get equipment =>
      $composableBuilder(column: $table.equipment, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Difficulty, String> get difficulty =>
      $composableBuilder(
        column: $table.difficulty,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<MovementPattern, String>
  get movementPattern => $composableBuilder(
    column: $table.movementPattern,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mistakes =>
      $composableBuilder(column: $table.mistakes, builder: (column) => column);

  GeneratedColumn<String> get animationAsset => $composableBuilder(
    column: $table.animationAsset,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTable,
          ExerciseRow,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (
            ExerciseRow,
            BaseReferences<_$AppDatabase, $ExercisesTable, ExerciseRow>,
          ),
          ExerciseRow,
          PrefetchHooks Function()
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String?> slug = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<MuscleGroup> primaryMuscle = const Value.absent(),
                Value<String> secondaryMuscles = const Value.absent(),
                Value<Equipment> equipment = const Value.absent(),
                Value<Difficulty> difficulty = const Value.absent(),
                Value<MovementPattern> movementPattern = const Value.absent(),
                Value<String> instructions = const Value.absent(),
                Value<String> mistakes = const Value.absent(),
                Value<String?> animationAsset = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                slug: slug,
                name: name,
                primaryMuscle: primaryMuscle,
                secondaryMuscles: secondaryMuscles,
                equipment: equipment,
                difficulty: difficulty,
                movementPattern: movementPattern,
                instructions: instructions,
                mistakes: mistakes,
                animationAsset: animationAsset,
                isCustom: isCustom,
                isFavorite: isFavorite,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String?> slug = const Value.absent(),
                required String name,
                required MuscleGroup primaryMuscle,
                Value<String> secondaryMuscles = const Value.absent(),
                required Equipment equipment,
                required Difficulty difficulty,
                required MovementPattern movementPattern,
                Value<String> instructions = const Value.absent(),
                Value<String> mistakes = const Value.absent(),
                Value<String?> animationAsset = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                slug: slug,
                name: name,
                primaryMuscle: primaryMuscle,
                secondaryMuscles: secondaryMuscles,
                equipment: equipment,
                difficulty: difficulty,
                movementPattern: movementPattern,
                instructions: instructions,
                mistakes: mistakes,
                animationAsset: animationAsset,
                isCustom: isCustom,
                isFavorite: isFavorite,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExercisesTable, ExerciseRow>(table),
                  BaseReferences<_$AppDatabase, $ExercisesTable, ExerciseRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTable,
      ExerciseRow,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (
        ExerciseRow,
        BaseReferences<_$AppDatabase, $ExercisesTable, ExerciseRow>,
      ),
      ExerciseRow,
      PrefetchHooks Function()
    >;
typedef $$WorkoutTemplatesTableCreateCompanionBuilder =
    WorkoutTemplatesCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required String name,
      Value<String?> notes,
      Value<String> exercises,
      Value<int> rowid,
    });
typedef $$WorkoutTemplatesTableUpdateCompanionBuilder =
    WorkoutTemplatesCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String> name,
      Value<String?> notes,
      Value<String> exercises,
      Value<int> rowid,
    });

class $$WorkoutTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exercises => $composableBuilder(
    column: $table.exercises,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exercises => $composableBuilder(
    column: $table.exercises,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutTemplatesTable> {
  $$WorkoutTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get exercises =>
      $composableBuilder(column: $table.exercises, builder: (column) => column);
}

class $$WorkoutTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutTemplatesTable,
          WorkoutTemplateRow,
          $$WorkoutTemplatesTableFilterComposer,
          $$WorkoutTemplatesTableOrderingComposer,
          $$WorkoutTemplatesTableAnnotationComposer,
          $$WorkoutTemplatesTableCreateCompanionBuilder,
          $$WorkoutTemplatesTableUpdateCompanionBuilder,
          (
            WorkoutTemplateRow,
            BaseReferences<
              _$AppDatabase,
              $WorkoutTemplatesTable,
              WorkoutTemplateRow
            >,
          ),
          WorkoutTemplateRow,
          PrefetchHooks Function()
        > {
  $$WorkoutTemplatesTableTableManager(
    _$AppDatabase db,
    $WorkoutTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> exercises = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplatesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                name: name,
                notes: notes,
                exercises: exercises,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String name,
                Value<String?> notes = const Value.absent(),
                Value<String> exercises = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutTemplatesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                name: name,
                notes: notes,
                exercises: exercises,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WorkoutTemplatesTable, WorkoutTemplateRow>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $WorkoutTemplatesTable,
                    WorkoutTemplateRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutTemplatesTable,
      WorkoutTemplateRow,
      $$WorkoutTemplatesTableFilterComposer,
      $$WorkoutTemplatesTableOrderingComposer,
      $$WorkoutTemplatesTableAnnotationComposer,
      $$WorkoutTemplatesTableCreateCompanionBuilder,
      $$WorkoutTemplatesTableUpdateCompanionBuilder,
      (
        WorkoutTemplateRow,
        BaseReferences<
          _$AppDatabase,
          $WorkoutTemplatesTable,
          WorkoutTemplateRow
        >,
      ),
      WorkoutTemplateRow,
      PrefetchHooks Function()
    >;
typedef $$WorkoutSessionsTableCreateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required String name,
      Value<String?> templateId,
      Value<String?> planDayId,
      required DateTime startedAt,
      Value<DateTime?> endedAt,
      Value<String?> notes,
      Value<double> totalVolumeKg,
      Value<double?> caloriesKcal,
      Value<WorkoutSource> source,
      Value<bool> healthSynced,
      Value<int> rowid,
    });
typedef $$WorkoutSessionsTableUpdateCompanionBuilder =
    WorkoutSessionsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String> name,
      Value<String?> templateId,
      Value<String?> planDayId,
      Value<DateTime> startedAt,
      Value<DateTime?> endedAt,
      Value<String?> notes,
      Value<double> totalVolumeKg,
      Value<double?> caloriesKcal,
      Value<WorkoutSource> source,
      Value<bool> healthSynced,
      Value<int> rowid,
    });

class $$WorkoutSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get planDayId => $composableBuilder(
    column: $table.planDayId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalVolumeKg => $composableBuilder(
    column: $table.totalVolumeKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get caloriesKcal => $composableBuilder(
    column: $table.caloriesKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WorkoutSource, WorkoutSource, String>
  get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get healthSynced => $composableBuilder(
    column: $table.healthSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkoutSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planDayId => $composableBuilder(
    column: $table.planDayId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalVolumeKg => $composableBuilder(
    column: $table.totalVolumeKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get caloriesKcal => $composableBuilder(
    column: $table.caloriesKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get healthSynced => $composableBuilder(
    column: $table.healthSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkoutSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkoutSessionsTable> {
  $$WorkoutSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get templateId => $composableBuilder(
    column: $table.templateId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get planDayId =>
      $composableBuilder(column: $table.planDayId, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<double> get totalVolumeKg => $composableBuilder(
    column: $table.totalVolumeKg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get caloriesKcal => $composableBuilder(
    column: $table.caloriesKcal,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<WorkoutSource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<bool> get healthSynced => $composableBuilder(
    column: $table.healthSynced,
    builder: (column) => column,
  );
}

class $$WorkoutSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkoutSessionsTable,
          WorkoutSessionRow,
          $$WorkoutSessionsTableFilterComposer,
          $$WorkoutSessionsTableOrderingComposer,
          $$WorkoutSessionsTableAnnotationComposer,
          $$WorkoutSessionsTableCreateCompanionBuilder,
          $$WorkoutSessionsTableUpdateCompanionBuilder,
          (
            WorkoutSessionRow,
            BaseReferences<
              _$AppDatabase,
              $WorkoutSessionsTable,
              WorkoutSessionRow
            >,
          ),
          WorkoutSessionRow,
          PrefetchHooks Function()
        > {
  $$WorkoutSessionsTableTableManager(
    _$AppDatabase db,
    $WorkoutSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkoutSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkoutSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkoutSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> templateId = const Value.absent(),
                Value<String?> planDayId = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<double> totalVolumeKg = const Value.absent(),
                Value<double?> caloriesKcal = const Value.absent(),
                Value<WorkoutSource> source = const Value.absent(),
                Value<bool> healthSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                name: name,
                templateId: templateId,
                planDayId: planDayId,
                startedAt: startedAt,
                endedAt: endedAt,
                notes: notes,
                totalVolumeKg: totalVolumeKg,
                caloriesKcal: caloriesKcal,
                source: source,
                healthSynced: healthSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String name,
                Value<String?> templateId = const Value.absent(),
                Value<String?> planDayId = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<double> totalVolumeKg = const Value.absent(),
                Value<double?> caloriesKcal = const Value.absent(),
                Value<WorkoutSource> source = const Value.absent(),
                Value<bool> healthSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkoutSessionsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                name: name,
                templateId: templateId,
                planDayId: planDayId,
                startedAt: startedAt,
                endedAt: endedAt,
                notes: notes,
                totalVolumeKg: totalVolumeKg,
                caloriesKcal: caloriesKcal,
                source: source,
                healthSynced: healthSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WorkoutSessionsTable, WorkoutSessionRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $WorkoutSessionsTable,
                    WorkoutSessionRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkoutSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkoutSessionsTable,
      WorkoutSessionRow,
      $$WorkoutSessionsTableFilterComposer,
      $$WorkoutSessionsTableOrderingComposer,
      $$WorkoutSessionsTableAnnotationComposer,
      $$WorkoutSessionsTableCreateCompanionBuilder,
      $$WorkoutSessionsTableUpdateCompanionBuilder,
      (
        WorkoutSessionRow,
        BaseReferences<_$AppDatabase, $WorkoutSessionsTable, WorkoutSessionRow>,
      ),
      WorkoutSessionRow,
      PrefetchHooks Function()
    >;
typedef $$ExerciseEntriesTableCreateCompanionBuilder =
    ExerciseEntriesCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required String sessionId,
      required String exerciseId,
      required int position,
      Value<int?> supersetGroup,
      Value<int> restSeconds,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ExerciseEntriesTableUpdateCompanionBuilder =
    ExerciseEntriesCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String> sessionId,
      Value<String> exerciseId,
      Value<int> position,
      Value<int?> supersetGroup,
      Value<int> restSeconds,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$ExerciseEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseEntriesTable> {
  $$ExerciseEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get supersetGroup => $composableBuilder(
    column: $table.supersetGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExerciseEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseEntriesTable> {
  $$ExerciseEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get supersetGroup => $composableBuilder(
    column: $table.supersetGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExerciseEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseEntriesTable> {
  $$ExerciseEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<int> get supersetGroup => $composableBuilder(
    column: $table.supersetGroup,
    builder: (column) => column,
  );

  GeneratedColumn<int> get restSeconds => $composableBuilder(
    column: $table.restSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ExerciseEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseEntriesTable,
          ExerciseEntryRow,
          $$ExerciseEntriesTableFilterComposer,
          $$ExerciseEntriesTableOrderingComposer,
          $$ExerciseEntriesTableAnnotationComposer,
          $$ExerciseEntriesTableCreateCompanionBuilder,
          $$ExerciseEntriesTableUpdateCompanionBuilder,
          (
            ExerciseEntryRow,
            BaseReferences<
              _$AppDatabase,
              $ExerciseEntriesTable,
              ExerciseEntryRow
            >,
          ),
          ExerciseEntryRow,
          PrefetchHooks Function()
        > {
  $$ExerciseEntriesTableTableManager(
    _$AppDatabase db,
    $ExerciseEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int?> supersetGroup = const Value.absent(),
                Value<int> restSeconds = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseEntriesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                sessionId: sessionId,
                exerciseId: exerciseId,
                position: position,
                supersetGroup: supersetGroup,
                restSeconds: restSeconds,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String sessionId,
                required String exerciseId,
                required int position,
                Value<int?> supersetGroup = const Value.absent(),
                Value<int> restSeconds = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExerciseEntriesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                sessionId: sessionId,
                exerciseId: exerciseId,
                position: position,
                supersetGroup: supersetGroup,
                restSeconds: restSeconds,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ExerciseEntriesTable, ExerciseEntryRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ExerciseEntriesTable,
                    ExerciseEntryRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExerciseEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseEntriesTable,
      ExerciseEntryRow,
      $$ExerciseEntriesTableFilterComposer,
      $$ExerciseEntriesTableOrderingComposer,
      $$ExerciseEntriesTableAnnotationComposer,
      $$ExerciseEntriesTableCreateCompanionBuilder,
      $$ExerciseEntriesTableUpdateCompanionBuilder,
      (
        ExerciseEntryRow,
        BaseReferences<_$AppDatabase, $ExerciseEntriesTable, ExerciseEntryRow>,
      ),
      ExerciseEntryRow,
      PrefetchHooks Function()
    >;
typedef $$SetEntriesTableCreateCompanionBuilder = SetEntriesCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  required String exerciseEntryId,
  required int position,
  Value<SetType> setType,
  Value<double?> weightKg,
  Value<int?> reps,
  Value<double?> rpe,
  Value<int?> durationSec,
  Value<double?> distanceM,
  Value<DateTime?> completedAt,
  Value<int> rowid,
});
typedef $$SetEntriesTableUpdateCompanionBuilder = SetEntriesCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  Value<String> exerciseEntryId,
  Value<int> position,
  Value<SetType> setType,
  Value<double?> weightKg,
  Value<int?> reps,
  Value<double?> rpe,
  Value<int?> durationSec,
  Value<double?> distanceM,
  Value<DateTime?> completedAt,
  Value<int> rowid,
});

class $$SetEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SetEntriesTable> {
  $$SetEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get exerciseEntryId => $composableBuilder(
    column: $table.exerciseEntryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SetType, SetType, String> get setType =>
      $composableBuilder(
        column: $table.setType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SetEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SetEntriesTable> {
  $$SetEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseEntryId => $composableBuilder(
    column: $table.exerciseEntryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setType => $composableBuilder(
    column: $table.setType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rpe => $composableBuilder(
    column: $table.rpe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SetEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SetEntriesTable> {
  $$SetEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get exerciseEntryId => $composableBuilder(
    column: $table.exerciseEntryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SetType, String> get setType =>
      $composableBuilder(column: $table.setType, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<double> get rpe =>
      $composableBuilder(column: $table.rpe, builder: (column) => column);

  GeneratedColumn<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distanceM =>
      $composableBuilder(column: $table.distanceM, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$SetEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SetEntriesTable,
          SetEntryRow,
          $$SetEntriesTableFilterComposer,
          $$SetEntriesTableOrderingComposer,
          $$SetEntriesTableAnnotationComposer,
          $$SetEntriesTableCreateCompanionBuilder,
          $$SetEntriesTableUpdateCompanionBuilder,
          (
            SetEntryRow,
            BaseReferences<_$AppDatabase, $SetEntriesTable, SetEntryRow>,
          ),
          SetEntryRow,
          PrefetchHooks Function()
        > {
  $$SetEntriesTableTableManager(_$AppDatabase db, $SetEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SetEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SetEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SetEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> exerciseEntryId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<SetType> setType = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<double?> rpe = const Value.absent(),
                Value<int?> durationSec = const Value.absent(),
                Value<double?> distanceM = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetEntriesCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                exerciseEntryId: exerciseEntryId,
                position: position,
                setType: setType,
                weightKg: weightKg,
                reps: reps,
                rpe: rpe,
                durationSec: durationSec,
                distanceM: distanceM,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String exerciseEntryId,
                required int position,
                Value<SetType> setType = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<double?> rpe = const Value.absent(),
                Value<int?> durationSec = const Value.absent(),
                Value<double?> distanceM = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SetEntriesCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                exerciseEntryId: exerciseEntryId,
                position: position,
                setType: setType,
                weightKg: weightKg,
                reps: reps,
                rpe: rpe,
                durationSec: durationSec,
                distanceM: distanceM,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SetEntriesTable, SetEntryRow>(table),
                  BaseReferences<_$AppDatabase, $SetEntriesTable, SetEntryRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SetEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SetEntriesTable,
      SetEntryRow,
      $$SetEntriesTableFilterComposer,
      $$SetEntriesTableOrderingComposer,
      $$SetEntriesTableAnnotationComposer,
      $$SetEntriesTableCreateCompanionBuilder,
      $$SetEntriesTableUpdateCompanionBuilder,
      (
        SetEntryRow,
        BaseReferences<_$AppDatabase, $SetEntriesTable, SetEntryRow>,
      ),
      SetEntryRow,
      PrefetchHooks Function()
    >;
typedef $$PlansTableCreateCompanionBuilder = PlansCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  required String name,
  Value<String?> description,
  Value<bool> isPrebuilt,
  Value<bool> active,
  Value<DateTime?> startDate,
  Value<int?> weeks,
  Value<int> rowid,
});
typedef $$PlansTableUpdateCompanionBuilder = PlansCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  Value<String> name,
  Value<String?> description,
  Value<bool> isPrebuilt,
  Value<bool> active,
  Value<DateTime?> startDate,
  Value<int?> weeks,
  Value<int> rowid,
});

class $$PlansTableFilterComposer extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPrebuilt => $composableBuilder(
    column: $table.isPrebuilt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weeks => $composableBuilder(
    column: $table.weeks,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlansTableOrderingComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPrebuilt => $composableBuilder(
    column: $table.isPrebuilt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weeks => $composableBuilder(
    column: $table.weeks,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPrebuilt => $composableBuilder(
    column: $table.isPrebuilt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get weeks =>
      $composableBuilder(column: $table.weeks, builder: (column) => column);
}

class $$PlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlansTable,
          PlanRow,
          $$PlansTableFilterComposer,
          $$PlansTableOrderingComposer,
          $$PlansTableAnnotationComposer,
          $$PlansTableCreateCompanionBuilder,
          $$PlansTableUpdateCompanionBuilder,
          (PlanRow, BaseReferences<_$AppDatabase, $PlansTable, PlanRow>),
          PlanRow,
          PrefetchHooks Function()
        > {
  $$PlansTableTableManager(_$AppDatabase db, $PlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isPrebuilt = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<int?> weeks = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlansCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                name: name,
                description: description,
                isPrebuilt: isPrebuilt,
                active: active,
                startDate: startDate,
                weeks: weeks,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<bool> isPrebuilt = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<int?> weeks = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlansCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                name: name,
                description: description,
                isPrebuilt: isPrebuilt,
                active: active,
                startDate: startDate,
                weeks: weeks,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlansTable, PlanRow>(table),
                  BaseReferences<_$AppDatabase, $PlansTable, PlanRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlansTable,
      PlanRow,
      $$PlansTableFilterComposer,
      $$PlansTableOrderingComposer,
      $$PlansTableAnnotationComposer,
      $$PlansTableCreateCompanionBuilder,
      $$PlansTableUpdateCompanionBuilder,
      (PlanRow, BaseReferences<_$AppDatabase, $PlansTable, PlanRow>),
      PlanRow,
      PrefetchHooks Function()
    >;
typedef $$PlanDaysTableCreateCompanionBuilder = PlanDaysCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  required String planId,
  required int position,
  required String name,
  Value<int?> weekday,
  Value<String> exercises,
  Value<int> rowid,
});
typedef $$PlanDaysTableUpdateCompanionBuilder = PlanDaysCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  Value<String> planId,
  Value<int> position,
  Value<String> name,
  Value<int?> weekday,
  Value<String> exercises,
  Value<int> rowid,
});

class $$PlanDaysTableFilterComposer
    extends Composer<_$AppDatabase, $PlanDaysTable> {
  $$PlanDaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exercises => $composableBuilder(
    column: $table.exercises,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlanDaysTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanDaysTable> {
  $$PlanDaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get planId => $composableBuilder(
    column: $table.planId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exercises => $composableBuilder(
    column: $table.exercises,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlanDaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanDaysTable> {
  $$PlanDaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get planId =>
      $composableBuilder(column: $table.planId, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get weekday =>
      $composableBuilder(column: $table.weekday, builder: (column) => column);

  GeneratedColumn<String> get exercises =>
      $composableBuilder(column: $table.exercises, builder: (column) => column);
}

class $$PlanDaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlanDaysTable,
          PlanDayRow,
          $$PlanDaysTableFilterComposer,
          $$PlanDaysTableOrderingComposer,
          $$PlanDaysTableAnnotationComposer,
          $$PlanDaysTableCreateCompanionBuilder,
          $$PlanDaysTableUpdateCompanionBuilder,
          (
            PlanDayRow,
            BaseReferences<_$AppDatabase, $PlanDaysTable, PlanDayRow>,
          ),
          PlanDayRow,
          PrefetchHooks Function()
        > {
  $$PlanDaysTableTableManager(_$AppDatabase db, $PlanDaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanDaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanDaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanDaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> planId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> weekday = const Value.absent(),
                Value<String> exercises = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlanDaysCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                planId: planId,
                position: position,
                name: name,
                weekday: weekday,
                exercises: exercises,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String planId,
                required int position,
                required String name,
                Value<int?> weekday = const Value.absent(),
                Value<String> exercises = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlanDaysCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                planId: planId,
                position: position,
                name: name,
                weekday: weekday,
                exercises: exercises,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlanDaysTable, PlanDayRow>(table),
                  BaseReferences<_$AppDatabase, $PlanDaysTable, PlanDayRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlanDaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlanDaysTable,
      PlanDayRow,
      $$PlanDaysTableFilterComposer,
      $$PlanDaysTableOrderingComposer,
      $$PlanDaysTableAnnotationComposer,
      $$PlanDaysTableCreateCompanionBuilder,
      $$PlanDaysTableUpdateCompanionBuilder,
      (PlanDayRow, BaseReferences<_$AppDatabase, $PlanDaysTable, PlanDayRow>),
      PlanDayRow,
      PrefetchHooks Function()
    >;
typedef $$CardioSessionsTableCreateCompanionBuilder =
    CardioSessionsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required CardioType type,
      required CardioSource source,
      required DateTime startedAt,
      Value<DateTime?> endedAt,
      Value<int> durationSec,
      Value<double> distanceM,
      Value<double?> caloriesKcal,
      Value<double?> elevationGainM,
      Value<int?> avgHeartRate,
      Value<int?> maxHeartRate,
      Value<int?> steps,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$CardioSessionsTableUpdateCompanionBuilder =
    CardioSessionsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<CardioType> type,
      Value<CardioSource> source,
      Value<DateTime> startedAt,
      Value<DateTime?> endedAt,
      Value<int> durationSec,
      Value<double> distanceM,
      Value<double?> caloriesKcal,
      Value<double?> elevationGainM,
      Value<int?> avgHeartRate,
      Value<int?> maxHeartRate,
      Value<int?> steps,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$CardioSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $CardioSessionsTable> {
  $$CardioSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<CardioType, CardioType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<CardioSource, CardioSource, String>
  get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get caloriesKcal => $composableBuilder(
    column: $table.caloriesKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get elevationGainM => $composableBuilder(
    column: $table.elevationGainM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHeartRate => $composableBuilder(
    column: $table.maxHeartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CardioSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardioSessionsTable> {
  $$CardioSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get caloriesKcal => $composableBuilder(
    column: $table.caloriesKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get elevationGainM => $composableBuilder(
    column: $table.elevationGainM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHeartRate => $composableBuilder(
    column: $table.maxHeartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CardioSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardioSessionsTable> {
  $$CardioSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<CardioType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CardioSource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distanceM =>
      $composableBuilder(column: $table.distanceM, builder: (column) => column);

  GeneratedColumn<double> get caloriesKcal => $composableBuilder(
    column: $table.caloriesKcal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get elevationGainM => $composableBuilder(
    column: $table.elevationGainM,
    builder: (column) => column,
  );

  GeneratedColumn<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxHeartRate => $composableBuilder(
    column: $table.maxHeartRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$CardioSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardioSessionsTable,
          CardioSessionRow,
          $$CardioSessionsTableFilterComposer,
          $$CardioSessionsTableOrderingComposer,
          $$CardioSessionsTableAnnotationComposer,
          $$CardioSessionsTableCreateCompanionBuilder,
          $$CardioSessionsTableUpdateCompanionBuilder,
          (
            CardioSessionRow,
            BaseReferences<
              _$AppDatabase,
              $CardioSessionsTable,
              CardioSessionRow
            >,
          ),
          CardioSessionRow,
          PrefetchHooks Function()
        > {
  $$CardioSessionsTableTableManager(
    _$AppDatabase db,
    $CardioSessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardioSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardioSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardioSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<CardioType> type = const Value.absent(),
                Value<CardioSource> source = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> durationSec = const Value.absent(),
                Value<double> distanceM = const Value.absent(),
                Value<double?> caloriesKcal = const Value.absent(),
                Value<double?> elevationGainM = const Value.absent(),
                Value<int?> avgHeartRate = const Value.absent(),
                Value<int?> maxHeartRate = const Value.absent(),
                Value<int?> steps = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardioSessionsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                type: type,
                source: source,
                startedAt: startedAt,
                endedAt: endedAt,
                durationSec: durationSec,
                distanceM: distanceM,
                caloriesKcal: caloriesKcal,
                elevationGainM: elevationGainM,
                avgHeartRate: avgHeartRate,
                maxHeartRate: maxHeartRate,
                steps: steps,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required CardioType type,
                required CardioSource source,
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                Value<int> durationSec = const Value.absent(),
                Value<double> distanceM = const Value.absent(),
                Value<double?> caloriesKcal = const Value.absent(),
                Value<double?> elevationGainM = const Value.absent(),
                Value<int?> avgHeartRate = const Value.absent(),
                Value<int?> maxHeartRate = const Value.absent(),
                Value<int?> steps = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardioSessionsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                type: type,
                source: source,
                startedAt: startedAt,
                endedAt: endedAt,
                durationSec: durationSec,
                distanceM: distanceM,
                caloriesKcal: caloriesKcal,
                elevationGainM: elevationGainM,
                avgHeartRate: avgHeartRate,
                maxHeartRate: maxHeartRate,
                steps: steps,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CardioSessionsTable, CardioSessionRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $CardioSessionsTable,
                    CardioSessionRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CardioSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardioSessionsTable,
      CardioSessionRow,
      $$CardioSessionsTableFilterComposer,
      $$CardioSessionsTableOrderingComposer,
      $$CardioSessionsTableAnnotationComposer,
      $$CardioSessionsTableCreateCompanionBuilder,
      $$CardioSessionsTableUpdateCompanionBuilder,
      (
        CardioSessionRow,
        BaseReferences<_$AppDatabase, $CardioSessionsTable, CardioSessionRow>,
      ),
      CardioSessionRow,
      PrefetchHooks Function()
    >;
typedef $$RoutePointsTableCreateCompanionBuilder =
    RoutePointsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required String cardioSessionId,
      required DateTime recordedAt,
      required double latitude,
      required double longitude,
      Value<double?> altitudeM,
      Value<double?> speedMps,
      Value<double?> accuracyM,
      Value<int?> heartRate,
      Value<int> rowid,
    });
typedef $$RoutePointsTableUpdateCompanionBuilder =
    RoutePointsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String> cardioSessionId,
      Value<DateTime> recordedAt,
      Value<double> latitude,
      Value<double> longitude,
      Value<double?> altitudeM,
      Value<double?> speedMps,
      Value<double?> accuracyM,
      Value<int?> heartRate,
      Value<int> rowid,
    });

class $$RoutePointsTableFilterComposer
    extends Composer<_$AppDatabase, $RoutePointsTable> {
  $$RoutePointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get cardioSessionId => $composableBuilder(
    column: $table.cardioSessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get altitudeM => $composableBuilder(
    column: $table.altitudeM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get speedMps => $composableBuilder(
    column: $table.speedMps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get accuracyM => $composableBuilder(
    column: $table.accuracyM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get heartRate => $composableBuilder(
    column: $table.heartRate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoutePointsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoutePointsTable> {
  $$RoutePointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardioSessionId => $composableBuilder(
    column: $table.cardioSessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get altitudeM => $composableBuilder(
    column: $table.altitudeM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get speedMps => $composableBuilder(
    column: $table.speedMps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get accuracyM => $composableBuilder(
    column: $table.accuracyM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get heartRate => $composableBuilder(
    column: $table.heartRate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoutePointsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoutePointsTable> {
  $$RoutePointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get cardioSessionId => $composableBuilder(
    column: $table.cardioSessionId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get altitudeM =>
      $composableBuilder(column: $table.altitudeM, builder: (column) => column);

  GeneratedColumn<double> get speedMps =>
      $composableBuilder(column: $table.speedMps, builder: (column) => column);

  GeneratedColumn<double> get accuracyM =>
      $composableBuilder(column: $table.accuracyM, builder: (column) => column);

  GeneratedColumn<int> get heartRate =>
      $composableBuilder(column: $table.heartRate, builder: (column) => column);
}

class $$RoutePointsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoutePointsTable,
          RoutePointRow,
          $$RoutePointsTableFilterComposer,
          $$RoutePointsTableOrderingComposer,
          $$RoutePointsTableAnnotationComposer,
          $$RoutePointsTableCreateCompanionBuilder,
          $$RoutePointsTableUpdateCompanionBuilder,
          (
            RoutePointRow,
            BaseReferences<_$AppDatabase, $RoutePointsTable, RoutePointRow>,
          ),
          RoutePointRow,
          PrefetchHooks Function()
        > {
  $$RoutePointsTableTableManager(_$AppDatabase db, $RoutePointsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoutePointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoutePointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoutePointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> cardioSessionId = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<double?> altitudeM = const Value.absent(),
                Value<double?> speedMps = const Value.absent(),
                Value<double?> accuracyM = const Value.absent(),
                Value<int?> heartRate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutePointsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                cardioSessionId: cardioSessionId,
                recordedAt: recordedAt,
                latitude: latitude,
                longitude: longitude,
                altitudeM: altitudeM,
                speedMps: speedMps,
                accuracyM: accuracyM,
                heartRate: heartRate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String cardioSessionId,
                required DateTime recordedAt,
                required double latitude,
                required double longitude,
                Value<double?> altitudeM = const Value.absent(),
                Value<double?> speedMps = const Value.absent(),
                Value<double?> accuracyM = const Value.absent(),
                Value<int?> heartRate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoutePointsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                cardioSessionId: cardioSessionId,
                recordedAt: recordedAt,
                latitude: latitude,
                longitude: longitude,
                altitudeM: altitudeM,
                speedMps: speedMps,
                accuracyM: accuracyM,
                heartRate: heartRate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RoutePointsTable, RoutePointRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $RoutePointsTable,
                    RoutePointRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoutePointsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoutePointsTable,
      RoutePointRow,
      $$RoutePointsTableFilterComposer,
      $$RoutePointsTableOrderingComposer,
      $$RoutePointsTableAnnotationComposer,
      $$RoutePointsTableCreateCompanionBuilder,
      $$RoutePointsTableUpdateCompanionBuilder,
      (
        RoutePointRow,
        BaseReferences<_$AppDatabase, $RoutePointsTable, RoutePointRow>,
      ),
      RoutePointRow,
      PrefetchHooks Function()
    >;
typedef $$DailyActivityTableCreateCompanionBuilder =
    DailyActivityCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required String day,
      Value<int> steps,
      Value<double> distanceM,
      Value<int> floors,
      Value<double> activeKcal,
      Value<int> exerciseMin,
      Value<int?> restingHeartRate,
      Value<int?> avgHeartRate,
      Value<double?> hrvMs,
      Value<double?> vo2Max,
      Value<int?> sleepMinutes,
      Value<ActivitySource> source,
      Value<int> rowid,
    });
typedef $$DailyActivityTableUpdateCompanionBuilder =
    DailyActivityCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String> day,
      Value<int> steps,
      Value<double> distanceM,
      Value<int> floors,
      Value<double> activeKcal,
      Value<int> exerciseMin,
      Value<int?> restingHeartRate,
      Value<int?> avgHeartRate,
      Value<double?> hrvMs,
      Value<double?> vo2Max,
      Value<int?> sleepMinutes,
      Value<ActivitySource> source,
      Value<int> rowid,
    });

class $$DailyActivityTableFilterComposer
    extends Composer<_$AppDatabase, $DailyActivityTable> {
  $$DailyActivityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get floors => $composableBuilder(
    column: $table.floors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get activeKcal => $composableBuilder(
    column: $table.activeKcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exerciseMin => $composableBuilder(
    column: $table.exerciseMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restingHeartRate => $composableBuilder(
    column: $table.restingHeartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hrvMs => $composableBuilder(
    column: $table.hrvMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get vo2Max => $composableBuilder(
    column: $table.vo2Max,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sleepMinutes => $composableBuilder(
    column: $table.sleepMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ActivitySource, ActivitySource, String>
  get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$DailyActivityTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyActivityTable> {
  $$DailyActivityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distanceM => $composableBuilder(
    column: $table.distanceM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get floors => $composableBuilder(
    column: $table.floors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get activeKcal => $composableBuilder(
    column: $table.activeKcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exerciseMin => $composableBuilder(
    column: $table.exerciseMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restingHeartRate => $composableBuilder(
    column: $table.restingHeartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hrvMs => $composableBuilder(
    column: $table.hrvMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get vo2Max => $composableBuilder(
    column: $table.vo2Max,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sleepMinutes => $composableBuilder(
    column: $table.sleepMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyActivityTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyActivityTable> {
  $$DailyActivityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<double> get distanceM =>
      $composableBuilder(column: $table.distanceM, builder: (column) => column);

  GeneratedColumn<int> get floors =>
      $composableBuilder(column: $table.floors, builder: (column) => column);

  GeneratedColumn<double> get activeKcal => $composableBuilder(
    column: $table.activeKcal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exerciseMin => $composableBuilder(
    column: $table.exerciseMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get restingHeartRate => $composableBuilder(
    column: $table.restingHeartRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get hrvMs =>
      $composableBuilder(column: $table.hrvMs, builder: (column) => column);

  GeneratedColumn<double> get vo2Max =>
      $composableBuilder(column: $table.vo2Max, builder: (column) => column);

  GeneratedColumn<int> get sleepMinutes => $composableBuilder(
    column: $table.sleepMinutes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ActivitySource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$DailyActivityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyActivityTable,
          DailyActivityRow,
          $$DailyActivityTableFilterComposer,
          $$DailyActivityTableOrderingComposer,
          $$DailyActivityTableAnnotationComposer,
          $$DailyActivityTableCreateCompanionBuilder,
          $$DailyActivityTableUpdateCompanionBuilder,
          (
            DailyActivityRow,
            BaseReferences<
              _$AppDatabase,
              $DailyActivityTable,
              DailyActivityRow
            >,
          ),
          DailyActivityRow,
          PrefetchHooks Function()
        > {
  $$DailyActivityTableTableManager(_$AppDatabase db, $DailyActivityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyActivityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyActivityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyActivityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<int> steps = const Value.absent(),
                Value<double> distanceM = const Value.absent(),
                Value<int> floors = const Value.absent(),
                Value<double> activeKcal = const Value.absent(),
                Value<int> exerciseMin = const Value.absent(),
                Value<int?> restingHeartRate = const Value.absent(),
                Value<int?> avgHeartRate = const Value.absent(),
                Value<double?> hrvMs = const Value.absent(),
                Value<double?> vo2Max = const Value.absent(),
                Value<int?> sleepMinutes = const Value.absent(),
                Value<ActivitySource> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyActivityCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                day: day,
                steps: steps,
                distanceM: distanceM,
                floors: floors,
                activeKcal: activeKcal,
                exerciseMin: exerciseMin,
                restingHeartRate: restingHeartRate,
                avgHeartRate: avgHeartRate,
                hrvMs: hrvMs,
                vo2Max: vo2Max,
                sleepMinutes: sleepMinutes,
                source: source,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String day,
                Value<int> steps = const Value.absent(),
                Value<double> distanceM = const Value.absent(),
                Value<int> floors = const Value.absent(),
                Value<double> activeKcal = const Value.absent(),
                Value<int> exerciseMin = const Value.absent(),
                Value<int?> restingHeartRate = const Value.absent(),
                Value<int?> avgHeartRate = const Value.absent(),
                Value<double?> hrvMs = const Value.absent(),
                Value<double?> vo2Max = const Value.absent(),
                Value<int?> sleepMinutes = const Value.absent(),
                Value<ActivitySource> source = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyActivityCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                day: day,
                steps: steps,
                distanceM: distanceM,
                floors: floors,
                activeKcal: activeKcal,
                exerciseMin: exerciseMin,
                restingHeartRate: restingHeartRate,
                avgHeartRate: avgHeartRate,
                hrvMs: hrvMs,
                vo2Max: vo2Max,
                sleepMinutes: sleepMinutes,
                source: source,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DailyActivityTable, DailyActivityRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $DailyActivityTable,
                    DailyActivityRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyActivityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyActivityTable,
      DailyActivityRow,
      $$DailyActivityTableFilterComposer,
      $$DailyActivityTableOrderingComposer,
      $$DailyActivityTableAnnotationComposer,
      $$DailyActivityTableCreateCompanionBuilder,
      $$DailyActivityTableUpdateCompanionBuilder,
      (
        DailyActivityRow,
        BaseReferences<_$AppDatabase, $DailyActivityTable, DailyActivityRow>,
      ),
      DailyActivityRow,
      PrefetchHooks Function()
    >;
typedef $$BodyMeasurementsTableCreateCompanionBuilder =
    BodyMeasurementsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required MeasurementType type,
      required double value,
      required DateTime measuredAt,
      Value<int> rowid,
    });
typedef $$BodyMeasurementsTableUpdateCompanionBuilder =
    BodyMeasurementsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<MeasurementType> type,
      Value<double> value,
      Value<DateTime> measuredAt,
      Value<int> rowid,
    });

class $$BodyMeasurementsTableFilterComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<MeasurementType, MeasurementType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BodyMeasurementsTableOrderingComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BodyMeasurementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BodyMeasurementsTable> {
  $$BodyMeasurementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<MeasurementType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => column,
  );
}

class $$BodyMeasurementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BodyMeasurementsTable,
          BodyMeasurementRow,
          $$BodyMeasurementsTableFilterComposer,
          $$BodyMeasurementsTableOrderingComposer,
          $$BodyMeasurementsTableAnnotationComposer,
          $$BodyMeasurementsTableCreateCompanionBuilder,
          $$BodyMeasurementsTableUpdateCompanionBuilder,
          (
            BodyMeasurementRow,
            BaseReferences<
              _$AppDatabase,
              $BodyMeasurementsTable,
              BodyMeasurementRow
            >,
          ),
          BodyMeasurementRow,
          PrefetchHooks Function()
        > {
  $$BodyMeasurementsTableTableManager(
    _$AppDatabase db,
    $BodyMeasurementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BodyMeasurementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BodyMeasurementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BodyMeasurementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<MeasurementType> type = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<DateTime> measuredAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BodyMeasurementsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                type: type,
                value: value,
                measuredAt: measuredAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required MeasurementType type,
                required double value,
                required DateTime measuredAt,
                Value<int> rowid = const Value.absent(),
              }) => BodyMeasurementsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                type: type,
                value: value,
                measuredAt: measuredAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BodyMeasurementsTable, BodyMeasurementRow>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $BodyMeasurementsTable,
                    BodyMeasurementRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BodyMeasurementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BodyMeasurementsTable,
      BodyMeasurementRow,
      $$BodyMeasurementsTableFilterComposer,
      $$BodyMeasurementsTableOrderingComposer,
      $$BodyMeasurementsTableAnnotationComposer,
      $$BodyMeasurementsTableCreateCompanionBuilder,
      $$BodyMeasurementsTableUpdateCompanionBuilder,
      (
        BodyMeasurementRow,
        BaseReferences<
          _$AppDatabase,
          $BodyMeasurementsTable,
          BodyMeasurementRow
        >,
      ),
      BodyMeasurementRow,
      PrefetchHooks Function()
    >;
typedef $$ProgressPhotosTableCreateCompanionBuilder =
    ProgressPhotosCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required DateTime takenAt,
      required PhotoPose pose,
      required String localPath,
      Value<double?> weightKg,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$ProgressPhotosTableUpdateCompanionBuilder =
    ProgressPhotosCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<DateTime> takenAt,
      Value<PhotoPose> pose,
      Value<String> localPath,
      Value<double?> weightKg,
      Value<String?> note,
      Value<int> rowid,
    });

class $$ProgressPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $ProgressPhotosTable> {
  $$ProgressPhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PhotoPose, PhotoPose, String> get pose =>
      $composableBuilder(
        column: $table.pose,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProgressPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgressPhotosTable> {
  $$ProgressPhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pose => $composableBuilder(
    column: $table.pose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProgressPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgressPhotosTable> {
  $$ProgressPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PhotoPose, String> get pose =>
      $composableBuilder(column: $table.pose, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$ProgressPhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgressPhotosTable,
          ProgressPhotoRow,
          $$ProgressPhotosTableFilterComposer,
          $$ProgressPhotosTableOrderingComposer,
          $$ProgressPhotosTableAnnotationComposer,
          $$ProgressPhotosTableCreateCompanionBuilder,
          $$ProgressPhotosTableUpdateCompanionBuilder,
          (
            ProgressPhotoRow,
            BaseReferences<
              _$AppDatabase,
              $ProgressPhotosTable,
              ProgressPhotoRow
            >,
          ),
          ProgressPhotoRow,
          PrefetchHooks Function()
        > {
  $$ProgressPhotosTableTableManager(
    _$AppDatabase db,
    $ProgressPhotosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgressPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgressPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgressPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> takenAt = const Value.absent(),
                Value<PhotoPose> pose = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressPhotosCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                takenAt: takenAt,
                pose: pose,
                localPath: localPath,
                weightKg: weightKg,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime takenAt,
                required PhotoPose pose,
                required String localPath,
                Value<double?> weightKg = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressPhotosCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                takenAt: takenAt,
                pose: pose,
                localPath: localPath,
                weightKg: weightKg,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ProgressPhotosTable, ProgressPhotoRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ProgressPhotosTable,
                    ProgressPhotoRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProgressPhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgressPhotosTable,
      ProgressPhotoRow,
      $$ProgressPhotosTableFilterComposer,
      $$ProgressPhotosTableOrderingComposer,
      $$ProgressPhotosTableAnnotationComposer,
      $$ProgressPhotosTableCreateCompanionBuilder,
      $$ProgressPhotosTableUpdateCompanionBuilder,
      (
        ProgressPhotoRow,
        BaseReferences<_$AppDatabase, $ProgressPhotosTable, ProgressPhotoRow>,
      ),
      ProgressPhotoRow,
      PrefetchHooks Function()
    >;
typedef $$WaterLogsTableCreateCompanionBuilder = WaterLogsCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  required DateTime loggedAt,
  required int amountMl,
  Value<int> rowid,
});
typedef $$WaterLogsTableUpdateCompanionBuilder = WaterLogsCompanion Function({
  Value<String> id,
  Value<String?> userId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<SyncStatus> syncStatus,
  Value<DateTime> loggedAt,
  Value<int> amountMl,
  Value<int> rowid,
});

class $$WaterLogsTableFilterComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMl => $composableBuilder(
    column: $table.amountMl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WaterLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMl => $composableBuilder(
    column: $table.amountMl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WaterLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WaterLogsTable> {
  $$WaterLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumn<int> get amountMl =>
      $composableBuilder(column: $table.amountMl, builder: (column) => column);
}

class $$WaterLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WaterLogsTable,
          WaterLogRow,
          $$WaterLogsTableFilterComposer,
          $$WaterLogsTableOrderingComposer,
          $$WaterLogsTableAnnotationComposer,
          $$WaterLogsTableCreateCompanionBuilder,
          $$WaterLogsTableUpdateCompanionBuilder,
          (
            WaterLogRow,
            BaseReferences<_$AppDatabase, $WaterLogsTable, WaterLogRow>,
          ),
          WaterLogRow,
          PrefetchHooks Function()
        > {
  $$WaterLogsTableTableManager(_$AppDatabase db, $WaterLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WaterLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WaterLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WaterLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> amountMl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WaterLogsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                loggedAt: loggedAt,
                amountMl: amountMl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime loggedAt,
                required int amountMl,
                Value<int> rowid = const Value.absent(),
              }) => WaterLogsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                loggedAt: loggedAt,
                amountMl: amountMl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WaterLogsTable, WaterLogRow>(table),
                  BaseReferences<_$AppDatabase, $WaterLogsTable, WaterLogRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WaterLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WaterLogsTable,
      WaterLogRow,
      $$WaterLogsTableFilterComposer,
      $$WaterLogsTableOrderingComposer,
      $$WaterLogsTableAnnotationComposer,
      $$WaterLogsTableCreateCompanionBuilder,
      $$WaterLogsTableUpdateCompanionBuilder,
      (
        WaterLogRow,
        BaseReferences<_$AppDatabase, $WaterLogsTable, WaterLogRow>,
      ),
      WaterLogRow,
      PrefetchHooks Function()
    >;
typedef $$NutritionLogsTableCreateCompanionBuilder =
    NutritionLogsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required DateTime loggedAt,
      required MealType meal,
      required String name,
      required int calories,
      Value<double> proteinG,
      Value<double> carbsG,
      Value<double> fatG,
      Value<int> rowid,
    });
typedef $$NutritionLogsTableUpdateCompanionBuilder =
    NutritionLogsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<DateTime> loggedAt,
      Value<MealType> meal,
      Value<String> name,
      Value<int> calories,
      Value<double> proteinG,
      Value<double> carbsG,
      Value<double> fatG,
      Value<int> rowid,
    });

class $$NutritionLogsTableFilterComposer
    extends Composer<_$AppDatabase, $NutritionLogsTable> {
  $$NutritionLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MealType, MealType, String> get meal =>
      $composableBuilder(
        column: $table.meal,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get proteinG => $composableBuilder(
    column: $table.proteinG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbsG => $composableBuilder(
    column: $table.carbsG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fatG => $composableBuilder(
    column: $table.fatG,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NutritionLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $NutritionLogsTable> {
  $$NutritionLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meal => $composableBuilder(
    column: $table.meal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get proteinG => $composableBuilder(
    column: $table.proteinG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbsG => $composableBuilder(
    column: $table.carbsG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fatG => $composableBuilder(
    column: $table.fatG,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NutritionLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NutritionLogsTable> {
  $$NutritionLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MealType, String> get meal =>
      $composableBuilder(column: $table.meal, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<double> get proteinG =>
      $composableBuilder(column: $table.proteinG, builder: (column) => column);

  GeneratedColumn<double> get carbsG =>
      $composableBuilder(column: $table.carbsG, builder: (column) => column);

  GeneratedColumn<double> get fatG =>
      $composableBuilder(column: $table.fatG, builder: (column) => column);
}

class $$NutritionLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NutritionLogsTable,
          NutritionLogRow,
          $$NutritionLogsTableFilterComposer,
          $$NutritionLogsTableOrderingComposer,
          $$NutritionLogsTableAnnotationComposer,
          $$NutritionLogsTableCreateCompanionBuilder,
          $$NutritionLogsTableUpdateCompanionBuilder,
          (
            NutritionLogRow,
            BaseReferences<_$AppDatabase, $NutritionLogsTable, NutritionLogRow>,
          ),
          NutritionLogRow,
          PrefetchHooks Function()
        > {
  $$NutritionLogsTableTableManager(_$AppDatabase db, $NutritionLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NutritionLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NutritionLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NutritionLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<MealType> meal = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> calories = const Value.absent(),
                Value<double> proteinG = const Value.absent(),
                Value<double> carbsG = const Value.absent(),
                Value<double> fatG = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NutritionLogsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                loggedAt: loggedAt,
                meal: meal,
                name: name,
                calories: calories,
                proteinG: proteinG,
                carbsG: carbsG,
                fatG: fatG,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required DateTime loggedAt,
                required MealType meal,
                required String name,
                required int calories,
                Value<double> proteinG = const Value.absent(),
                Value<double> carbsG = const Value.absent(),
                Value<double> fatG = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NutritionLogsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                loggedAt: loggedAt,
                meal: meal,
                name: name,
                calories: calories,
                proteinG: proteinG,
                carbsG: carbsG,
                fatG: fatG,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$NutritionLogsTable, NutritionLogRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $NutritionLogsTable,
                    NutritionLogRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NutritionLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NutritionLogsTable,
      NutritionLogRow,
      $$NutritionLogsTableFilterComposer,
      $$NutritionLogsTableOrderingComposer,
      $$NutritionLogsTableAnnotationComposer,
      $$NutritionLogsTableCreateCompanionBuilder,
      $$NutritionLogsTableUpdateCompanionBuilder,
      (
        NutritionLogRow,
        BaseReferences<_$AppDatabase, $NutritionLogsTable, NutritionLogRow>,
      ),
      NutritionLogRow,
      PrefetchHooks Function()
    >;
typedef $$AchievementsTableCreateCompanionBuilder =
    AchievementsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required String achievementKey,
      Value<double> progress,
      Value<DateTime?> unlockedAt,
      Value<int> rowid,
    });
typedef $$AchievementsTableUpdateCompanionBuilder =
    AchievementsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String> achievementKey,
      Value<double> progress,
      Value<DateTime?> unlockedAt,
      Value<int> rowid,
    });

class $$AchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get achievementKey => $composableBuilder(
    column: $table.achievementKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievementKey => $composableBuilder(
    column: $table.achievementKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AchievementsTable> {
  $$AchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get achievementKey => $composableBuilder(
    column: $table.achievementKey,
    builder: (column) => column,
  );

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<DateTime> get unlockedAt => $composableBuilder(
    column: $table.unlockedAt,
    builder: (column) => column,
  );
}

class $$AchievementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AchievementsTable,
          AchievementRow,
          $$AchievementsTableFilterComposer,
          $$AchievementsTableOrderingComposer,
          $$AchievementsTableAnnotationComposer,
          $$AchievementsTableCreateCompanionBuilder,
          $$AchievementsTableUpdateCompanionBuilder,
          (
            AchievementRow,
            BaseReferences<_$AppDatabase, $AchievementsTable, AchievementRow>,
          ),
          AchievementRow,
          PrefetchHooks Function()
        > {
  $$AchievementsTableTableManager(_$AppDatabase db, $AchievementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AchievementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> achievementKey = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<DateTime?> unlockedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                achievementKey: achievementKey,
                progress: progress,
                unlockedAt: unlockedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String achievementKey,
                Value<double> progress = const Value.absent(),
                Value<DateTime?> unlockedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AchievementsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                achievementKey: achievementKey,
                progress: progress,
                unlockedAt: unlockedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AchievementsTable, AchievementRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $AchievementsTable,
                    AchievementRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AchievementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AchievementsTable,
      AchievementRow,
      $$AchievementsTableFilterComposer,
      $$AchievementsTableOrderingComposer,
      $$AchievementsTableAnnotationComposer,
      $$AchievementsTableCreateCompanionBuilder,
      $$AchievementsTableUpdateCompanionBuilder,
      (
        AchievementRow,
        BaseReferences<_$AppDatabase, $AchievementsTable, AchievementRow>,
      ),
      AchievementRow,
      PrefetchHooks Function()
    >;
typedef $$PersonalRecordsTableCreateCompanionBuilder =
    PersonalRecordsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      required String exerciseId,
      required RecordType type,
      required double value,
      Value<int?> reps,
      required DateTime achievedAt,
      Value<String?> sessionId,
      Value<int> rowid,
    });
typedef $$PersonalRecordsTableUpdateCompanionBuilder =
    PersonalRecordsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> deleted,
      Value<SyncStatus> syncStatus,
      Value<String> exerciseId,
      Value<RecordType> type,
      Value<double> value,
      Value<int?> reps,
      Value<DateTime> achievedAt,
      Value<String?> sessionId,
      Value<int> rowid,
    });

class $$PersonalRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $PersonalRecordsTable> {
  $$PersonalRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncStatus, SyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RecordType, RecordType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get achievedAt => $composableBuilder(
    column: $table.achievedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonalRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonalRecordsTable> {
  $$PersonalRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reps => $composableBuilder(
    column: $table.reps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get achievedAt => $composableBuilder(
    column: $table.achievedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonalRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonalRecordsTable> {
  $$PersonalRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<RecordType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get reps =>
      $composableBuilder(column: $table.reps, builder: (column) => column);

  GeneratedColumn<DateTime> get achievedAt => $composableBuilder(
    column: $table.achievedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);
}

class $$PersonalRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonalRecordsTable,
          PersonalRecordRow,
          $$PersonalRecordsTableFilterComposer,
          $$PersonalRecordsTableOrderingComposer,
          $$PersonalRecordsTableAnnotationComposer,
          $$PersonalRecordsTableCreateCompanionBuilder,
          $$PersonalRecordsTableUpdateCompanionBuilder,
          (
            PersonalRecordRow,
            BaseReferences<
              _$AppDatabase,
              $PersonalRecordsTable,
              PersonalRecordRow
            >,
          ),
          PersonalRecordRow,
          PrefetchHooks Function()
        > {
  $$PersonalRecordsTableTableManager(
    _$AppDatabase db,
    $PersonalRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonalRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonalRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonalRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<RecordType> type = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<int?> reps = const Value.absent(),
                Value<DateTime> achievedAt = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonalRecordsCompanion(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                exerciseId: exerciseId,
                type: type,
                value: value,
                reps: reps,
                achievedAt: achievedAt,
                sessionId: sessionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<SyncStatus> syncStatus = const Value.absent(),
                required String exerciseId,
                required RecordType type,
                required double value,
                Value<int?> reps = const Value.absent(),
                required DateTime achievedAt,
                Value<String?> sessionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonalRecordsCompanion.insert(
                id: id,
                userId: userId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
                syncStatus: syncStatus,
                exerciseId: exerciseId,
                type: type,
                value: value,
                reps: reps,
                achievedAt: achievedAt,
                sessionId: sessionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonalRecordsTable, PersonalRecordRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $PersonalRecordsTable,
                    PersonalRecordRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PersonalRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonalRecordsTable,
      PersonalRecordRow,
      $$PersonalRecordsTableFilterComposer,
      $$PersonalRecordsTableOrderingComposer,
      $$PersonalRecordsTableAnnotationComposer,
      $$PersonalRecordsTableCreateCompanionBuilder,
      $$PersonalRecordsTableUpdateCompanionBuilder,
      (
        PersonalRecordRow,
        BaseReferences<_$AppDatabase, $PersonalRecordsTable, PersonalRecordRow>,
      ),
      PersonalRecordRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersProfileTableTableManager get usersProfile =>
      $$UsersProfileTableTableManager(_db, _db.usersProfile);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$WorkoutTemplatesTableTableManager get workoutTemplates =>
      $$WorkoutTemplatesTableTableManager(_db, _db.workoutTemplates);
  $$WorkoutSessionsTableTableManager get workoutSessions =>
      $$WorkoutSessionsTableTableManager(_db, _db.workoutSessions);
  $$ExerciseEntriesTableTableManager get exerciseEntries =>
      $$ExerciseEntriesTableTableManager(_db, _db.exerciseEntries);
  $$SetEntriesTableTableManager get setEntries =>
      $$SetEntriesTableTableManager(_db, _db.setEntries);
  $$PlansTableTableManager get plans =>
      $$PlansTableTableManager(_db, _db.plans);
  $$PlanDaysTableTableManager get planDays =>
      $$PlanDaysTableTableManager(_db, _db.planDays);
  $$CardioSessionsTableTableManager get cardioSessions =>
      $$CardioSessionsTableTableManager(_db, _db.cardioSessions);
  $$RoutePointsTableTableManager get routePoints =>
      $$RoutePointsTableTableManager(_db, _db.routePoints);
  $$DailyActivityTableTableManager get dailyActivity =>
      $$DailyActivityTableTableManager(_db, _db.dailyActivity);
  $$BodyMeasurementsTableTableManager get bodyMeasurements =>
      $$BodyMeasurementsTableTableManager(_db, _db.bodyMeasurements);
  $$ProgressPhotosTableTableManager get progressPhotos =>
      $$ProgressPhotosTableTableManager(_db, _db.progressPhotos);
  $$WaterLogsTableTableManager get waterLogs =>
      $$WaterLogsTableTableManager(_db, _db.waterLogs);
  $$NutritionLogsTableTableManager get nutritionLogs =>
      $$NutritionLogsTableTableManager(_db, _db.nutritionLogs);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$PersonalRecordsTableTableManager get personalRecords =>
      $$PersonalRecordsTableTableManager(_db, _db.personalRecords);
}
