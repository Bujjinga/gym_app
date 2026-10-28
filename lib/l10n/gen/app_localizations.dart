import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'PULSE'**
  String get appTitle;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabTrain.
  ///
  /// In en, this message translates to:
  /// **'Train'**
  String get tabTrain;

  /// No description provided for @tabActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get tabActivity;

  /// No description provided for @tabProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get tabProgress;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @startWorkout.
  ///
  /// In en, this message translates to:
  /// **'Start workout'**
  String get startWorkout;

  /// No description provided for @logWorkout.
  ///
  /// In en, this message translates to:
  /// **'Log workout'**
  String get logWorkout;

  /// No description provided for @collapseSidebar.
  ///
  /// In en, this message translates to:
  /// **'Collapse sidebar'**
  String get collapseSidebar;

  /// No description provided for @expandSidebar.
  ///
  /// In en, this message translates to:
  /// **'Expand sidebar'**
  String get expandSidebar;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your day starts here'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Activity rings, today\'s workout and your streak will appear here once you start moving.'**
  String get homeEmptyBody;

  /// No description provided for @trainEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No workouts yet'**
  String get trainEmptyTitle;

  /// No description provided for @trainEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Your templates, plans and workout history will live here.'**
  String get trainEmptyBody;

  /// No description provided for @activityEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No activity recorded'**
  String get activityEmptyTitle;

  /// No description provided for @activityEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Walks, runs and daily steps will show up here.'**
  String get activityEmptyBody;

  /// No description provided for @activityEmptyBodyDesktop.
  ///
  /// In en, this message translates to:
  /// **'Walks, runs and steps recorded on your phone will appear here after they sync.'**
  String get activityEmptyBodyDesktop;

  /// No description provided for @progressEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing to chart yet'**
  String get progressEmptyTitle;

  /// No description provided for @progressEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Log a few workouts and your trends, records and recaps will appear here.'**
  String get progressEmptyBody;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @componentGallery.
  ///
  /// In en, this message translates to:
  /// **'Component gallery'**
  String get componentGallery;

  /// No description provided for @componentGallerySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Every design-system component and animation'**
  String get componentGallerySubtitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @stepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepOf(int current, int total);

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Train smarter.\nMove more.'**
  String get welcomeTitle;

  /// No description provided for @welcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Workouts, steps, runs and recovery — all in one place.'**
  String get welcomeBody;

  /// No description provided for @goalTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s your main goal?'**
  String get goalTitle;

  /// No description provided for @goalBuildMuscle.
  ///
  /// In en, this message translates to:
  /// **'Build muscle'**
  String get goalBuildMuscle;

  /// No description provided for @goalBuildMuscleBody.
  ///
  /// In en, this message translates to:
  /// **'Get bigger and stronger'**
  String get goalBuildMuscleBody;

  /// No description provided for @goalLoseFat.
  ///
  /// In en, this message translates to:
  /// **'Lose fat'**
  String get goalLoseFat;

  /// No description provided for @goalLoseFatBody.
  ///
  /// In en, this message translates to:
  /// **'Burn more, keep your strength'**
  String get goalLoseFatBody;

  /// No description provided for @goalEndurance.
  ///
  /// In en, this message translates to:
  /// **'Improve endurance'**
  String get goalEndurance;

  /// No description provided for @goalEnduranceBody.
  ///
  /// In en, this message translates to:
  /// **'Go longer and recover faster'**
  String get goalEnduranceBody;

  /// No description provided for @goalGeneral.
  ///
  /// In en, this message translates to:
  /// **'General fitness'**
  String get goalGeneral;

  /// No description provided for @goalGeneralBody.
  ///
  /// In en, this message translates to:
  /// **'Feel good and stay consistent'**
  String get goalGeneralBody;

  /// No description provided for @experienceTitle.
  ///
  /// In en, this message translates to:
  /// **'How experienced are you?'**
  String get experienceTitle;

  /// No description provided for @expBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get expBeginner;

  /// No description provided for @expBeginnerBody.
  ///
  /// In en, this message translates to:
  /// **'New to training or coming back after a break'**
  String get expBeginnerBody;

  /// No description provided for @expIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get expIntermediate;

  /// No description provided for @expIntermediateBody.
  ///
  /// In en, this message translates to:
  /// **'Training consistently for 6+ months'**
  String get expIntermediateBody;

  /// No description provided for @expAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get expAdvanced;

  /// No description provided for @expAdvancedBody.
  ///
  /// In en, this message translates to:
  /// **'Years of structured training'**
  String get expAdvancedBody;

  /// No description provided for @equipmentTitle.
  ///
  /// In en, this message translates to:
  /// **'What equipment can you use?'**
  String get equipmentTitle;

  /// No description provided for @equipmentBody.
  ///
  /// In en, this message translates to:
  /// **'Pick everything available to you. We\'ll suggest exercises that fit.'**
  String get equipmentBody;

  /// No description provided for @scheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'How many days a week can you train?'**
  String get scheduleTitle;

  /// No description provided for @daysPerWeek.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String daysPerWeek(int count);

  /// No description provided for @bodyTitle.
  ///
  /// In en, this message translates to:
  /// **'About you'**
  String get bodyTitle;

  /// No description provided for @bodyBody.
  ///
  /// In en, this message translates to:
  /// **'All optional. Used for calorie estimates and heart-rate zones.'**
  String get bodyBody;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @birthYear.
  ///
  /// In en, this message translates to:
  /// **'Year of birth'**
  String get birthYear;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @sexFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get sexFemale;

  /// No description provided for @sexMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get sexMale;

  /// No description provided for @sexOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get sexOther;

  /// No description provided for @sexPreferNot.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get sexPreferNot;

  /// No description provided for @units.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get units;

  /// No description provided for @unitKg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get unitKg;

  /// No description provided for @unitLb.
  ///
  /// In en, this message translates to:
  /// **'lb'**
  String get unitLb;

  /// No description provided for @unitKm.
  ///
  /// In en, this message translates to:
  /// **'km'**
  String get unitKm;

  /// No description provided for @unitMi.
  ///
  /// In en, this message translates to:
  /// **'mi'**
  String get unitMi;

  /// No description provided for @unitCm.
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get unitCm;

  /// No description provided for @unitIn.
  ///
  /// In en, this message translates to:
  /// **'in'**
  String get unitIn;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a number between {min} and {max}.'**
  String invalidNumber(int min, int max);

  /// No description provided for @permissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Make PULSE yours'**
  String get permissionsTitle;

  /// No description provided for @permissionsBody.
  ///
  /// In en, this message translates to:
  /// **'Allow only what you want. You can change these any time in Settings.'**
  String get permissionsBody;

  /// No description provided for @permHealthTitle.
  ///
  /// In en, this message translates to:
  /// **'Health data'**
  String get permHealthTitle;

  /// No description provided for @permHealthBodyIos.
  ///
  /// In en, this message translates to:
  /// **'Read steps, heart rate and sleep from Apple Health so your rings and recovery score are accurate.'**
  String get permHealthBodyIos;

  /// No description provided for @permHealthBodyAndroid.
  ///
  /// In en, this message translates to:
  /// **'Read steps, heart rate and sleep from Health Connect so your rings and recovery score are accurate.'**
  String get permHealthBodyAndroid;

  /// No description provided for @permMotionTitle.
  ///
  /// In en, this message translates to:
  /// **'Motion & fitness'**
  String get permMotionTitle;

  /// No description provided for @permMotionBody.
  ///
  /// In en, this message translates to:
  /// **'Count your steps all day and notice when you\'re walking or running.'**
  String get permMotionBody;

  /// No description provided for @permLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get permLocationTitle;

  /// No description provided for @permLocationBody.
  ///
  /// In en, this message translates to:
  /// **'Map your walks, runs and rides. Only used while you\'re tracking.'**
  String get permLocationBody;

  /// No description provided for @permNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get permNotificationsTitle;

  /// No description provided for @permNotificationsBody.
  ///
  /// In en, this message translates to:
  /// **'Workout reminders, rest timer alerts and streak protection.'**
  String get permNotificationsBody;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @allowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get allowed;

  /// No description provided for @notAllowed.
  ///
  /// In en, this message translates to:
  /// **'Not allowed'**
  String get notAllowed;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available on this device'**
  String get notAvailable;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @greetingWithName.
  ///
  /// In en, this message translates to:
  /// **'{greeting}, {name}'**
  String greetingWithName(String greeting, String name);

  /// No description provided for @ringsTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s activity'**
  String get ringsTitle;

  /// No description provided for @ringMove.
  ///
  /// In en, this message translates to:
  /// **'Move'**
  String get ringMove;

  /// No description provided for @ringExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get ringExercise;

  /// No description provided for @ringSteps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get ringSteps;

  /// No description provided for @ringsSemantics.
  ///
  /// In en, this message translates to:
  /// **'Move {move} percent, Exercise {exercise} percent, Steps {steps} percent'**
  String ringsSemantics(int move, int exercise, int steps);

  /// No description provided for @kcalUnit.
  ///
  /// In en, this message translates to:
  /// **'kcal'**
  String get kcalUnit;

  /// No description provided for @minUnit.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minUnit;

  /// No description provided for @stepsUnit.
  ///
  /// In en, this message translates to:
  /// **'steps'**
  String get stepsUnit;

  /// No description provided for @statSteps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get statSteps;

  /// No description provided for @statDistance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get statDistance;

  /// No description provided for @statFloors.
  ///
  /// In en, this message translates to:
  /// **'Floors'**
  String get statFloors;

  /// No description provided for @statActiveCalories.
  ///
  /// In en, this message translates to:
  /// **'Active calories'**
  String get statActiveCalories;

  /// No description provided for @plannedTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s workout'**
  String get plannedTitle;

  /// No description provided for @plannedNext.
  ///
  /// In en, this message translates to:
  /// **'Next up: {day}'**
  String plannedNext(String day);

  /// No description provided for @noPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'No program yet'**
  String get noPlanTitle;

  /// No description provided for @noPlanBody.
  ///
  /// In en, this message translates to:
  /// **'Pick a program and your next workout will show up here.'**
  String get noPlanBody;

  /// No description provided for @browsePrograms.
  ///
  /// In en, this message translates to:
  /// **'Browse programs'**
  String get browsePrograms;

  /// No description provided for @startNow.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startNow;

  /// No description provided for @logNow.
  ///
  /// In en, this message translates to:
  /// **'Log'**
  String get logNow;

  /// No description provided for @exercisesCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 exercise} other{{count} exercises}}'**
  String exercisesCount(int count);

  /// No description provided for @weeklyTitle.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get weeklyTitle;

  /// No description provided for @weeklySemantics.
  ///
  /// In en, this message translates to:
  /// **'Steps over the last 7 days: {summary}'**
  String weeklySemantics(String summary);

  /// No description provided for @workoutsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No workouts yet} =1{1 workout} other{{count} workouts}}'**
  String workoutsCount(int count);

  /// No description provided for @streakTitle.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get streakTitle;

  /// No description provided for @streakDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Start a streak today} =1{1 day} other{{count} days}}'**
  String streakDays(int count);

  /// No description provided for @streakBody.
  ///
  /// In en, this message translates to:
  /// **'Train or go for a walk or run every day to keep it going.'**
  String get streakBody;

  /// No description provided for @recordsTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent PRs'**
  String get recordsTitle;

  /// No description provided for @noRecords.
  ///
  /// In en, this message translates to:
  /// **'Your personal records will show up here.'**
  String get noRecords;

  /// No description provided for @newBadge.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get newBadge;

  /// No description provided for @customize.
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get customize;

  /// No description provided for @doneEditing.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneEditing;

  /// No description provided for @showCard.
  ///
  /// In en, this message translates to:
  /// **'Show card'**
  String get showCard;

  /// No description provided for @hideCard.
  ///
  /// In en, this message translates to:
  /// **'Hide card'**
  String get hideCard;

  /// No description provided for @muscleChest.
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get muscleChest;

  /// No description provided for @muscleBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get muscleBack;

  /// No description provided for @muscleLats.
  ///
  /// In en, this message translates to:
  /// **'Lats'**
  String get muscleLats;

  /// No description provided for @muscleTraps.
  ///
  /// In en, this message translates to:
  /// **'Traps'**
  String get muscleTraps;

  /// No description provided for @muscleShoulders.
  ///
  /// In en, this message translates to:
  /// **'Shoulders'**
  String get muscleShoulders;

  /// No description provided for @muscleBiceps.
  ///
  /// In en, this message translates to:
  /// **'Biceps'**
  String get muscleBiceps;

  /// No description provided for @muscleTriceps.
  ///
  /// In en, this message translates to:
  /// **'Triceps'**
  String get muscleTriceps;

  /// No description provided for @muscleForearms.
  ///
  /// In en, this message translates to:
  /// **'Forearms'**
  String get muscleForearms;

  /// No description provided for @muscleAbs.
  ///
  /// In en, this message translates to:
  /// **'Abs'**
  String get muscleAbs;

  /// No description provided for @muscleObliques.
  ///
  /// In en, this message translates to:
  /// **'Obliques'**
  String get muscleObliques;

  /// No description provided for @muscleLowerBack.
  ///
  /// In en, this message translates to:
  /// **'Lower back'**
  String get muscleLowerBack;

  /// No description provided for @muscleGlutes.
  ///
  /// In en, this message translates to:
  /// **'Glutes'**
  String get muscleGlutes;

  /// No description provided for @muscleQuads.
  ///
  /// In en, this message translates to:
  /// **'Quads'**
  String get muscleQuads;

  /// No description provided for @muscleHamstrings.
  ///
  /// In en, this message translates to:
  /// **'Hamstrings'**
  String get muscleHamstrings;

  /// No description provided for @muscleAdductors.
  ///
  /// In en, this message translates to:
  /// **'Adductors'**
  String get muscleAdductors;

  /// No description provided for @muscleCalves.
  ///
  /// In en, this message translates to:
  /// **'Calves'**
  String get muscleCalves;

  /// No description provided for @muscleFullBody.
  ///
  /// In en, this message translates to:
  /// **'Full body'**
  String get muscleFullBody;

  /// No description provided for @equipBarbell.
  ///
  /// In en, this message translates to:
  /// **'Barbell'**
  String get equipBarbell;

  /// No description provided for @equipDumbbell.
  ///
  /// In en, this message translates to:
  /// **'Dumbbell'**
  String get equipDumbbell;

  /// No description provided for @equipKettlebell.
  ///
  /// In en, this message translates to:
  /// **'Kettlebell'**
  String get equipKettlebell;

  /// No description provided for @equipMachine.
  ///
  /// In en, this message translates to:
  /// **'Machine'**
  String get equipMachine;

  /// No description provided for @equipCable.
  ///
  /// In en, this message translates to:
  /// **'Cable'**
  String get equipCable;

  /// No description provided for @equipSmithMachine.
  ///
  /// In en, this message translates to:
  /// **'Smith machine'**
  String get equipSmithMachine;

  /// No description provided for @equipEzBar.
  ///
  /// In en, this message translates to:
  /// **'EZ bar'**
  String get equipEzBar;

  /// No description provided for @equipTrapBar.
  ///
  /// In en, this message translates to:
  /// **'Trap bar'**
  String get equipTrapBar;

  /// No description provided for @equipBand.
  ///
  /// In en, this message translates to:
  /// **'Bands'**
  String get equipBand;

  /// No description provided for @equipBodyweight.
  ///
  /// In en, this message translates to:
  /// **'Bodyweight'**
  String get equipBodyweight;

  /// No description provided for @equipPullUpBar.
  ///
  /// In en, this message translates to:
  /// **'Pull-up bar'**
  String get equipPullUpBar;

  /// No description provided for @equipMedicineBall.
  ///
  /// In en, this message translates to:
  /// **'Medicine ball'**
  String get equipMedicineBall;

  /// No description provided for @equipCardioMachine.
  ///
  /// In en, this message translates to:
  /// **'Cardio machine'**
  String get equipCardioMachine;

  /// No description provided for @setWarmup.
  ///
  /// In en, this message translates to:
  /// **'Warm-up'**
  String get setWarmup;

  /// No description provided for @setWorking.
  ///
  /// In en, this message translates to:
  /// **'Working'**
  String get setWorking;

  /// No description provided for @setDrop.
  ///
  /// In en, this message translates to:
  /// **'Drop set'**
  String get setDrop;

  /// No description provided for @setFailure.
  ///
  /// In en, this message translates to:
  /// **'Failure'**
  String get setFailure;

  /// No description provided for @setWarmupShort.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get setWarmupShort;

  /// No description provided for @setDropShort.
  ///
  /// In en, this message translates to:
  /// **'D'**
  String get setDropShort;

  /// No description provided for @setFailureShort.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get setFailureShort;

  /// No description provided for @trainStartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Start empty workout'**
  String get trainStartEmpty;

  /// No description provided for @trainLogPast.
  ///
  /// In en, this message translates to:
  /// **'Log a past workout'**
  String get trainLogPast;

  /// No description provided for @activeProgram.
  ///
  /// In en, this message translates to:
  /// **'Active program'**
  String get activeProgram;

  /// No description provided for @templates.
  ///
  /// In en, this message translates to:
  /// **'Templates'**
  String get templates;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @exerciseLibrary.
  ///
  /// In en, this message translates to:
  /// **'Exercise library'**
  String get exerciseLibrary;

  /// No description provided for @noTemplates.
  ///
  /// In en, this message translates to:
  /// **'Finish a workout and save it as a template to reuse it here.'**
  String get noTemplates;

  /// No description provided for @searchExercises.
  ///
  /// In en, this message translates to:
  /// **'Search exercises'**
  String get searchExercises;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @allFilter.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilter;

  /// No description provided for @noExercisesFound.
  ///
  /// In en, this message translates to:
  /// **'No exercises match'**
  String get noExercisesFound;

  /// No description provided for @noExercisesFoundBody.
  ///
  /// In en, this message translates to:
  /// **'Try a different search or clear the filters.'**
  String get noExercisesFoundBody;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get clearFilters;

  /// No description provided for @customExercise.
  ///
  /// In en, this message translates to:
  /// **'Custom exercise'**
  String get customExercise;

  /// No description provided for @createExercise.
  ///
  /// In en, this message translates to:
  /// **'Create exercise'**
  String get createExercise;

  /// No description provided for @exerciseName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get exerciseName;

  /// No description provided for @primaryMuscle.
  ///
  /// In en, this message translates to:
  /// **'Primary muscle'**
  String get primaryMuscle;

  /// No description provided for @equipment.
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get equipment;

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @howTo.
  ///
  /// In en, this message translates to:
  /// **'How to do it'**
  String get howTo;

  /// No description provided for @commonMistakes.
  ///
  /// In en, this message translates to:
  /// **'Common mistakes'**
  String get commonMistakes;

  /// No description provided for @musclesWorked.
  ///
  /// In en, this message translates to:
  /// **'Muscles worked'**
  String get musclesWorked;

  /// No description provided for @yourHistory.
  ///
  /// In en, this message translates to:
  /// **'Your history'**
  String get yourHistory;

  /// No description provided for @noHistoryForExercise.
  ///
  /// In en, this message translates to:
  /// **'Do this exercise in a workout to see your progress here.'**
  String get noHistoryForExercise;

  /// No description provided for @addToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get addToFavorites;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// No description provided for @addExercises.
  ///
  /// In en, this message translates to:
  /// **'Add exercises'**
  String get addExercises;

  /// No description provided for @estimatedOneRm.
  ///
  /// In en, this message translates to:
  /// **'Est. 1RM'**
  String get estimatedOneRm;

  /// No description provided for @bestSet.
  ///
  /// In en, this message translates to:
  /// **'Best set'**
  String get bestSet;

  /// No description provided for @personalRecords.
  ///
  /// In en, this message translates to:
  /// **'Personal records'**
  String get personalRecords;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Give it a name.'**
  String get nameRequired;

  /// No description provided for @workoutDefaultName.
  ///
  /// In en, this message translates to:
  /// **'Workout'**
  String get workoutDefaultName;

  /// No description provided for @finishWorkout.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finishWorkout;

  /// No description provided for @discardWorkout.
  ///
  /// In en, this message translates to:
  /// **'Discard workout'**
  String get discardWorkout;

  /// No description provided for @discardConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard this workout?'**
  String get discardConfirmTitle;

  /// No description provided for @discardConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'All sets from this session will be deleted.'**
  String get discardConfirmBody;

  /// No description provided for @addSet.
  ///
  /// In en, this message translates to:
  /// **'Add set'**
  String get addSet;

  /// No description provided for @addExercise.
  ///
  /// In en, this message translates to:
  /// **'Add exercise'**
  String get addExercise;

  /// No description provided for @removeExercise.
  ///
  /// In en, this message translates to:
  /// **'Remove exercise'**
  String get removeExercise;

  /// No description provided for @supersetWithNext.
  ///
  /// In en, this message translates to:
  /// **'Superset with next'**
  String get supersetWithNext;

  /// No description provided for @unlinkSuperset.
  ///
  /// In en, this message translates to:
  /// **'Remove from superset'**
  String get unlinkSuperset;

  /// No description provided for @superset.
  ///
  /// In en, this message translates to:
  /// **'Superset'**
  String get superset;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @sessionNotes.
  ///
  /// In en, this message translates to:
  /// **'Session notes'**
  String get sessionNotes;

  /// No description provided for @exerciseNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes for this exercise'**
  String get exerciseNotes;

  /// No description provided for @rest.
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get rest;

  /// No description provided for @skipRest.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipRest;

  /// No description provided for @addRest15.
  ///
  /// In en, this message translates to:
  /// **'+15s'**
  String get addRest15;

  /// No description provided for @go.
  ///
  /// In en, this message translates to:
  /// **'GO'**
  String get go;

  /// No description provided for @reps.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get reps;

  /// No description provided for @rpe.
  ///
  /// In en, this message translates to:
  /// **'RPE'**
  String get rpe;

  /// No description provided for @setType.
  ///
  /// In en, this message translates to:
  /// **'Set type'**
  String get setType;

  /// No description provided for @completeSet.
  ///
  /// In en, this message translates to:
  /// **'Complete set'**
  String get completeSet;

  /// No description provided for @plateCalculator.
  ///
  /// In en, this message translates to:
  /// **'Plate calculator'**
  String get plateCalculator;

  /// No description provided for @plateTarget.
  ///
  /// In en, this message translates to:
  /// **'Target weight'**
  String get plateTarget;

  /// No description provided for @plateBar.
  ///
  /// In en, this message translates to:
  /// **'Bar'**
  String get plateBar;

  /// No description provided for @platePerSide.
  ///
  /// In en, this message translates to:
  /// **'Per side'**
  String get platePerSide;

  /// No description provided for @oneRepMax.
  ///
  /// In en, this message translates to:
  /// **'1RM calculator'**
  String get oneRepMax;

  /// No description provided for @epley.
  ///
  /// In en, this message translates to:
  /// **'Epley'**
  String get epley;

  /// No description provided for @brzycki.
  ///
  /// In en, this message translates to:
  /// **'Brzycki'**
  String get brzycki;

  /// No description provided for @keepAwake.
  ///
  /// In en, this message translates to:
  /// **'Keep screen on'**
  String get keepAwake;

  /// No description provided for @emptyWorkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first exercise'**
  String get emptyWorkoutTitle;

  /// No description provided for @emptyWorkoutBody.
  ///
  /// In en, this message translates to:
  /// **'Tap “Add exercise” to pick from the library.'**
  String get emptyWorkoutBody;

  /// No description provided for @startedAt.
  ///
  /// In en, this message translates to:
  /// **'Started'**
  String get startedAt;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @logWorkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Log workout'**
  String get logWorkoutTitle;

  /// No description provided for @summaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout complete'**
  String get summaryTitle;

  /// No description provided for @totalVolume.
  ///
  /// In en, this message translates to:
  /// **'Total volume'**
  String get totalVolume;

  /// No description provided for @setsDone.
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get setsDone;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @newRecords.
  ///
  /// In en, this message translates to:
  /// **'New personal records'**
  String get newRecords;

  /// No description provided for @saveAsTemplate.
  ///
  /// In en, this message translates to:
  /// **'Save as template'**
  String get saveAsTemplate;

  /// No description provided for @templateSaved.
  ///
  /// In en, this message translates to:
  /// **'Template saved'**
  String get templateSaved;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @prMaxWeight.
  ///
  /// In en, this message translates to:
  /// **'Heaviest weight'**
  String get prMaxWeight;

  /// No description provided for @prEstimatedOneRm.
  ///
  /// In en, this message translates to:
  /// **'Best est. 1RM'**
  String get prEstimatedOneRm;

  /// No description provided for @prMaxReps.
  ///
  /// In en, this message translates to:
  /// **'Most reps'**
  String get prMaxReps;

  /// No description provided for @prMaxVolume.
  ///
  /// In en, this message translates to:
  /// **'Most volume'**
  String get prMaxVolume;

  /// No description provided for @prUnlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'New personal record!'**
  String get prUnlockedTitle;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @programs.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get programs;

  /// No description provided for @setActive.
  ///
  /// In en, this message translates to:
  /// **'Make active'**
  String get setActive;

  /// No description provided for @activeBadge.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeBadge;

  /// No description provided for @weight1rmHint.
  ///
  /// In en, this message translates to:
  /// **'Weight lifted'**
  String get weight1rmHint;

  /// No description provided for @resumeWorkout.
  ///
  /// In en, this message translates to:
  /// **'Resume workout'**
  String get resumeWorkout;

  /// No description provided for @moreActions.
  ///
  /// In en, this message translates to:
  /// **'More actions'**
  String get moreActions;

  /// No description provided for @workoutInProgress.
  ///
  /// In en, this message translates to:
  /// **'Workout in progress'**
  String get workoutInProgress;

  /// No description provided for @noWorkoutsYetBody.
  ///
  /// In en, this message translates to:
  /// **'Your finished workouts will appear here.'**
  String get noWorkoutsYetBody;

  /// No description provided for @restSeconds.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s'**
  String restSeconds(int seconds);

  /// No description provided for @lastTime.
  ///
  /// In en, this message translates to:
  /// **'Last time: {value}'**
  String lastTime(String value);

  /// No description provided for @setNumber.
  ///
  /// In en, this message translates to:
  /// **'Set {number}'**
  String setNumber(int number);

  /// No description provided for @addCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Add} other{Add {count}}}'**
  String addCount(int count);

  /// No description provided for @weeksCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 week} other{{count} weeks}}'**
  String weeksCount(int count);

  /// No description provided for @plateRemainder.
  ///
  /// In en, this message translates to:
  /// **'Closest you can load: {weight}'**
  String plateRemainder(String weight);

  /// No description provided for @restSemantics.
  ///
  /// In en, this message translates to:
  /// **'Rest, {seconds} seconds remaining'**
  String restSemantics(int seconds);

  /// No description provided for @setsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 set} other{{count} sets}}'**
  String setsCount(int count);

  /// No description provided for @shareWorkoutText.
  ///
  /// In en, this message translates to:
  /// **'I just finished {name} on PULSE: {volume} lifted in {minutes} minutes.'**
  String shareWorkoutText(String name, String volume, int minutes);

  /// No description provided for @cardioWalk.
  ///
  /// In en, this message translates to:
  /// **'Walk'**
  String get cardioWalk;

  /// No description provided for @cardioRun.
  ///
  /// In en, this message translates to:
  /// **'Run'**
  String get cardioRun;

  /// No description provided for @cardioHike.
  ///
  /// In en, this message translates to:
  /// **'Hike'**
  String get cardioHike;

  /// No description provided for @cardioCycle.
  ///
  /// In en, this message translates to:
  /// **'Ride'**
  String get cardioCycle;

  /// No description provided for @cardioTreadmill.
  ///
  /// In en, this message translates to:
  /// **'Treadmill'**
  String get cardioTreadmill;

  /// No description provided for @cardioOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get cardioOther;

  /// No description provided for @trackActivity.
  ///
  /// In en, this message translates to:
  /// **'Start tracking'**
  String get trackActivity;

  /// No description provided for @indoor.
  ///
  /// In en, this message translates to:
  /// **'Indoor'**
  String get indoor;

  /// No description provided for @outdoor.
  ///
  /// In en, this message translates to:
  /// **'Outdoor'**
  String get outdoor;

  /// No description provided for @logCardio.
  ///
  /// In en, this message translates to:
  /// **'Log activity'**
  String get logCardio;

  /// No description provided for @todaySteps.
  ///
  /// In en, this message translates to:
  /// **'Today\'s steps'**
  String get todaySteps;

  /// No description provided for @pace.
  ///
  /// In en, this message translates to:
  /// **'Pace'**
  String get pace;

  /// No description provided for @elevation.
  ///
  /// In en, this message translates to:
  /// **'Elevation'**
  String get elevation;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @autoPaused.
  ///
  /// In en, this message translates to:
  /// **'Auto-paused'**
  String get autoPaused;

  /// No description provided for @paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @replayRoute.
  ///
  /// In en, this message translates to:
  /// **'Replay route'**
  String get replayRoute;

  /// No description provided for @splits.
  ///
  /// In en, this message translates to:
  /// **'Splits'**
  String get splits;

  /// No description provided for @noRoute.
  ///
  /// In en, this message translates to:
  /// **'No route recorded for this activity.'**
  String get noRoute;

  /// No description provided for @activityHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get activityHistory;

  /// No description provided for @locationNeededTitle.
  ///
  /// In en, this message translates to:
  /// **'Location is off'**
  String get locationNeededTitle;

  /// No description provided for @locationNeededBody.
  ///
  /// In en, this message translates to:
  /// **'Allow location access to map your route. Indoor mode works without it.'**
  String get locationNeededBody;

  /// No description provided for @trackingNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'PULSE is tracking your activity'**
  String get trackingNotificationTitle;

  /// No description provided for @trackingNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Your route and pace are being recorded.'**
  String get trackingNotificationBody;

  /// No description provided for @audioCues.
  ///
  /// In en, this message translates to:
  /// **'Audio cues'**
  String get audioCues;

  /// No description provided for @discardActivity.
  ///
  /// In en, this message translates to:
  /// **'Discard activity'**
  String get discardActivity;

  /// No description provided for @stepsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Step counting isn\'t available. Allow Motion & fitness access in Settings.'**
  String get stepsUnavailable;

  /// No description provided for @caloriesOptional.
  ///
  /// In en, this message translates to:
  /// **'Calories (optional)'**
  String get caloriesOptional;

  /// No description provided for @minutesLabel.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutesLabel;

  /// No description provided for @activitySaved.
  ///
  /// In en, this message translates to:
  /// **'Activity saved'**
  String get activitySaved;

  /// No description provided for @invalidDuration.
  ///
  /// In en, this message translates to:
  /// **'Enter a duration in minutes.'**
  String get invalidDuration;

  /// No description provided for @ttsSplit.
  ///
  /// In en, this message translates to:
  /// **'{distance} {unit}. Pace {minutes} minutes {seconds} seconds.'**
  String ttsSplit(int distance, String unit, int minutes, int seconds);

  /// No description provided for @splitLabel.
  ///
  /// In en, this message translates to:
  /// **'{unit} {number}'**
  String splitLabel(String unit, int number);

  /// No description provided for @bodyAndWeight.
  ///
  /// In en, this message translates to:
  /// **'Body & weight'**
  String get bodyAndWeight;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @nutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get nutrition;

  /// No description provided for @progressPhotos.
  ///
  /// In en, this message translates to:
  /// **'Progress photos'**
  String get progressPhotos;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @syncHealth.
  ///
  /// In en, this message translates to:
  /// **'Sync health data'**
  String get syncHealth;

  /// No description provided for @restingHr.
  ///
  /// In en, this message translates to:
  /// **'Resting HR'**
  String get restingHr;

  /// No description provided for @hrv.
  ///
  /// In en, this message translates to:
  /// **'HRV'**
  String get hrv;

  /// No description provided for @sleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get sleep;

  /// No description provided for @latestHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Latest heart rate'**
  String get latestHeartRate;

  /// No description provided for @healthUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Connect Apple Health or Health Connect in onboarding or Settings to see heart rate and sleep.'**
  String get healthUnavailable;

  /// No description provided for @healthDesktop.
  ///
  /// In en, this message translates to:
  /// **'Heart rate and sleep recorded on your phone appear here after sync.'**
  String get healthDesktop;

  /// No description provided for @measureWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get measureWeight;

  /// No description provided for @measureBodyFat.
  ///
  /// In en, this message translates to:
  /// **'Body fat'**
  String get measureBodyFat;

  /// No description provided for @measureWaist.
  ///
  /// In en, this message translates to:
  /// **'Waist'**
  String get measureWaist;

  /// No description provided for @measureChest.
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get measureChest;

  /// No description provided for @measureHips.
  ///
  /// In en, this message translates to:
  /// **'Hips'**
  String get measureHips;

  /// No description provided for @measureArm.
  ///
  /// In en, this message translates to:
  /// **'Arm'**
  String get measureArm;

  /// No description provided for @measureThigh.
  ///
  /// In en, this message translates to:
  /// **'Thigh'**
  String get measureThigh;

  /// No description provided for @measureNeck.
  ///
  /// In en, this message translates to:
  /// **'Neck'**
  String get measureNeck;

  /// No description provided for @addEntry.
  ///
  /// In en, this message translates to:
  /// **'Add entry'**
  String get addEntry;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @trend.
  ///
  /// In en, this message translates to:
  /// **'Trend'**
  String get trend;

  /// No description provided for @noEntries.
  ///
  /// In en, this message translates to:
  /// **'No entries yet'**
  String get noEntries;

  /// No description provided for @noEntriesBody.
  ///
  /// In en, this message translates to:
  /// **'Add your first measurement to start a trend.'**
  String get noEntriesBody;

  /// No description provided for @addWater.
  ///
  /// In en, this message translates to:
  /// **'Add water'**
  String get addWater;

  /// No description provided for @waterGoalReached.
  ///
  /// In en, this message translates to:
  /// **'Daily water goal reached!'**
  String get waterGoalReached;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @mealBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get mealBreakfast;

  /// No description provided for @mealLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get mealLunch;

  /// No description provided for @mealDinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get mealDinner;

  /// No description provided for @mealSnack.
  ///
  /// In en, this message translates to:
  /// **'Snack'**
  String get mealSnack;

  /// No description provided for @addFood.
  ///
  /// In en, this message translates to:
  /// **'Add food'**
  String get addFood;

  /// No description provided for @foodName.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get foodName;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @gramsUnit.
  ///
  /// In en, this message translates to:
  /// **'g'**
  String get gramsUnit;

  /// No description provided for @noMeals.
  ///
  /// In en, this message translates to:
  /// **'Nothing logged today'**
  String get noMeals;

  /// No description provided for @noMealsBody.
  ///
  /// In en, this message translates to:
  /// **'Log meals to track calories and macros against your targets.'**
  String get noMealsBody;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get addPhoto;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get takePhoto;

  /// No description provided for @chooseFromLibrary.
  ///
  /// In en, this message translates to:
  /// **'Choose from library'**
  String get chooseFromLibrary;

  /// No description provided for @compare.
  ///
  /// In en, this message translates to:
  /// **'Compare'**
  String get compare;

  /// No description provided for @poseFront.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get poseFront;

  /// No description provided for @poseSide.
  ///
  /// In en, this message translates to:
  /// **'Side'**
  String get poseSide;

  /// No description provided for @poseBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get poseBack;

  /// No description provided for @selectTwoPhotos.
  ///
  /// In en, this message translates to:
  /// **'Select two photos to compare.'**
  String get selectTwoPhotos;

  /// No description provided for @photosPrivate.
  ///
  /// In en, this message translates to:
  /// **'Photos are encrypted and stay on this device.'**
  String get photosPrivate;

  /// No description provided for @noPhotos.
  ///
  /// In en, this message translates to:
  /// **'No progress photos yet'**
  String get noPhotos;

  /// No description provided for @noPhotosBody.
  ///
  /// In en, this message translates to:
  /// **'Take a photo every few weeks to see how far you\'ve come.'**
  String get noPhotosBody;

  /// No description provided for @vaultUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Secure storage isn\'t available on this device, so photos can\'t be saved privately.'**
  String get vaultUnavailable;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @deleted.
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get deleted;

  /// No description provided for @ofTarget.
  ///
  /// In en, this message translates to:
  /// **'{value} / {target}'**
  String ofTarget(String value, String target);

  /// No description provided for @sleepHours.
  ///
  /// In en, this message translates to:
  /// **'{hours} h {minutes} min'**
  String sleepHours(int hours, int minutes);

  /// No description provided for @waterProgress.
  ///
  /// In en, this message translates to:
  /// **'{amount} of {goal} ml'**
  String waterProgress(int amount, int goal);

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @recordsBoard.
  ///
  /// In en, this message translates to:
  /// **'Personal records'**
  String get recordsBoard;

  /// No description provided for @achievementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTitle;

  /// No description provided for @monthlyRecap.
  ///
  /// In en, this message translates to:
  /// **'Monthly recap'**
  String get monthlyRecap;

  /// No description provided for @rangeWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get rangeWeek;

  /// No description provided for @rangeMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get rangeMonth;

  /// No description provided for @range3Months.
  ///
  /// In en, this message translates to:
  /// **'3 months'**
  String get range3Months;

  /// No description provided for @rangeYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get rangeYear;

  /// No description provided for @chartVolume.
  ///
  /// In en, this message translates to:
  /// **'Training volume'**
  String get chartVolume;

  /// No description provided for @chartFrequency.
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get chartFrequency;

  /// No description provided for @chartSteps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get chartSteps;

  /// No description provided for @chartDistance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get chartDistance;

  /// No description provided for @chartWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get chartWeight;

  /// No description provided for @chartStrength.
  ///
  /// In en, this message translates to:
  /// **'Strength (est. 1RM)'**
  String get chartStrength;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'Not enough data yet'**
  String get noData;

  /// No description provided for @noDataBody.
  ///
  /// In en, this message translates to:
  /// **'Keep training — your charts fill in as you log.'**
  String get noDataBody;

  /// No description provided for @chooseExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get chooseExercise;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @xp.
  ///
  /// In en, this message translates to:
  /// **'XP'**
  String get xp;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get locked;

  /// No description provided for @unlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get unlocked;

  /// No description provided for @shareCard.
  ///
  /// In en, this message translates to:
  /// **'Share card'**
  String get shareCard;

  /// No description provided for @achievementUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Achievement unlocked!'**
  String get achievementUnlocked;

  /// No description provided for @achFirstWorkout.
  ///
  /// In en, this message translates to:
  /// **'First workout'**
  String get achFirstWorkout;

  /// No description provided for @achFirstWorkoutBody.
  ///
  /// In en, this message translates to:
  /// **'Finish your first workout.'**
  String get achFirstWorkoutBody;

  /// No description provided for @achWorkouts10.
  ///
  /// In en, this message translates to:
  /// **'Getting serious'**
  String get achWorkouts10;

  /// No description provided for @achWorkouts10Body.
  ///
  /// In en, this message translates to:
  /// **'Finish 10 workouts.'**
  String get achWorkouts10Body;

  /// No description provided for @achWorkouts50.
  ///
  /// In en, this message translates to:
  /// **'Dedicated'**
  String get achWorkouts50;

  /// No description provided for @achWorkouts50Body.
  ///
  /// In en, this message translates to:
  /// **'Finish 50 workouts.'**
  String get achWorkouts50Body;

  /// No description provided for @achWorkouts100.
  ///
  /// In en, this message translates to:
  /// **'Centurion'**
  String get achWorkouts100;

  /// No description provided for @achWorkouts100Body.
  ///
  /// In en, this message translates to:
  /// **'Finish 100 workouts.'**
  String get achWorkouts100Body;

  /// No description provided for @achStreak7.
  ///
  /// In en, this message translates to:
  /// **'On fire'**
  String get achStreak7;

  /// No description provided for @achStreak7Body.
  ///
  /// In en, this message translates to:
  /// **'Keep a 7-day streak.'**
  String get achStreak7Body;

  /// No description provided for @achStreak30.
  ///
  /// In en, this message translates to:
  /// **'Unstoppable'**
  String get achStreak30;

  /// No description provided for @achStreak30Body.
  ///
  /// In en, this message translates to:
  /// **'Keep a 30-day streak.'**
  String get achStreak30Body;

  /// No description provided for @achVolume10k.
  ///
  /// In en, this message translates to:
  /// **'Heavy lifter'**
  String get achVolume10k;

  /// No description provided for @achVolume10kBody.
  ///
  /// In en, this message translates to:
  /// **'Lift 10,000 kg in one workout.'**
  String get achVolume10kBody;

  /// No description provided for @achFirstPr.
  ///
  /// In en, this message translates to:
  /// **'Personal best'**
  String get achFirstPr;

  /// No description provided for @achFirstPrBody.
  ///
  /// In en, this message translates to:
  /// **'Set your first personal record.'**
  String get achFirstPrBody;

  /// No description provided for @achPrs25.
  ///
  /// In en, this message translates to:
  /// **'Record breaker'**
  String get achPrs25;

  /// No description provided for @achPrs25Body.
  ///
  /// In en, this message translates to:
  /// **'Set 25 personal records.'**
  String get achPrs25Body;

  /// No description provided for @achFirstCardio.
  ///
  /// In en, this message translates to:
  /// **'On the move'**
  String get achFirstCardio;

  /// No description provided for @achFirstCardioBody.
  ///
  /// In en, this message translates to:
  /// **'Log your first walk, run or ride.'**
  String get achFirstCardioBody;

  /// No description provided for @achDistance50.
  ///
  /// In en, this message translates to:
  /// **'Road warrior'**
  String get achDistance50;

  /// No description provided for @achDistance50Body.
  ///
  /// In en, this message translates to:
  /// **'Cover 50 km of cardio in total.'**
  String get achDistance50Body;

  /// No description provided for @achSteps10k.
  ///
  /// In en, this message translates to:
  /// **'10K day'**
  String get achSteps10k;

  /// No description provided for @achSteps10kBody.
  ///
  /// In en, this message translates to:
  /// **'Walk 10,000 steps in a day.'**
  String get achSteps10kBody;

  /// No description provided for @recapWorkouts.
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get recapWorkouts;

  /// No description provided for @recapVolume.
  ///
  /// In en, this message translates to:
  /// **'Lifted'**
  String get recapVolume;

  /// No description provided for @recapTime.
  ///
  /// In en, this message translates to:
  /// **'Time training'**
  String get recapTime;

  /// No description provided for @recapDistance.
  ///
  /// In en, this message translates to:
  /// **'Distance covered'**
  String get recapDistance;

  /// No description provided for @recapSteps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get recapSteps;

  /// No description provided for @recapTopExercise.
  ///
  /// In en, this message translates to:
  /// **'Favourite exercise'**
  String get recapTopExercise;

  /// No description provided for @recapRecords.
  ///
  /// In en, this message translates to:
  /// **'New records'**
  String get recapRecords;

  /// No description provided for @recapEmpty.
  ///
  /// In en, this message translates to:
  /// **'No activity this month yet. Your recap builds as you train.'**
  String get recapEmpty;

  /// No description provided for @levelLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String levelLabel(int level);

  /// No description provided for @xpToNext.
  ///
  /// In en, this message translates to:
  /// **'{xp} XP to level {level}'**
  String xpToNext(int xp, int level);

  /// No description provided for @recapTitle.
  ///
  /// In en, this message translates to:
  /// **'Your {month}'**
  String recapTitle(String month);

  /// No description provided for @recoveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Recovery'**
  String get recoveryTitle;

  /// No description provided for @recoveryScore.
  ///
  /// In en, this message translates to:
  /// **'Recovery score {score}'**
  String recoveryScore(int score);

  /// No description provided for @readyToTrain.
  ///
  /// In en, this message translates to:
  /// **'Ready to train'**
  String get readyToTrain;

  /// No description provided for @trainLight.
  ///
  /// In en, this message translates to:
  /// **'Train light today'**
  String get trainLight;

  /// No description provided for @restDay.
  ///
  /// In en, this message translates to:
  /// **'Take a rest day'**
  String get restDay;

  /// No description provided for @recoveryUnknown.
  ///
  /// In en, this message translates to:
  /// **'Not enough data yet'**
  String get recoveryUnknown;

  /// No description provided for @tipSleepMore.
  ///
  /// In en, this message translates to:
  /// **'You slept under 7 hours. Keep today\'s session shorter or easier.'**
  String get tipSleepMore;

  /// No description provided for @tipHrvLow.
  ///
  /// In en, this message translates to:
  /// **'Your HRV is below your usual level. Your body may still be recovering.'**
  String get tipHrvLow;

  /// No description provided for @tipRestingHrHigh.
  ///
  /// In en, this message translates to:
  /// **'Your resting heart rate is up. Watch for stress, illness or too little sleep.'**
  String get tipRestingHrHigh;

  /// No description provided for @tipLoadSpike.
  ///
  /// In en, this message translates to:
  /// **'You trained much more this week than usual. Ease off to avoid injury.'**
  String get tipLoadSpike;

  /// No description provided for @tipDeload.
  ///
  /// In en, this message translates to:
  /// **'Five hard weeks in a row. Plan a lighter deload week to keep progressing.'**
  String get tipDeload;

  /// No description provided for @tipConnectHealth.
  ///
  /// In en, this message translates to:
  /// **'Connect Apple Health or Health Connect to get a recovery score from your sleep and heart rate.'**
  String get tipConnectHealth;

  /// No description provided for @reminderWorkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Get up. It\'s time.'**
  String get reminderWorkoutTitle;

  /// No description provided for @reminderWorkoutBody.
  ///
  /// In en, this message translates to:
  /// **'{name} is on the plan. The weights aren\'t lifting themselves.'**
  String reminderWorkoutBody(String name);

  /// No description provided for @reminderStreakTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t you dare break it'**
  String get reminderStreakTitle;

  /// No description provided for @reminderStreakBody.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day strong} other{{count} days strong}}. Ten minutes of walking keeps it alive.'**
  String reminderStreakBody(int count);

  /// No description provided for @reminderInactiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Where have you been?'**
  String get reminderInactiveTitle;

  /// No description provided for @reminderInactiveBody.
  ///
  /// In en, this message translates to:
  /// **'Three days off. Time to get it together and go train.'**
  String get reminderInactiveBody;

  /// No description provided for @goalReachedTitle.
  ///
  /// In en, this message translates to:
  /// **'Step goal reached!'**
  String get goalReachedTitle;

  /// No description provided for @goalReachedBody.
  ///
  /// In en, this message translates to:
  /// **'{goal} steps today. Nice work.'**
  String goalReachedBody(int goal);

  /// No description provided for @setsProgress.
  ///
  /// In en, this message translates to:
  /// **'{done}/{total} sets'**
  String setsProgress(int done, int total);

  /// No description provided for @widgetNoPlan.
  ///
  /// In en, this message translates to:
  /// **'No plan yet'**
  String get widgetNoPlan;

  /// No description provided for @widgetToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get widgetToday;

  /// No description provided for @widgetNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get widgetNext;

  /// No description provided for @waterLogTitle.
  ///
  /// In en, this message translates to:
  /// **'Log water'**
  String get waterLogTitle;

  /// No description provided for @startWalk.
  ///
  /// In en, this message translates to:
  /// **'Start walk'**
  String get startWalk;

  /// No description provided for @remindersTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get remindersTitle;

  /// No description provided for @remindersBody.
  ///
  /// In en, this message translates to:
  /// **'Workout reminders, streak protection, step goal reached and a nudge after a few quiet days.'**
  String get remindersBody;

  /// No description provided for @reminderTime.
  ///
  /// In en, this message translates to:
  /// **'Reminder time'**
  String get reminderTime;

  /// No description provided for @remindersDenied.
  ///
  /// In en, this message translates to:
  /// **'Notifications are turned off for PULSE. Turn them on in system settings.'**
  String get remindersDenied;

  /// No description provided for @reminderWorkoutTitle2.
  ///
  /// In en, this message translates to:
  /// **'No excuses today'**
  String get reminderWorkoutTitle2;

  /// No description provided for @reminderWorkoutBody2.
  ///
  /// In en, this message translates to:
  /// **'{name} is waiting. Show up for yourself.'**
  String reminderWorkoutBody2(String name);

  /// No description provided for @reminderWorkoutTitle3.
  ///
  /// In en, this message translates to:
  /// **'Clock in'**
  String get reminderWorkoutTitle3;

  /// No description provided for @reminderWorkoutBody3.
  ///
  /// In en, this message translates to:
  /// **'{name} today. Future you is watching.'**
  String reminderWorkoutBody3(String name);

  /// No description provided for @reminderStreakTitle2.
  ///
  /// In en, this message translates to:
  /// **'Your streak is on the line'**
  String get reminderStreakTitle2;

  /// No description provided for @reminderStreakBody2.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}} of work. Don\'t throw it away tonight.'**
  String reminderStreakBody2(int count);

  /// No description provided for @reminderStreakTitle3.
  ///
  /// In en, this message translates to:
  /// **'Still nothing today?'**
  String get reminderStreakTitle3;

  /// No description provided for @reminderStreakBody3.
  ///
  /// In en, this message translates to:
  /// **'Protect the {count, plural, =1{1-day} other{{count}-day}} streak. Move. Now.'**
  String reminderStreakBody3(int count);

  /// No description provided for @reminderInactiveTitle2.
  ///
  /// In en, this message translates to:
  /// **'Excuses don\'t build muscle'**
  String get reminderInactiveTitle2;

  /// No description provided for @reminderInactiveBody2.
  ///
  /// In en, this message translates to:
  /// **'Your gym bag misses you. Twenty minutes. Go.'**
  String get reminderInactiveBody2;

  /// No description provided for @reminderInactiveTitle3.
  ///
  /// In en, this message translates to:
  /// **'Comfort zone detected'**
  String get reminderInactiveTitle3;

  /// No description provided for @reminderInactiveBody3.
  ///
  /// In en, this message translates to:
  /// **'Nobody is coming to motivate you. Get up and get it done.'**
  String get reminderInactiveBody3;

  /// No description provided for @refreshing.
  ///
  /// In en, this message translates to:
  /// **'Refreshing'**
  String get refreshing;

  /// No description provided for @appLockTitle.
  ///
  /// In en, this message translates to:
  /// **'App lock'**
  String get appLockTitle;

  /// No description provided for @appLockBody.
  ///
  /// In en, this message translates to:
  /// **'Ask for Face ID, fingerprint or your PIN when PULSE opens.'**
  String get appLockBody;

  /// No description provided for @appLockBiometric.
  ///
  /// In en, this message translates to:
  /// **'Unlock with Face ID or fingerprint'**
  String get appLockBiometric;

  /// No description provided for @appLockChangePin.
  ///
  /// In en, this message translates to:
  /// **'Change PIN'**
  String get appLockChangePin;

  /// No description provided for @appLockOn.
  ///
  /// In en, this message translates to:
  /// **'App lock is on'**
  String get appLockOn;

  /// No description provided for @lockTitle.
  ///
  /// In en, this message translates to:
  /// **'PULSE is locked'**
  String get lockTitle;

  /// No description provided for @lockReason.
  ///
  /// In en, this message translates to:
  /// **'Unlock PULSE'**
  String get lockReason;

  /// No description provided for @lockEnterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN'**
  String get lockEnterPin;

  /// No description provided for @lockWrongPin.
  ///
  /// In en, this message translates to:
  /// **'Wrong PIN'**
  String get lockWrongPin;

  /// No description provided for @lockTooMany.
  ///
  /// In en, this message translates to:
  /// **'Too many tries. Try again in {seconds} s.'**
  String lockTooMany(int seconds);

  /// No description provided for @lockUseBiometric.
  ///
  /// In en, this message translates to:
  /// **'Use Face ID or fingerprint'**
  String get lockUseBiometric;

  /// No description provided for @keypadDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get keypadDelete;

  /// No description provided for @pinCreate.
  ///
  /// In en, this message translates to:
  /// **'Choose a 4-digit PIN'**
  String get pinCreate;

  /// No description provided for @pinConfirm.
  ///
  /// In en, this message translates to:
  /// **'Enter it again'**
  String get pinConfirm;

  /// No description provided for @pinMismatch.
  ///
  /// In en, this message translates to:
  /// **'PINs didn\'t match. Start over.'**
  String get pinMismatch;

  /// No description provided for @pinCurrent.
  ///
  /// In en, this message translates to:
  /// **'Enter your current PIN'**
  String get pinCurrent;

  /// No description provided for @pinProgress.
  ///
  /// In en, this message translates to:
  /// **'{entered} of {total} digits entered'**
  String pinProgress(int entered, int total);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
