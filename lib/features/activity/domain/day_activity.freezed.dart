// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DayActivity {

/// Local calendar day, `yyyy-MM-dd`.
 String get day; int get steps; double get distanceM; int get floors; double get activeKcal; int get exerciseMin; int? get restingHeartRate; int? get avgHeartRate; double? get hrvMs; double? get vo2Max; int? get sleepMinutes; ActivitySource get source;
/// Create a copy of DayActivity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayActivityCopyWith<DayActivity> get copyWith => _$DayActivityCopyWithImpl<DayActivity>(this as DayActivity, _$identity);

  /// Serializes this DayActivity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DayActivity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayActivity&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.steps, _this.steps) || other.steps == _this.steps)&&(identical(other.distanceM, _this.distanceM) || other.distanceM == _this.distanceM)&&(identical(other.floors, _this.floors) || other.floors == _this.floors)&&(identical(other.activeKcal, _this.activeKcal) || other.activeKcal == _this.activeKcal)&&(identical(other.exerciseMin, _this.exerciseMin) || other.exerciseMin == _this.exerciseMin)&&(identical(other.restingHeartRate, _this.restingHeartRate) || other.restingHeartRate == _this.restingHeartRate)&&(identical(other.avgHeartRate, _this.avgHeartRate) || other.avgHeartRate == _this.avgHeartRate)&&(identical(other.hrvMs, _this.hrvMs) || other.hrvMs == _this.hrvMs)&&(identical(other.vo2Max, _this.vo2Max) || other.vo2Max == _this.vo2Max)&&(identical(other.sleepMinutes, _this.sleepMinutes) || other.sleepMinutes == _this.sleepMinutes)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DayActivity;
  return Object.hash(runtimeType,_this.day,_this.steps,_this.distanceM,_this.floors,_this.activeKcal,_this.exerciseMin,_this.restingHeartRate,_this.avgHeartRate,_this.hrvMs,_this.vo2Max,_this.sleepMinutes,_this.source);
}

@override
String toString() {
  final _this = this as DayActivity;
  return 'DayActivity(day: ${_this.day}, steps: ${_this.steps}, distanceM: ${_this.distanceM}, floors: ${_this.floors}, activeKcal: ${_this.activeKcal}, exerciseMin: ${_this.exerciseMin}, restingHeartRate: ${_this.restingHeartRate}, avgHeartRate: ${_this.avgHeartRate}, hrvMs: ${_this.hrvMs}, vo2Max: ${_this.vo2Max}, sleepMinutes: ${_this.sleepMinutes}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $DayActivityCopyWith<$Res>  {
  factory $DayActivityCopyWith(DayActivity value, $Res Function(DayActivity) _then) = _$DayActivityCopyWithImpl;
@useResult
$Res call({
 String day, int steps, double distanceM, int floors, double activeKcal, int exerciseMin, int? restingHeartRate, int? avgHeartRate, double? hrvMs, double? vo2Max, int? sleepMinutes, ActivitySource source
});




}
/// @nodoc
class _$DayActivityCopyWithImpl<$Res>
    implements $DayActivityCopyWith<$Res> {
  _$DayActivityCopyWithImpl(this._self, this._then);

  final DayActivity _self;
  final $Res Function(DayActivity) _then;

/// Create a copy of DayActivity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? steps = null,Object? distanceM = null,Object? floors = null,Object? activeKcal = null,Object? exerciseMin = null,Object? restingHeartRate = freezed,Object? avgHeartRate = freezed,Object? hrvMs = freezed,Object? vo2Max = freezed,Object? sleepMinutes = freezed,Object? source = null,}) {
  return _then(DayActivity(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,floors: null == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as int,activeKcal: null == activeKcal ? _self.activeKcal : activeKcal // ignore: cast_nullable_to_non_nullable
as double,exerciseMin: null == exerciseMin ? _self.exerciseMin : exerciseMin // ignore: cast_nullable_to_non_nullable
as int,restingHeartRate: freezed == restingHeartRate ? _self.restingHeartRate : restingHeartRate // ignore: cast_nullable_to_non_nullable
as int?,avgHeartRate: freezed == avgHeartRate ? _self.avgHeartRate : avgHeartRate // ignore: cast_nullable_to_non_nullable
as int?,hrvMs: freezed == hrvMs ? _self.hrvMs : hrvMs // ignore: cast_nullable_to_non_nullable
as double?,vo2Max: freezed == vo2Max ? _self.vo2Max : vo2Max // ignore: cast_nullable_to_non_nullable
as double?,sleepMinutes: freezed == sleepMinutes ? _self.sleepMinutes : sleepMinutes // ignore: cast_nullable_to_non_nullable
as int?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ActivitySource,
  ));
}

}


/// Adds pattern-matching-related methods to [DayActivity].
extension DayActivityPatterns on DayActivity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayActivity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayActivity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayActivity value)  $default,){
final _that = this;
switch (_that) {
case _DayActivity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayActivity value)?  $default,){
final _that = this;
switch (_that) {
case _DayActivity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String day,  int steps,  double distanceM,  int floors,  double activeKcal,  int exerciseMin,  int? restingHeartRate,  int? avgHeartRate,  double? hrvMs,  double? vo2Max,  int? sleepMinutes,  ActivitySource source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayActivity() when $default != null:
return $default(_that.day,_that.steps,_that.distanceM,_that.floors,_that.activeKcal,_that.exerciseMin,_that.restingHeartRate,_that.avgHeartRate,_that.hrvMs,_that.vo2Max,_that.sleepMinutes,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String day,  int steps,  double distanceM,  int floors,  double activeKcal,  int exerciseMin,  int? restingHeartRate,  int? avgHeartRate,  double? hrvMs,  double? vo2Max,  int? sleepMinutes,  ActivitySource source)  $default,) {final _that = this;
switch (_that) {
case _DayActivity():
return $default(_that.day,_that.steps,_that.distanceM,_that.floors,_that.activeKcal,_that.exerciseMin,_that.restingHeartRate,_that.avgHeartRate,_that.hrvMs,_that.vo2Max,_that.sleepMinutes,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String day,  int steps,  double distanceM,  int floors,  double activeKcal,  int exerciseMin,  int? restingHeartRate,  int? avgHeartRate,  double? hrvMs,  double? vo2Max,  int? sleepMinutes,  ActivitySource source)?  $default,) {final _that = this;
switch (_that) {
case _DayActivity() when $default != null:
return $default(_that.day,_that.steps,_that.distanceM,_that.floors,_that.activeKcal,_that.exerciseMin,_that.restingHeartRate,_that.avgHeartRate,_that.hrvMs,_that.vo2Max,_that.sleepMinutes,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayActivity implements DayActivity {
  const _DayActivity({required this.day, this.steps = 0, this.distanceM = 0, this.floors = 0, this.activeKcal = 0, this.exerciseMin = 0, this.restingHeartRate, this.avgHeartRate, this.hrvMs, this.vo2Max, this.sleepMinutes, this.source = ActivitySource.device});
  factory _DayActivity.fromJson(Map<String, dynamic> json) => _$DayActivityFromJson(json);

/// Local calendar day, `yyyy-MM-dd`.
@override final  String day;
@override@JsonKey() final  int steps;
@override@JsonKey() final  double distanceM;
@override@JsonKey() final  int floors;
@override@JsonKey() final  double activeKcal;
@override@JsonKey() final  int exerciseMin;
@override final  int? restingHeartRate;
@override final  int? avgHeartRate;
@override final  double? hrvMs;
@override final  double? vo2Max;
@override final  int? sleepMinutes;
@override@JsonKey() final  ActivitySource source;

/// Create a copy of DayActivity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayActivityCopyWith<_DayActivity> get copyWith => __$DayActivityCopyWithImpl<_DayActivity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayActivityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayActivity&&(identical(other.day, day) || other.day == day)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.activeKcal, activeKcal) || other.activeKcal == activeKcal)&&(identical(other.exerciseMin, exerciseMin) || other.exerciseMin == exerciseMin)&&(identical(other.restingHeartRate, restingHeartRate) || other.restingHeartRate == restingHeartRate)&&(identical(other.avgHeartRate, avgHeartRate) || other.avgHeartRate == avgHeartRate)&&(identical(other.hrvMs, hrvMs) || other.hrvMs == hrvMs)&&(identical(other.vo2Max, vo2Max) || other.vo2Max == vo2Max)&&(identical(other.sleepMinutes, sleepMinutes) || other.sleepMinutes == sleepMinutes)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,day,steps,distanceM,floors,activeKcal,exerciseMin,restingHeartRate,avgHeartRate,hrvMs,vo2Max,sleepMinutes,source);
}

@override
String toString() {
    return 'DayActivity(day: $day, steps: $steps, distanceM: $distanceM, floors: $floors, activeKcal: $activeKcal, exerciseMin: $exerciseMin, restingHeartRate: $restingHeartRate, avgHeartRate: $avgHeartRate, hrvMs: $hrvMs, vo2Max: $vo2Max, sleepMinutes: $sleepMinutes, source: $source)';
}


}

/// @nodoc
abstract mixin class _$DayActivityCopyWith<$Res> implements $DayActivityCopyWith<$Res> {
  factory _$DayActivityCopyWith(_DayActivity value, $Res Function(_DayActivity) _then) = __$DayActivityCopyWithImpl;
@override @useResult
$Res call({
 String day, int steps, double distanceM, int floors, double activeKcal, int exerciseMin, int? restingHeartRate, int? avgHeartRate, double? hrvMs, double? vo2Max, int? sleepMinutes, ActivitySource source
});




}
/// @nodoc
class __$DayActivityCopyWithImpl<$Res>
    implements _$DayActivityCopyWith<$Res> {
  __$DayActivityCopyWithImpl(this._self, this._then);

  final _DayActivity _self;
  final $Res Function(_DayActivity) _then;

/// Create a copy of DayActivity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? steps = null,Object? distanceM = null,Object? floors = null,Object? activeKcal = null,Object? exerciseMin = null,Object? restingHeartRate = freezed,Object? avgHeartRate = freezed,Object? hrvMs = freezed,Object? vo2Max = freezed,Object? sleepMinutes = freezed,Object? source = null,}) {
  return _then(_DayActivity(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,floors: null == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as int,activeKcal: null == activeKcal ? _self.activeKcal : activeKcal // ignore: cast_nullable_to_non_nullable
as double,exerciseMin: null == exerciseMin ? _self.exerciseMin : exerciseMin // ignore: cast_nullable_to_non_nullable
as int,restingHeartRate: freezed == restingHeartRate ? _self.restingHeartRate : restingHeartRate // ignore: cast_nullable_to_non_nullable
as int?,avgHeartRate: freezed == avgHeartRate ? _self.avgHeartRate : avgHeartRate // ignore: cast_nullable_to_non_nullable
as int?,hrvMs: freezed == hrvMs ? _self.hrvMs : hrvMs // ignore: cast_nullable_to_non_nullable
as double?,vo2Max: freezed == vo2Max ? _self.vo2Max : vo2Max // ignore: cast_nullable_to_non_nullable
as double?,sleepMinutes: freezed == sleepMinutes ? _self.sleepMinutes : sleepMinutes // ignore: cast_nullable_to_non_nullable
as int?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ActivitySource,
  ));
}


}

// dart format on
