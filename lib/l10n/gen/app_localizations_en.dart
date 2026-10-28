// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PULSE';

  @override
  String get tabHome => 'Home';

  @override
  String get tabTrain => 'Train';

  @override
  String get tabActivity => 'Activity';

  @override
  String get tabProgress => 'Progress';

  @override
  String get tabProfile => 'Profile';

  @override
  String get startWorkout => 'Start workout';

  @override
  String get logWorkout => 'Log workout';

  @override
  String get collapseSidebar => 'Collapse sidebar';

  @override
  String get expandSidebar => 'Expand sidebar';

  @override
  String get homeEmptyTitle => 'Your day starts here';

  @override
  String get homeEmptyBody =>
      'Activity rings, today\'s workout and your streak will appear here once you start moving.';

  @override
  String get trainEmptyTitle => 'No workouts yet';

  @override
  String get trainEmptyBody =>
      'Your templates, plans and workout history will live here.';

  @override
  String get activityEmptyTitle => 'No activity recorded';

  @override
  String get activityEmptyBody =>
      'Walks, runs and daily steps will show up here.';

  @override
  String get activityEmptyBodyDesktop =>
      'Walks, runs and steps recorded on your phone will appear here after they sync.';

  @override
  String get progressEmptyTitle => 'Nothing to chart yet';

  @override
  String get progressEmptyBody =>
      'Log a few workouts and your trends, records and recaps will appear here.';

  @override
  String get appearance => 'Appearance';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String get themeSystem => 'System';

  @override
  String get developer => 'Developer';

  @override
  String get componentGallery => 'Component gallery';

  @override
  String get componentGallerySubtitle =>
      'Every design-system component and animation';

  @override
  String get getStarted => 'Get started';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get skip => 'Skip';

  @override
  String get finish => 'Finish';

  @override
  String get continueLabel => 'Continue';

  @override
  String stepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get welcomeTitle => 'Train smarter.\nMove more.';

  @override
  String get welcomeBody =>
      'Workouts, steps, runs and recovery — all in one place.';

  @override
  String get goalTitle => 'What\'s your main goal?';

  @override
  String get goalBuildMuscle => 'Build muscle';

  @override
  String get goalBuildMuscleBody => 'Get bigger and stronger';

  @override
  String get goalLoseFat => 'Lose fat';

  @override
  String get goalLoseFatBody => 'Burn more, keep your strength';

  @override
  String get goalEndurance => 'Improve endurance';

  @override
  String get goalEnduranceBody => 'Go longer and recover faster';

  @override
  String get goalGeneral => 'General fitness';

  @override
  String get goalGeneralBody => 'Feel good and stay consistent';

  @override
  String get experienceTitle => 'How experienced are you?';

  @override
  String get expBeginner => 'Beginner';

  @override
  String get expBeginnerBody => 'New to training or coming back after a break';

  @override
  String get expIntermediate => 'Intermediate';

  @override
  String get expIntermediateBody => 'Training consistently for 6+ months';

  @override
  String get expAdvanced => 'Advanced';

  @override
  String get expAdvancedBody => 'Years of structured training';

  @override
  String get equipmentTitle => 'What equipment can you use?';

  @override
  String get equipmentBody =>
      'Pick everything available to you. We\'ll suggest exercises that fit.';

  @override
  String get scheduleTitle => 'How many days a week can you train?';

  @override
  String daysPerWeek(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String get bodyTitle => 'About you';

  @override
  String get bodyBody =>
      'All optional. Used for calorie estimates and heart-rate zones.';

  @override
  String get height => 'Height';

  @override
  String get weight => 'Weight';

  @override
  String get birthYear => 'Year of birth';

  @override
  String get sex => 'Sex';

  @override
  String get sexFemale => 'Female';

  @override
  String get sexMale => 'Male';

  @override
  String get sexOther => 'Other';

  @override
  String get sexPreferNot => 'Prefer not to say';

  @override
  String get units => 'Units';

  @override
  String get unitKg => 'kg';

  @override
  String get unitLb => 'lb';

  @override
  String get unitKm => 'km';

  @override
  String get unitMi => 'mi';

  @override
  String get unitCm => 'cm';

  @override
  String get unitIn => 'in';

  @override
  String invalidNumber(int min, int max) {
    return 'Enter a number between $min and $max.';
  }

  @override
  String get permissionsTitle => 'Make PULSE yours';

  @override
  String get permissionsBody =>
      'Allow only what you want. You can change these any time in Settings.';

  @override
  String get permHealthTitle => 'Health data';

  @override
  String get permHealthBodyIos =>
      'Read steps, heart rate and sleep from Apple Health so your rings and recovery score are accurate.';

  @override
  String get permHealthBodyAndroid =>
      'Read steps, heart rate and sleep from Health Connect so your rings and recovery score are accurate.';

  @override
  String get permMotionTitle => 'Motion & fitness';

  @override
  String get permMotionBody =>
      'Count your steps all day and notice when you\'re walking or running.';

  @override
  String get permLocationTitle => 'Location';

  @override
  String get permLocationBody =>
      'Map your walks, runs and rides. Only used while you\'re tracking.';

  @override
  String get permNotificationsTitle => 'Notifications';

  @override
  String get permNotificationsBody =>
      'Workout reminders, rest timer alerts and streak protection.';

  @override
  String get allow => 'Allow';

  @override
  String get allowed => 'Allowed';

  @override
  String get notAllowed => 'Not allowed';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get notAvailable => 'Not available on this device';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String greetingWithName(String greeting, String name) {
    return '$greeting, $name';
  }

  @override
  String get ringsTitle => 'Today\'s activity';

  @override
  String get ringMove => 'Move';

  @override
  String get ringExercise => 'Exercise';

  @override
  String get ringSteps => 'Steps';

  @override
  String ringsSemantics(int move, int exercise, int steps) {
    return 'Move $move percent, Exercise $exercise percent, Steps $steps percent';
  }

  @override
  String get kcalUnit => 'kcal';

  @override
  String get minUnit => 'min';

  @override
  String get stepsUnit => 'steps';

  @override
  String get statSteps => 'Steps';

  @override
  String get statDistance => 'Distance';

  @override
  String get statFloors => 'Floors';

  @override
  String get statActiveCalories => 'Active calories';

  @override
  String get plannedTitle => 'Today\'s workout';

  @override
  String plannedNext(String day) {
    return 'Next up: $day';
  }

  @override
  String get noPlanTitle => 'No program yet';

  @override
  String get noPlanBody =>
      'Pick a program and your next workout will show up here.';

  @override
  String get browsePrograms => 'Browse programs';

  @override
  String get startNow => 'Start';

  @override
  String get logNow => 'Log';

  @override
  String exercisesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exercises',
      one: '1 exercise',
    );
    return '$_temp0';
  }

  @override
  String get weeklyTitle => 'This week';

  @override
  String weeklySemantics(String summary) {
    return 'Steps over the last 7 days: $summary';
  }

  @override
  String workoutsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count workouts',
      one: '1 workout',
      zero: 'No workouts yet',
    );
    return '$_temp0';
  }

  @override
  String get streakTitle => 'Streak';

  @override
  String streakDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
      zero: 'Start a streak today',
    );
    return '$_temp0';
  }

  @override
  String get streakBody =>
      'Train or go for a walk or run every day to keep it going.';

  @override
  String get recordsTitle => 'Recent PRs';

  @override
  String get noRecords => 'Your personal records will show up here.';

  @override
  String get newBadge => 'NEW';

  @override
  String get customize => 'Customize';

  @override
  String get doneEditing => 'Done';

  @override
  String get showCard => 'Show card';

  @override
  String get hideCard => 'Hide card';

  @override
  String get muscleChest => 'Chest';

  @override
  String get muscleBack => 'Back';

  @override
  String get muscleLats => 'Lats';

  @override
  String get muscleTraps => 'Traps';

  @override
  String get muscleShoulders => 'Shoulders';

  @override
  String get muscleBiceps => 'Biceps';

  @override
  String get muscleTriceps => 'Triceps';

  @override
  String get muscleForearms => 'Forearms';

  @override
  String get muscleAbs => 'Abs';

  @override
  String get muscleObliques => 'Obliques';

  @override
  String get muscleLowerBack => 'Lower back';

  @override
  String get muscleGlutes => 'Glutes';

  @override
  String get muscleQuads => 'Quads';

  @override
  String get muscleHamstrings => 'Hamstrings';

  @override
  String get muscleAdductors => 'Adductors';

  @override
  String get muscleCalves => 'Calves';

  @override
  String get muscleFullBody => 'Full body';

  @override
  String get equipBarbell => 'Barbell';

  @override
  String get equipDumbbell => 'Dumbbell';

  @override
  String get equipKettlebell => 'Kettlebell';

  @override
  String get equipMachine => 'Machine';

  @override
  String get equipCable => 'Cable';

  @override
  String get equipSmithMachine => 'Smith machine';

  @override
  String get equipEzBar => 'EZ bar';

  @override
  String get equipTrapBar => 'Trap bar';

  @override
  String get equipBand => 'Bands';

  @override
  String get equipBodyweight => 'Bodyweight';

  @override
  String get equipPullUpBar => 'Pull-up bar';

  @override
  String get equipMedicineBall => 'Medicine ball';

  @override
  String get equipCardioMachine => 'Cardio machine';

  @override
  String get setWarmup => 'Warm-up';

  @override
  String get setWorking => 'Working';

  @override
  String get setDrop => 'Drop set';

  @override
  String get setFailure => 'Failure';

  @override
  String get setWarmupShort => 'W';

  @override
  String get setDropShort => 'D';

  @override
  String get setFailureShort => 'F';

  @override
  String get trainStartEmpty => 'Start empty workout';

  @override
  String get trainLogPast => 'Log a past workout';

  @override
  String get activeProgram => 'Active program';

  @override
  String get templates => 'Templates';

  @override
  String get history => 'History';

  @override
  String get exerciseLibrary => 'Exercise library';

  @override
  String get noTemplates =>
      'Finish a workout and save it as a template to reuse it here.';

  @override
  String get searchExercises => 'Search exercises';

  @override
  String get favorites => 'Favorites';

  @override
  String get allFilter => 'All';

  @override
  String get noExercisesFound => 'No exercises match';

  @override
  String get noExercisesFoundBody =>
      'Try a different search or clear the filters.';

  @override
  String get clearFilters => 'Clear filters';

  @override
  String get customExercise => 'Custom exercise';

  @override
  String get createExercise => 'Create exercise';

  @override
  String get exerciseName => 'Name';

  @override
  String get primaryMuscle => 'Primary muscle';

  @override
  String get equipment => 'Equipment';

  @override
  String get difficulty => 'Difficulty';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get howTo => 'How to do it';

  @override
  String get commonMistakes => 'Common mistakes';

  @override
  String get musclesWorked => 'Muscles worked';

  @override
  String get yourHistory => 'Your history';

  @override
  String get noHistoryForExercise =>
      'Do this exercise in a workout to see your progress here.';

  @override
  String get addToFavorites => 'Add to favorites';

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get addExercises => 'Add exercises';

  @override
  String get estimatedOneRm => 'Est. 1RM';

  @override
  String get bestSet => 'Best set';

  @override
  String get personalRecords => 'Personal records';

  @override
  String get nameRequired => 'Give it a name.';

  @override
  String get workoutDefaultName => 'Workout';

  @override
  String get finishWorkout => 'Finish';

  @override
  String get discardWorkout => 'Discard workout';

  @override
  String get discardConfirmTitle => 'Discard this workout?';

  @override
  String get discardConfirmBody =>
      'All sets from this session will be deleted.';

  @override
  String get addSet => 'Add set';

  @override
  String get addExercise => 'Add exercise';

  @override
  String get removeExercise => 'Remove exercise';

  @override
  String get supersetWithNext => 'Superset with next';

  @override
  String get unlinkSuperset => 'Remove from superset';

  @override
  String get superset => 'Superset';

  @override
  String get notes => 'Notes';

  @override
  String get sessionNotes => 'Session notes';

  @override
  String get exerciseNotes => 'Notes for this exercise';

  @override
  String get rest => 'Rest';

  @override
  String get skipRest => 'Skip';

  @override
  String get addRest15 => '+15s';

  @override
  String get go => 'GO';

  @override
  String get reps => 'Reps';

  @override
  String get rpe => 'RPE';

  @override
  String get setType => 'Set type';

  @override
  String get completeSet => 'Complete set';

  @override
  String get plateCalculator => 'Plate calculator';

  @override
  String get plateTarget => 'Target weight';

  @override
  String get plateBar => 'Bar';

  @override
  String get platePerSide => 'Per side';

  @override
  String get oneRepMax => '1RM calculator';

  @override
  String get epley => 'Epley';

  @override
  String get brzycki => 'Brzycki';

  @override
  String get keepAwake => 'Keep screen on';

  @override
  String get emptyWorkoutTitle => 'Add your first exercise';

  @override
  String get emptyWorkoutBody => 'Tap “Add exercise” to pick from the library.';

  @override
  String get startedAt => 'Started';

  @override
  String get duration => 'Duration';

  @override
  String get date => 'Date';

  @override
  String get logWorkoutTitle => 'Log workout';

  @override
  String get summaryTitle => 'Workout complete';

  @override
  String get totalVolume => 'Total volume';

  @override
  String get setsDone => 'Sets';

  @override
  String get calories => 'Calories';

  @override
  String get newRecords => 'New personal records';

  @override
  String get saveAsTemplate => 'Save as template';

  @override
  String get templateSaved => 'Template saved';

  @override
  String get done => 'Done';

  @override
  String get prMaxWeight => 'Heaviest weight';

  @override
  String get prEstimatedOneRm => 'Best est. 1RM';

  @override
  String get prMaxReps => 'Most reps';

  @override
  String get prMaxVolume => 'Most volume';

  @override
  String get prUnlockedTitle => 'New personal record!';

  @override
  String get share => 'Share';

  @override
  String get close => 'Close';

  @override
  String get programs => 'Programs';

  @override
  String get setActive => 'Make active';

  @override
  String get activeBadge => 'Active';

  @override
  String get weight1rmHint => 'Weight lifted';

  @override
  String get resumeWorkout => 'Resume workout';

  @override
  String get moreActions => 'More actions';

  @override
  String get workoutInProgress => 'Workout in progress';

  @override
  String get noWorkoutsYetBody => 'Your finished workouts will appear here.';

  @override
  String restSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String lastTime(String value) {
    return 'Last time: $value';
  }

  @override
  String setNumber(int number) {
    return 'Set $number';
  }

  @override
  String addCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Add $count',
      zero: 'Add',
    );
    return '$_temp0';
  }

  @override
  String weeksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks',
      one: '1 week',
    );
    return '$_temp0';
  }

  @override
  String plateRemainder(String weight) {
    return 'Closest you can load: $weight';
  }

  @override
  String restSemantics(int seconds) {
    return 'Rest, $seconds seconds remaining';
  }

  @override
  String setsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sets',
      one: '1 set',
    );
    return '$_temp0';
  }

  @override
  String shareWorkoutText(String name, String volume, int minutes) {
    return 'I just finished $name on PULSE: $volume lifted in $minutes minutes.';
  }

  @override
  String get cardioWalk => 'Walk';

  @override
  String get cardioRun => 'Run';

  @override
  String get cardioHike => 'Hike';

  @override
  String get cardioCycle => 'Ride';

  @override
  String get cardioTreadmill => 'Treadmill';

  @override
  String get cardioOther => 'Other';

  @override
  String get trackActivity => 'Start tracking';

  @override
  String get indoor => 'Indoor';

  @override
  String get outdoor => 'Outdoor';

  @override
  String get logCardio => 'Log activity';

  @override
  String get todaySteps => 'Today\'s steps';

  @override
  String get pace => 'Pace';

  @override
  String get elevation => 'Elevation';

  @override
  String get time => 'Time';

  @override
  String get distance => 'Distance';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Resume';

  @override
  String get autoPaused => 'Auto-paused';

  @override
  String get paused => 'Paused';

  @override
  String get replayRoute => 'Replay route';

  @override
  String get splits => 'Splits';

  @override
  String get noRoute => 'No route recorded for this activity.';

  @override
  String get activityHistory => 'History';

  @override
  String get locationNeededTitle => 'Location is off';

  @override
  String get locationNeededBody =>
      'Allow location access to map your route. Indoor mode works without it.';

  @override
  String get trackingNotificationTitle => 'PULSE is tracking your activity';

  @override
  String get trackingNotificationBody =>
      'Your route and pace are being recorded.';

  @override
  String get audioCues => 'Audio cues';

  @override
  String get discardActivity => 'Discard activity';

  @override
  String get stepsUnavailable =>
      'Step counting isn\'t available. Allow Motion & fitness access in Settings.';

  @override
  String get caloriesOptional => 'Calories (optional)';

  @override
  String get minutesLabel => 'Minutes';

  @override
  String get activitySaved => 'Activity saved';

  @override
  String get invalidDuration => 'Enter a duration in minutes.';

  @override
  String ttsSplit(int distance, String unit, int minutes, int seconds) {
    return '$distance $unit. Pace $minutes minutes $seconds seconds.';
  }

  @override
  String splitLabel(String unit, int number) {
    return '$unit $number';
  }

  @override
  String get bodyAndWeight => 'Body & weight';

  @override
  String get water => 'Water';

  @override
  String get nutrition => 'Nutrition';

  @override
  String get progressPhotos => 'Progress photos';

  @override
  String get health => 'Health';

  @override
  String get syncHealth => 'Sync health data';

  @override
  String get restingHr => 'Resting HR';

  @override
  String get hrv => 'HRV';

  @override
  String get sleep => 'Sleep';

  @override
  String get latestHeartRate => 'Latest heart rate';

  @override
  String get healthUnavailable =>
      'Connect Apple Health or Health Connect in onboarding or Settings to see heart rate and sleep.';

  @override
  String get healthDesktop =>
      'Heart rate and sleep recorded on your phone appear here after sync.';

  @override
  String get measureWeight => 'Weight';

  @override
  String get measureBodyFat => 'Body fat';

  @override
  String get measureWaist => 'Waist';

  @override
  String get measureChest => 'Chest';

  @override
  String get measureHips => 'Hips';

  @override
  String get measureArm => 'Arm';

  @override
  String get measureThigh => 'Thigh';

  @override
  String get measureNeck => 'Neck';

  @override
  String get addEntry => 'Add entry';

  @override
  String get value => 'Value';

  @override
  String get trend => 'Trend';

  @override
  String get noEntries => 'No entries yet';

  @override
  String get noEntriesBody => 'Add your first measurement to start a trend.';

  @override
  String get addWater => 'Add water';

  @override
  String get waterGoalReached => 'Daily water goal reached!';

  @override
  String get custom => 'Custom';

  @override
  String get mealBreakfast => 'Breakfast';

  @override
  String get mealLunch => 'Lunch';

  @override
  String get mealDinner => 'Dinner';

  @override
  String get mealSnack => 'Snack';

  @override
  String get addFood => 'Add food';

  @override
  String get foodName => 'Food';

  @override
  String get protein => 'Protein';

  @override
  String get carbs => 'Carbs';

  @override
  String get fat => 'Fat';

  @override
  String get gramsUnit => 'g';

  @override
  String get noMeals => 'Nothing logged today';

  @override
  String get noMealsBody =>
      'Log meals to track calories and macros against your targets.';

  @override
  String get addPhoto => 'Add photo';

  @override
  String get takePhoto => 'Take photo';

  @override
  String get chooseFromLibrary => 'Choose from library';

  @override
  String get compare => 'Compare';

  @override
  String get poseFront => 'Front';

  @override
  String get poseSide => 'Side';

  @override
  String get poseBack => 'Back';

  @override
  String get selectTwoPhotos => 'Select two photos to compare.';

  @override
  String get photosPrivate => 'Photos are encrypted and stay on this device.';

  @override
  String get noPhotos => 'No progress photos yet';

  @override
  String get noPhotosBody =>
      'Take a photo every few weeks to see how far you\'ve come.';

  @override
  String get vaultUnavailable =>
      'Secure storage isn\'t available on this device, so photos can\'t be saved privately.';

  @override
  String get undo => 'Undo';

  @override
  String get deleted => 'Deleted';

  @override
  String ofTarget(String value, String target) {
    return '$value / $target';
  }

  @override
  String sleepHours(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String waterProgress(int amount, int goal) {
    return '$amount of $goal ml';
  }

  @override
  String get analytics => 'Analytics';

  @override
  String get recordsBoard => 'Personal records';

  @override
  String get achievementsTitle => 'Achievements';

  @override
  String get monthlyRecap => 'Monthly recap';

  @override
  String get rangeWeek => 'Week';

  @override
  String get rangeMonth => 'Month';

  @override
  String get range3Months => '3 months';

  @override
  String get rangeYear => 'Year';

  @override
  String get chartVolume => 'Training volume';

  @override
  String get chartFrequency => 'Workouts';

  @override
  String get chartSteps => 'Steps';

  @override
  String get chartDistance => 'Distance';

  @override
  String get chartWeight => 'Weight';

  @override
  String get chartStrength => 'Strength (est. 1RM)';

  @override
  String get noData => 'Not enough data yet';

  @override
  String get noDataBody => 'Keep training — your charts fill in as you log.';

  @override
  String get chooseExercise => 'Exercise';

  @override
  String get level => 'Level';

  @override
  String get xp => 'XP';

  @override
  String get locked => 'Locked';

  @override
  String get unlocked => 'Unlocked';

  @override
  String get shareCard => 'Share card';

  @override
  String get achievementUnlocked => 'Achievement unlocked!';

  @override
  String get achFirstWorkout => 'First workout';

  @override
  String get achFirstWorkoutBody => 'Finish your first workout.';

  @override
  String get achWorkouts10 => 'Getting serious';

  @override
  String get achWorkouts10Body => 'Finish 10 workouts.';

  @override
  String get achWorkouts50 => 'Dedicated';

  @override
  String get achWorkouts50Body => 'Finish 50 workouts.';

  @override
  String get achWorkouts100 => 'Centurion';

  @override
  String get achWorkouts100Body => 'Finish 100 workouts.';

  @override
  String get achStreak7 => 'On fire';

  @override
  String get achStreak7Body => 'Keep a 7-day streak.';

  @override
  String get achStreak30 => 'Unstoppable';

  @override
  String get achStreak30Body => 'Keep a 30-day streak.';

  @override
  String get achVolume10k => 'Heavy lifter';

  @override
  String get achVolume10kBody => 'Lift 10,000 kg in one workout.';

  @override
  String get achFirstPr => 'Personal best';

  @override
  String get achFirstPrBody => 'Set your first personal record.';

  @override
  String get achPrs25 => 'Record breaker';

  @override
  String get achPrs25Body => 'Set 25 personal records.';

  @override
  String get achFirstCardio => 'On the move';

  @override
  String get achFirstCardioBody => 'Log your first walk, run or ride.';

  @override
  String get achDistance50 => 'Road warrior';

  @override
  String get achDistance50Body => 'Cover 50 km of cardio in total.';

  @override
  String get achSteps10k => '10K day';

  @override
  String get achSteps10kBody => 'Walk 10,000 steps in a day.';

  @override
  String get recapWorkouts => 'Workouts';

  @override
  String get recapVolume => 'Lifted';

  @override
  String get recapTime => 'Time training';

  @override
  String get recapDistance => 'Distance covered';

  @override
  String get recapSteps => 'Steps';

  @override
  String get recapTopExercise => 'Favourite exercise';

  @override
  String get recapRecords => 'New records';

  @override
  String get recapEmpty =>
      'No activity this month yet. Your recap builds as you train.';

  @override
  String levelLabel(int level) {
    return 'Level $level';
  }

  @override
  String xpToNext(int xp, int level) {
    return '$xp XP to level $level';
  }

  @override
  String recapTitle(String month) {
    return 'Your $month';
  }

  @override
  String get recoveryTitle => 'Recovery';

  @override
  String recoveryScore(int score) {
    return 'Recovery score $score';
  }

  @override
  String get readyToTrain => 'Ready to train';

  @override
  String get trainLight => 'Train light today';

  @override
  String get restDay => 'Take a rest day';

  @override
  String get recoveryUnknown => 'Not enough data yet';

  @override
  String get tipSleepMore =>
      'You slept under 7 hours. Keep today\'s session shorter or easier.';

  @override
  String get tipHrvLow =>
      'Your HRV is below your usual level. Your body may still be recovering.';

  @override
  String get tipRestingHrHigh =>
      'Your resting heart rate is up. Watch for stress, illness or too little sleep.';

  @override
  String get tipLoadSpike =>
      'You trained much more this week than usual. Ease off to avoid injury.';

  @override
  String get tipDeload =>
      'Five hard weeks in a row. Plan a lighter deload week to keep progressing.';

  @override
  String get tipConnectHealth =>
      'Connect Apple Health or Health Connect to get a recovery score from your sleep and heart rate.';

  @override
  String get reminderWorkoutTitle => 'Time to train';

  @override
  String reminderWorkoutBody(String name) {
    return '$name is on today\'s plan.';
  }

  @override
  String get reminderStreakTitle => 'Keep your streak alive';

  @override
  String reminderStreakBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days so far',
      one: '1 day so far',
    );
    return '$_temp0. A short walk still counts.';
  }

  @override
  String get reminderInactiveTitle => 'Ready when you are';

  @override
  String get reminderInactiveBody =>
      'It\'s been a few days. Even a 20-minute session keeps the habit going.';

  @override
  String get goalReachedTitle => 'Step goal reached!';

  @override
  String goalReachedBody(int goal) {
    return '$goal steps today. Nice work.';
  }

  @override
  String setsProgress(int done, int total) {
    return '$done/$total sets';
  }

  @override
  String get widgetNoPlan => 'No plan yet';

  @override
  String get widgetToday => 'Today';

  @override
  String get widgetNext => 'Next';

  @override
  String get waterLogTitle => 'Log water';

  @override
  String get startWalk => 'Start walk';

  @override
  String get remindersTitle => 'Reminders';

  @override
  String get remindersBody =>
      'Workout reminders, streak protection, step goal reached and a nudge after a few quiet days.';

  @override
  String get reminderTime => 'Reminder time';

  @override
  String get remindersDenied =>
      'Notifications are turned off for PULSE. Turn them on in system settings.';
}
