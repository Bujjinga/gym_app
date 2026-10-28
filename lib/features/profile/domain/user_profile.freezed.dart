// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get id; String? get displayName; String? get avatarPath; TrainingGoal? get goal; ExperienceLevel? get experience; List<Equipment> get equipment; int? get trainingDaysPerWeek; double? get heightCm; double? get weightKg; int? get birthYear; Sex? get sex; WeightUnit get weightUnit; DistanceUnit get distanceUnit; AppThemeMode get themeMode; int get moveGoalKcal; int get exerciseGoalMin; int get stepsGoal; int get waterGoalMl; bool get onboardingComplete; int get xp;/// Home card order; `!` prefix = hidden. Interpreted by the home feature.
 List<String> get dashboardCards; bool get remindersEnabled;/// Reminder time as minutes after midnight (local).
 int get reminderMinute;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.avatarPath, _this.avatarPath) || other.avatarPath == _this.avatarPath)&&(identical(other.goal, _this.goal) || other.goal == _this.goal)&&(identical(other.experience, _this.experience) || other.experience == _this.experience)&&const DeepCollectionEquality().equals(other.equipment, _this.equipment)&&(identical(other.trainingDaysPerWeek, _this.trainingDaysPerWeek) || other.trainingDaysPerWeek == _this.trainingDaysPerWeek)&&(identical(other.heightCm, _this.heightCm) || other.heightCm == _this.heightCm)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg)&&(identical(other.birthYear, _this.birthYear) || other.birthYear == _this.birthYear)&&(identical(other.sex, _this.sex) || other.sex == _this.sex)&&(identical(other.weightUnit, _this.weightUnit) || other.weightUnit == _this.weightUnit)&&(identical(other.distanceUnit, _this.distanceUnit) || other.distanceUnit == _this.distanceUnit)&&(identical(other.themeMode, _this.themeMode) || other.themeMode == _this.themeMode)&&(identical(other.moveGoalKcal, _this.moveGoalKcal) || other.moveGoalKcal == _this.moveGoalKcal)&&(identical(other.exerciseGoalMin, _this.exerciseGoalMin) || other.exerciseGoalMin == _this.exerciseGoalMin)&&(identical(other.stepsGoal, _this.stepsGoal) || other.stepsGoal == _this.stepsGoal)&&(identical(other.waterGoalMl, _this.waterGoalMl) || other.waterGoalMl == _this.waterGoalMl)&&(identical(other.onboardingComplete, _this.onboardingComplete) || other.onboardingComplete == _this.onboardingComplete)&&(identical(other.xp, _this.xp) || other.xp == _this.xp)&&const DeepCollectionEquality().equals(other.dashboardCards, _this.dashboardCards)&&(identical(other.remindersEnabled, _this.remindersEnabled) || other.remindersEnabled == _this.remindersEnabled)&&(identical(other.reminderMinute, _this.reminderMinute) || other.reminderMinute == _this.reminderMinute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserProfile;
  return Object.hashAll([runtimeType,_this.id,_this.displayName,_this.avatarPath,_this.goal,_this.experience,const DeepCollectionEquality().hash(_this.equipment),_this.trainingDaysPerWeek,_this.heightCm,_this.weightKg,_this.birthYear,_this.sex,_this.weightUnit,_this.distanceUnit,_this.themeMode,_this.moveGoalKcal,_this.exerciseGoalMin,_this.stepsGoal,_this.waterGoalMl,_this.onboardingComplete,_this.xp,const DeepCollectionEquality().hash(_this.dashboardCards),_this.remindersEnabled,_this.reminderMinute]);
}

@override
String toString() {
  final _this = this as UserProfile;
  return 'UserProfile(id: ${_this.id}, displayName: ${_this.displayName}, avatarPath: ${_this.avatarPath}, goal: ${_this.goal}, experience: ${_this.experience}, equipment: ${_this.equipment}, trainingDaysPerWeek: ${_this.trainingDaysPerWeek}, heightCm: ${_this.heightCm}, weightKg: ${_this.weightKg}, birthYear: ${_this.birthYear}, sex: ${_this.sex}, weightUnit: ${_this.weightUnit}, distanceUnit: ${_this.distanceUnit}, themeMode: ${_this.themeMode}, moveGoalKcal: ${_this.moveGoalKcal}, exerciseGoalMin: ${_this.exerciseGoalMin}, stepsGoal: ${_this.stepsGoal}, waterGoalMl: ${_this.waterGoalMl}, onboardingComplete: ${_this.onboardingComplete}, xp: ${_this.xp}, dashboardCards: ${_this.dashboardCards}, remindersEnabled: ${_this.remindersEnabled}, reminderMinute: ${_this.reminderMinute})';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String id, String? displayName, String? avatarPath, TrainingGoal? goal, ExperienceLevel? experience, List<Equipment> equipment, int? trainingDaysPerWeek, double? heightCm, double? weightKg, int? birthYear, Sex? sex, WeightUnit weightUnit, DistanceUnit distanceUnit, AppThemeMode themeMode, int moveGoalKcal, int exerciseGoalMin, int stepsGoal, int waterGoalMl, bool onboardingComplete, int xp, List<String> dashboardCards, bool remindersEnabled, int reminderMinute
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = freezed,Object? avatarPath = freezed,Object? goal = freezed,Object? experience = freezed,Object? equipment = null,Object? trainingDaysPerWeek = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? birthYear = freezed,Object? sex = freezed,Object? weightUnit = null,Object? distanceUnit = null,Object? themeMode = null,Object? moveGoalKcal = null,Object? exerciseGoalMin = null,Object? stepsGoal = null,Object? waterGoalMl = null,Object? onboardingComplete = null,Object? xp = null,Object? dashboardCards = null,Object? remindersEnabled = null,Object? reminderMinute = null,}) {
  return _then(UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as TrainingGoal?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as ExperienceLevel?,equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<Equipment>,trainingDaysPerWeek: freezed == trainingDaysPerWeek ? _self.trainingDaysPerWeek : trainingDaysPerWeek // ignore: cast_nullable_to_non_nullable
as int?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as WeightUnit,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,moveGoalKcal: null == moveGoalKcal ? _self.moveGoalKcal : moveGoalKcal // ignore: cast_nullable_to_non_nullable
as int,exerciseGoalMin: null == exerciseGoalMin ? _self.exerciseGoalMin : exerciseGoalMin // ignore: cast_nullable_to_non_nullable
as int,stepsGoal: null == stepsGoal ? _self.stepsGoal : stepsGoal // ignore: cast_nullable_to_non_nullable
as int,waterGoalMl: null == waterGoalMl ? _self.waterGoalMl : waterGoalMl // ignore: cast_nullable_to_non_nullable
as int,onboardingComplete: null == onboardingComplete ? _self.onboardingComplete : onboardingComplete // ignore: cast_nullable_to_non_nullable
as bool,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,dashboardCards: null == dashboardCards ? _self.dashboardCards : dashboardCards // ignore: cast_nullable_to_non_nullable
as List<String>,remindersEnabled: null == remindersEnabled ? _self.remindersEnabled : remindersEnabled // ignore: cast_nullable_to_non_nullable
as bool,reminderMinute: null == reminderMinute ? _self.reminderMinute : reminderMinute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? displayName,  String? avatarPath,  TrainingGoal? goal,  ExperienceLevel? experience,  List<Equipment> equipment,  int? trainingDaysPerWeek,  double? heightCm,  double? weightKg,  int? birthYear,  Sex? sex,  WeightUnit weightUnit,  DistanceUnit distanceUnit,  AppThemeMode themeMode,  int moveGoalKcal,  int exerciseGoalMin,  int stepsGoal,  int waterGoalMl,  bool onboardingComplete,  int xp,  List<String> dashboardCards,  bool remindersEnabled,  int reminderMinute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.displayName,_that.avatarPath,_that.goal,_that.experience,_that.equipment,_that.trainingDaysPerWeek,_that.heightCm,_that.weightKg,_that.birthYear,_that.sex,_that.weightUnit,_that.distanceUnit,_that.themeMode,_that.moveGoalKcal,_that.exerciseGoalMin,_that.stepsGoal,_that.waterGoalMl,_that.onboardingComplete,_that.xp,_that.dashboardCards,_that.remindersEnabled,_that.reminderMinute);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? displayName,  String? avatarPath,  TrainingGoal? goal,  ExperienceLevel? experience,  List<Equipment> equipment,  int? trainingDaysPerWeek,  double? heightCm,  double? weightKg,  int? birthYear,  Sex? sex,  WeightUnit weightUnit,  DistanceUnit distanceUnit,  AppThemeMode themeMode,  int moveGoalKcal,  int exerciseGoalMin,  int stepsGoal,  int waterGoalMl,  bool onboardingComplete,  int xp,  List<String> dashboardCards,  bool remindersEnabled,  int reminderMinute)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.displayName,_that.avatarPath,_that.goal,_that.experience,_that.equipment,_that.trainingDaysPerWeek,_that.heightCm,_that.weightKg,_that.birthYear,_that.sex,_that.weightUnit,_that.distanceUnit,_that.themeMode,_that.moveGoalKcal,_that.exerciseGoalMin,_that.stepsGoal,_that.waterGoalMl,_that.onboardingComplete,_that.xp,_that.dashboardCards,_that.remindersEnabled,_that.reminderMinute);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? displayName,  String? avatarPath,  TrainingGoal? goal,  ExperienceLevel? experience,  List<Equipment> equipment,  int? trainingDaysPerWeek,  double? heightCm,  double? weightKg,  int? birthYear,  Sex? sex,  WeightUnit weightUnit,  DistanceUnit distanceUnit,  AppThemeMode themeMode,  int moveGoalKcal,  int exerciseGoalMin,  int stepsGoal,  int waterGoalMl,  bool onboardingComplete,  int xp,  List<String> dashboardCards,  bool remindersEnabled,  int reminderMinute)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.displayName,_that.avatarPath,_that.goal,_that.experience,_that.equipment,_that.trainingDaysPerWeek,_that.heightCm,_that.weightKg,_that.birthYear,_that.sex,_that.weightUnit,_that.distanceUnit,_that.themeMode,_that.moveGoalKcal,_that.exerciseGoalMin,_that.stepsGoal,_that.waterGoalMl,_that.onboardingComplete,_that.xp,_that.dashboardCards,_that.remindersEnabled,_that.reminderMinute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile extends UserProfile {
  const _UserProfile({required this.id, this.displayName, this.avatarPath, this.goal, this.experience,  List<Equipment> equipment = const <Equipment>[], this.trainingDaysPerWeek, this.heightCm, this.weightKg, this.birthYear, this.sex, this.weightUnit = WeightUnit.kg, this.distanceUnit = DistanceUnit.km, this.themeMode = AppThemeMode.dark, this.moveGoalKcal = 500, this.exerciseGoalMin = 30, this.stepsGoal = 10000, this.waterGoalMl = 2500, this.onboardingComplete = false, this.xp = 0,  List<String> dashboardCards = const <String>[], this.remindersEnabled = false, this.reminderMinute = 18 * 60}): _equipment = equipment,_dashboardCards = dashboardCards,super._();
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String id;
@override final  String? displayName;
@override final  String? avatarPath;
@override final  TrainingGoal? goal;
@override final  ExperienceLevel? experience;
 final  List<Equipment> _equipment;
@override@JsonKey() List<Equipment> get equipment {
  if (_equipment is EqualUnmodifiableListView) return _equipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equipment);
}

@override final  int? trainingDaysPerWeek;
@override final  double? heightCm;
@override final  double? weightKg;
@override final  int? birthYear;
@override final  Sex? sex;
@override@JsonKey() final  WeightUnit weightUnit;
@override@JsonKey() final  DistanceUnit distanceUnit;
@override@JsonKey() final  AppThemeMode themeMode;
@override@JsonKey() final  int moveGoalKcal;
@override@JsonKey() final  int exerciseGoalMin;
@override@JsonKey() final  int stepsGoal;
@override@JsonKey() final  int waterGoalMl;
@override@JsonKey() final  bool onboardingComplete;
@override@JsonKey() final  int xp;
/// Home card order; `!` prefix = hidden. Interpreted by the home feature.
 final  List<String> _dashboardCards;
/// Home card order; `!` prefix = hidden. Interpreted by the home feature.
@override@JsonKey() List<String> get dashboardCards {
  if (_dashboardCards is EqualUnmodifiableListView) return _dashboardCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dashboardCards);
}

@override@JsonKey() final  bool remindersEnabled;
/// Reminder time as minutes after midnight (local).
@override@JsonKey() final  int reminderMinute;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.experience, experience) || other.experience == experience)&&const DeepCollectionEquality().equals(other.equipment, _equipment)&&(identical(other.trainingDaysPerWeek, trainingDaysPerWeek) || other.trainingDaysPerWeek == trainingDaysPerWeek)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.moveGoalKcal, moveGoalKcal) || other.moveGoalKcal == moveGoalKcal)&&(identical(other.exerciseGoalMin, exerciseGoalMin) || other.exerciseGoalMin == exerciseGoalMin)&&(identical(other.stepsGoal, stepsGoal) || other.stepsGoal == stepsGoal)&&(identical(other.waterGoalMl, waterGoalMl) || other.waterGoalMl == waterGoalMl)&&(identical(other.onboardingComplete, onboardingComplete) || other.onboardingComplete == onboardingComplete)&&(identical(other.xp, xp) || other.xp == xp)&&const DeepCollectionEquality().equals(other.dashboardCards, _dashboardCards)&&(identical(other.remindersEnabled, remindersEnabled) || other.remindersEnabled == remindersEnabled)&&(identical(other.reminderMinute, reminderMinute) || other.reminderMinute == reminderMinute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,displayName,avatarPath,goal,experience,const DeepCollectionEquality().hash(_equipment),trainingDaysPerWeek,heightCm,weightKg,birthYear,sex,weightUnit,distanceUnit,themeMode,moveGoalKcal,exerciseGoalMin,stepsGoal,waterGoalMl,onboardingComplete,xp,const DeepCollectionEquality().hash(_dashboardCards),remindersEnabled,reminderMinute]);
}

@override
String toString() {
    return 'UserProfile(id: $id, displayName: $displayName, avatarPath: $avatarPath, goal: $goal, experience: $experience, equipment: $equipment, trainingDaysPerWeek: $trainingDaysPerWeek, heightCm: $heightCm, weightKg: $weightKg, birthYear: $birthYear, sex: $sex, weightUnit: $weightUnit, distanceUnit: $distanceUnit, themeMode: $themeMode, moveGoalKcal: $moveGoalKcal, exerciseGoalMin: $exerciseGoalMin, stepsGoal: $stepsGoal, waterGoalMl: $waterGoalMl, onboardingComplete: $onboardingComplete, xp: $xp, dashboardCards: $dashboardCards, remindersEnabled: $remindersEnabled, reminderMinute: $reminderMinute)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String? displayName, String? avatarPath, TrainingGoal? goal, ExperienceLevel? experience, List<Equipment> equipment, int? trainingDaysPerWeek, double? heightCm, double? weightKg, int? birthYear, Sex? sex, WeightUnit weightUnit, DistanceUnit distanceUnit, AppThemeMode themeMode, int moveGoalKcal, int exerciseGoalMin, int stepsGoal, int waterGoalMl, bool onboardingComplete, int xp, List<String> dashboardCards, bool remindersEnabled, int reminderMinute
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = freezed,Object? avatarPath = freezed,Object? goal = freezed,Object? experience = freezed,Object? equipment = null,Object? trainingDaysPerWeek = freezed,Object? heightCm = freezed,Object? weightKg = freezed,Object? birthYear = freezed,Object? sex = freezed,Object? weightUnit = null,Object? distanceUnit = null,Object? themeMode = null,Object? moveGoalKcal = null,Object? exerciseGoalMin = null,Object? stepsGoal = null,Object? waterGoalMl = null,Object? onboardingComplete = null,Object? xp = null,Object? dashboardCards = null,Object? remindersEnabled = null,Object? reminderMinute = null,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as TrainingGoal?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as ExperienceLevel?,equipment: null == equipment ? _self._equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<Equipment>,trainingDaysPerWeek: freezed == trainingDaysPerWeek ? _self.trainingDaysPerWeek : trainingDaysPerWeek // ignore: cast_nullable_to_non_nullable
as int?,heightCm: freezed == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,sex: freezed == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex?,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as WeightUnit,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,moveGoalKcal: null == moveGoalKcal ? _self.moveGoalKcal : moveGoalKcal // ignore: cast_nullable_to_non_nullable
as int,exerciseGoalMin: null == exerciseGoalMin ? _self.exerciseGoalMin : exerciseGoalMin // ignore: cast_nullable_to_non_nullable
as int,stepsGoal: null == stepsGoal ? _self.stepsGoal : stepsGoal // ignore: cast_nullable_to_non_nullable
as int,waterGoalMl: null == waterGoalMl ? _self.waterGoalMl : waterGoalMl // ignore: cast_nullable_to_non_nullable
as int,onboardingComplete: null == onboardingComplete ? _self.onboardingComplete : onboardingComplete // ignore: cast_nullable_to_non_nullable
as bool,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,dashboardCards: null == dashboardCards ? _self._dashboardCards : dashboardCards // ignore: cast_nullable_to_non_nullable
as List<String>,remindersEnabled: null == remindersEnabled ? _self.remindersEnabled : remindersEnabled // ignore: cast_nullable_to_non_nullable
as bool,reminderMinute: null == reminderMinute ? _self.reminderMinute : reminderMinute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
