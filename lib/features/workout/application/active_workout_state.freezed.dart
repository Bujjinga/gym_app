// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_workout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveWorkoutState {

 WorkoutSession get session;/// Exercise details by id, for names and muscles.
 Map<String, Exercise> get exercises;/// Previous performance by exercise id ("last time: 60 kg × 8").
 Map<String, List<SetEntry>> get lastTime; DateTime? get restEndsAt; Duration get restTotal; bool get keepAwake;/// Logged after the fact (desktop): no rest timer, editable start/duration.
 bool get manual; Duration get manualDuration;
/// Create a copy of ActiveWorkoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveWorkoutStateCopyWith<ActiveWorkoutState> get copyWith => _$ActiveWorkoutStateCopyWithImpl<ActiveWorkoutState>(this as ActiveWorkoutState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ActiveWorkoutState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveWorkoutState&&(identical(other.session, _this.session) || other.session == _this.session)&&const DeepCollectionEquality().equals(other.exercises, _this.exercises)&&const DeepCollectionEquality().equals(other.lastTime, _this.lastTime)&&(identical(other.restEndsAt, _this.restEndsAt) || other.restEndsAt == _this.restEndsAt)&&(identical(other.restTotal, _this.restTotal) || other.restTotal == _this.restTotal)&&(identical(other.keepAwake, _this.keepAwake) || other.keepAwake == _this.keepAwake)&&(identical(other.manual, _this.manual) || other.manual == _this.manual)&&(identical(other.manualDuration, _this.manualDuration) || other.manualDuration == _this.manualDuration));
}


@override
int get hashCode {
  final _this = this as ActiveWorkoutState;
  return Object.hash(runtimeType,_this.session,const DeepCollectionEquality().hash(_this.exercises),const DeepCollectionEquality().hash(_this.lastTime),_this.restEndsAt,_this.restTotal,_this.keepAwake,_this.manual,_this.manualDuration);
}

@override
String toString() {
  final _this = this as ActiveWorkoutState;
  return 'ActiveWorkoutState(session: ${_this.session}, exercises: ${_this.exercises}, lastTime: ${_this.lastTime}, restEndsAt: ${_this.restEndsAt}, restTotal: ${_this.restTotal}, keepAwake: ${_this.keepAwake}, manual: ${_this.manual}, manualDuration: ${_this.manualDuration})';
}


}

/// @nodoc
abstract mixin class $ActiveWorkoutStateCopyWith<$Res>  {
  factory $ActiveWorkoutStateCopyWith(ActiveWorkoutState value, $Res Function(ActiveWorkoutState) _then) = _$ActiveWorkoutStateCopyWithImpl;
@useResult
$Res call({
 WorkoutSession session, Map<String, Exercise> exercises, Map<String, List<SetEntry>> lastTime, DateTime? restEndsAt, Duration restTotal, bool keepAwake, bool manual, Duration manualDuration
});


$WorkoutSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$ActiveWorkoutStateCopyWithImpl<$Res>
    implements $ActiveWorkoutStateCopyWith<$Res> {
  _$ActiveWorkoutStateCopyWithImpl(this._self, this._then);

  final ActiveWorkoutState _self;
  final $Res Function(ActiveWorkoutState) _then;

/// Create a copy of ActiveWorkoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? exercises = null,Object? lastTime = null,Object? restEndsAt = freezed,Object? restTotal = null,Object? keepAwake = null,Object? manual = null,Object? manualDuration = null,}) {
  return _then(ActiveWorkoutState(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSession,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as Map<String, Exercise>,lastTime: null == lastTime ? _self.lastTime : lastTime // ignore: cast_nullable_to_non_nullable
as Map<String, List<SetEntry>>,restEndsAt: freezed == restEndsAt ? _self.restEndsAt : restEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,restTotal: null == restTotal ? _self.restTotal : restTotal // ignore: cast_nullable_to_non_nullable
as Duration,keepAwake: null == keepAwake ? _self.keepAwake : keepAwake // ignore: cast_nullable_to_non_nullable
as bool,manual: null == manual ? _self.manual : manual // ignore: cast_nullable_to_non_nullable
as bool,manualDuration: null == manualDuration ? _self.manualDuration : manualDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}
/// Create a copy of ActiveWorkoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutSessionCopyWith<$Res> get session {
  
  return $WorkoutSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActiveWorkoutState].
extension ActiveWorkoutStatePatterns on ActiveWorkoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveWorkoutState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveWorkoutState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveWorkoutState value)  $default,){
final _that = this;
switch (_that) {
case _ActiveWorkoutState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveWorkoutState value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveWorkoutState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkoutSession session,  Map<String, Exercise> exercises,  Map<String, List<SetEntry>> lastTime,  DateTime? restEndsAt,  Duration restTotal,  bool keepAwake,  bool manual,  Duration manualDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveWorkoutState() when $default != null:
return $default(_that.session,_that.exercises,_that.lastTime,_that.restEndsAt,_that.restTotal,_that.keepAwake,_that.manual,_that.manualDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkoutSession session,  Map<String, Exercise> exercises,  Map<String, List<SetEntry>> lastTime,  DateTime? restEndsAt,  Duration restTotal,  bool keepAwake,  bool manual,  Duration manualDuration)  $default,) {final _that = this;
switch (_that) {
case _ActiveWorkoutState():
return $default(_that.session,_that.exercises,_that.lastTime,_that.restEndsAt,_that.restTotal,_that.keepAwake,_that.manual,_that.manualDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkoutSession session,  Map<String, Exercise> exercises,  Map<String, List<SetEntry>> lastTime,  DateTime? restEndsAt,  Duration restTotal,  bool keepAwake,  bool manual,  Duration manualDuration)?  $default,) {final _that = this;
switch (_that) {
case _ActiveWorkoutState() when $default != null:
return $default(_that.session,_that.exercises,_that.lastTime,_that.restEndsAt,_that.restTotal,_that.keepAwake,_that.manual,_that.manualDuration);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveWorkoutState implements ActiveWorkoutState {
  const _ActiveWorkoutState({required this.session,  Map<String, Exercise> exercises = const <String, Exercise>{},  Map<String, List<SetEntry>> lastTime = const <String, List<SetEntry>>{}, this.restEndsAt, this.restTotal = Duration.zero, this.keepAwake = false, this.manual = false, this.manualDuration = const Duration(minutes: 60)}): _exercises = exercises,_lastTime = lastTime;
  

@override final  WorkoutSession session;
/// Exercise details by id, for names and muscles.
 final  Map<String, Exercise> _exercises;
/// Exercise details by id, for names and muscles.
@override@JsonKey() Map<String, Exercise> get exercises {
  if (_exercises is EqualUnmodifiableMapView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_exercises);
}

/// Previous performance by exercise id ("last time: 60 kg × 8").
 final  Map<String, List<SetEntry>> _lastTime;
/// Previous performance by exercise id ("last time: 60 kg × 8").
@override@JsonKey() Map<String, List<SetEntry>> get lastTime {
  if (_lastTime is EqualUnmodifiableMapView) return _lastTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_lastTime);
}

@override final  DateTime? restEndsAt;
@override@JsonKey() final  Duration restTotal;
@override@JsonKey() final  bool keepAwake;
/// Logged after the fact (desktop): no rest timer, editable start/duration.
@override@JsonKey() final  bool manual;
@override@JsonKey() final  Duration manualDuration;

/// Create a copy of ActiveWorkoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveWorkoutStateCopyWith<_ActiveWorkoutState> get copyWith => __$ActiveWorkoutStateCopyWithImpl<_ActiveWorkoutState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveWorkoutState&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other.exercises, _exercises)&&const DeepCollectionEquality().equals(other.lastTime, _lastTime)&&(identical(other.restEndsAt, restEndsAt) || other.restEndsAt == restEndsAt)&&(identical(other.restTotal, restTotal) || other.restTotal == restTotal)&&(identical(other.keepAwake, keepAwake) || other.keepAwake == keepAwake)&&(identical(other.manual, manual) || other.manual == manual)&&(identical(other.manualDuration, manualDuration) || other.manualDuration == manualDuration));
}


@override
int get hashCode {
    return Object.hash(runtimeType,session,const DeepCollectionEquality().hash(_exercises),const DeepCollectionEquality().hash(_lastTime),restEndsAt,restTotal,keepAwake,manual,manualDuration);
}

@override
String toString() {
    return 'ActiveWorkoutState(session: $session, exercises: $exercises, lastTime: $lastTime, restEndsAt: $restEndsAt, restTotal: $restTotal, keepAwake: $keepAwake, manual: $manual, manualDuration: $manualDuration)';
}


}

/// @nodoc
abstract mixin class _$ActiveWorkoutStateCopyWith<$Res> implements $ActiveWorkoutStateCopyWith<$Res> {
  factory _$ActiveWorkoutStateCopyWith(_ActiveWorkoutState value, $Res Function(_ActiveWorkoutState) _then) = __$ActiveWorkoutStateCopyWithImpl;
@override @useResult
$Res call({
 WorkoutSession session, Map<String, Exercise> exercises, Map<String, List<SetEntry>> lastTime, DateTime? restEndsAt, Duration restTotal, bool keepAwake, bool manual, Duration manualDuration
});


@override $WorkoutSessionCopyWith<$Res> get session;

}
/// @nodoc
class __$ActiveWorkoutStateCopyWithImpl<$Res>
    implements _$ActiveWorkoutStateCopyWith<$Res> {
  __$ActiveWorkoutStateCopyWithImpl(this._self, this._then);

  final _ActiveWorkoutState _self;
  final $Res Function(_ActiveWorkoutState) _then;

/// Create a copy of ActiveWorkoutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? exercises = null,Object? lastTime = null,Object? restEndsAt = freezed,Object? restTotal = null,Object? keepAwake = null,Object? manual = null,Object? manualDuration = null,}) {
  return _then(_ActiveWorkoutState(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSession,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as Map<String, Exercise>,lastTime: null == lastTime ? _self._lastTime : lastTime // ignore: cast_nullable_to_non_nullable
as Map<String, List<SetEntry>>,restEndsAt: freezed == restEndsAt ? _self.restEndsAt : restEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,restTotal: null == restTotal ? _self.restTotal : restTotal // ignore: cast_nullable_to_non_nullable
as Duration,keepAwake: null == keepAwake ? _self.keepAwake : keepAwake // ignore: cast_nullable_to_non_nullable
as bool,manual: null == manual ? _self.manual : manual // ignore: cast_nullable_to_non_nullable
as bool,manualDuration: null == manualDuration ? _self.manualDuration : manualDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

/// Create a copy of ActiveWorkoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutSessionCopyWith<$Res> get session {
  
  return $WorkoutSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
