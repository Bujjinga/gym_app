// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cardio_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackingState {

 String get sessionId; CardioType get type; bool get indoor; DateTime get startedAt; TrackingStatus get status; int get movingSeconds; double get distanceM; double get elevationGainM; int get steps; List<LatLng> get route; List<Duration> get splits; bool get audioCues;
/// Create a copy of TrackingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingStateCopyWith<TrackingState> get copyWith => _$TrackingStateCopyWithImpl<TrackingState>(this as TrackingState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TrackingState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingState&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.indoor, _this.indoor) || other.indoor == _this.indoor)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.movingSeconds, _this.movingSeconds) || other.movingSeconds == _this.movingSeconds)&&(identical(other.distanceM, _this.distanceM) || other.distanceM == _this.distanceM)&&(identical(other.elevationGainM, _this.elevationGainM) || other.elevationGainM == _this.elevationGainM)&&(identical(other.steps, _this.steps) || other.steps == _this.steps)&&const DeepCollectionEquality().equals(other.route, _this.route)&&const DeepCollectionEquality().equals(other.splits, _this.splits)&&(identical(other.audioCues, _this.audioCues) || other.audioCues == _this.audioCues));
}


@override
int get hashCode {
  final _this = this as TrackingState;
  return Object.hash(runtimeType,_this.sessionId,_this.type,_this.indoor,_this.startedAt,_this.status,_this.movingSeconds,_this.distanceM,_this.elevationGainM,_this.steps,const DeepCollectionEquality().hash(_this.route),const DeepCollectionEquality().hash(_this.splits),_this.audioCues);
}

@override
String toString() {
  final _this = this as TrackingState;
  return 'TrackingState(sessionId: ${_this.sessionId}, type: ${_this.type}, indoor: ${_this.indoor}, startedAt: ${_this.startedAt}, status: ${_this.status}, movingSeconds: ${_this.movingSeconds}, distanceM: ${_this.distanceM}, elevationGainM: ${_this.elevationGainM}, steps: ${_this.steps}, route: ${_this.route}, splits: ${_this.splits}, audioCues: ${_this.audioCues})';
}


}

/// @nodoc
abstract mixin class $TrackingStateCopyWith<$Res>  {
  factory $TrackingStateCopyWith(TrackingState value, $Res Function(TrackingState) _then) = _$TrackingStateCopyWithImpl;
@useResult
$Res call({
 String sessionId, CardioType type, bool indoor, DateTime startedAt, TrackingStatus status, int movingSeconds, double distanceM, double elevationGainM, int steps, List<LatLng> route, List<Duration> splits, bool audioCues
});




}
/// @nodoc
class _$TrackingStateCopyWithImpl<$Res>
    implements $TrackingStateCopyWith<$Res> {
  _$TrackingStateCopyWithImpl(this._self, this._then);

  final TrackingState _self;
  final $Res Function(TrackingState) _then;

/// Create a copy of TrackingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? type = null,Object? indoor = null,Object? startedAt = null,Object? status = null,Object? movingSeconds = null,Object? distanceM = null,Object? elevationGainM = null,Object? steps = null,Object? route = null,Object? splits = null,Object? audioCues = null,}) {
  return _then(TrackingState(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CardioType,indoor: null == indoor ? _self.indoor : indoor // ignore: cast_nullable_to_non_nullable
as bool,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TrackingStatus,movingSeconds: null == movingSeconds ? _self.movingSeconds : movingSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,elevationGainM: null == elevationGainM ? _self.elevationGainM : elevationGainM // ignore: cast_nullable_to_non_nullable
as double,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as List<LatLng>,splits: null == splits ? _self.splits : splits // ignore: cast_nullable_to_non_nullable
as List<Duration>,audioCues: null == audioCues ? _self.audioCues : audioCues // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingState].
extension TrackingStatePatterns on TrackingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingState value)  $default,){
final _that = this;
switch (_that) {
case _TrackingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingState value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  CardioType type,  bool indoor,  DateTime startedAt,  TrackingStatus status,  int movingSeconds,  double distanceM,  double elevationGainM,  int steps,  List<LatLng> route,  List<Duration> splits,  bool audioCues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingState() when $default != null:
return $default(_that.sessionId,_that.type,_that.indoor,_that.startedAt,_that.status,_that.movingSeconds,_that.distanceM,_that.elevationGainM,_that.steps,_that.route,_that.splits,_that.audioCues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  CardioType type,  bool indoor,  DateTime startedAt,  TrackingStatus status,  int movingSeconds,  double distanceM,  double elevationGainM,  int steps,  List<LatLng> route,  List<Duration> splits,  bool audioCues)  $default,) {final _that = this;
switch (_that) {
case _TrackingState():
return $default(_that.sessionId,_that.type,_that.indoor,_that.startedAt,_that.status,_that.movingSeconds,_that.distanceM,_that.elevationGainM,_that.steps,_that.route,_that.splits,_that.audioCues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  CardioType type,  bool indoor,  DateTime startedAt,  TrackingStatus status,  int movingSeconds,  double distanceM,  double elevationGainM,  int steps,  List<LatLng> route,  List<Duration> splits,  bool audioCues)?  $default,) {final _that = this;
switch (_that) {
case _TrackingState() when $default != null:
return $default(_that.sessionId,_that.type,_that.indoor,_that.startedAt,_that.status,_that.movingSeconds,_that.distanceM,_that.elevationGainM,_that.steps,_that.route,_that.splits,_that.audioCues);case _:
  return null;

}
}

}

/// @nodoc


class _TrackingState implements TrackingState {
  const _TrackingState({required this.sessionId, required this.type, required this.indoor, required this.startedAt, this.status = TrackingStatus.running, this.movingSeconds = 0, this.distanceM = 0, this.elevationGainM = 0, this.steps = 0,  List<LatLng> route = const <LatLng>[],  List<Duration> splits = const <Duration>[], this.audioCues = true}): _route = route,_splits = splits;
  

@override final  String sessionId;
@override final  CardioType type;
@override final  bool indoor;
@override final  DateTime startedAt;
@override@JsonKey() final  TrackingStatus status;
@override@JsonKey() final  int movingSeconds;
@override@JsonKey() final  double distanceM;
@override@JsonKey() final  double elevationGainM;
@override@JsonKey() final  int steps;
 final  List<LatLng> _route;
@override@JsonKey() List<LatLng> get route {
  if (_route is EqualUnmodifiableListView) return _route;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_route);
}

 final  List<Duration> _splits;
@override@JsonKey() List<Duration> get splits {
  if (_splits is EqualUnmodifiableListView) return _splits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_splits);
}

@override@JsonKey() final  bool audioCues;

/// Create a copy of TrackingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingStateCopyWith<_TrackingState> get copyWith => __$TrackingStateCopyWithImpl<_TrackingState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingState&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.indoor, indoor) || other.indoor == indoor)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.movingSeconds, movingSeconds) || other.movingSeconds == movingSeconds)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.elevationGainM, elevationGainM) || other.elevationGainM == elevationGainM)&&(identical(other.steps, steps) || other.steps == steps)&&const DeepCollectionEquality().equals(other.route, _route)&&const DeepCollectionEquality().equals(other.splits, _splits)&&(identical(other.audioCues, audioCues) || other.audioCues == audioCues));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sessionId,type,indoor,startedAt,status,movingSeconds,distanceM,elevationGainM,steps,const DeepCollectionEquality().hash(_route),const DeepCollectionEquality().hash(_splits),audioCues);
}

@override
String toString() {
    return 'TrackingState(sessionId: $sessionId, type: $type, indoor: $indoor, startedAt: $startedAt, status: $status, movingSeconds: $movingSeconds, distanceM: $distanceM, elevationGainM: $elevationGainM, steps: $steps, route: $route, splits: $splits, audioCues: $audioCues)';
}


}

/// @nodoc
abstract mixin class _$TrackingStateCopyWith<$Res> implements $TrackingStateCopyWith<$Res> {
  factory _$TrackingStateCopyWith(_TrackingState value, $Res Function(_TrackingState) _then) = __$TrackingStateCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, CardioType type, bool indoor, DateTime startedAt, TrackingStatus status, int movingSeconds, double distanceM, double elevationGainM, int steps, List<LatLng> route, List<Duration> splits, bool audioCues
});




}
/// @nodoc
class __$TrackingStateCopyWithImpl<$Res>
    implements _$TrackingStateCopyWith<$Res> {
  __$TrackingStateCopyWithImpl(this._self, this._then);

  final _TrackingState _self;
  final $Res Function(_TrackingState) _then;

/// Create a copy of TrackingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? type = null,Object? indoor = null,Object? startedAt = null,Object? status = null,Object? movingSeconds = null,Object? distanceM = null,Object? elevationGainM = null,Object? steps = null,Object? route = null,Object? splits = null,Object? audioCues = null,}) {
  return _then(_TrackingState(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CardioType,indoor: null == indoor ? _self.indoor : indoor // ignore: cast_nullable_to_non_nullable
as bool,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TrackingStatus,movingSeconds: null == movingSeconds ? _self.movingSeconds : movingSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,elevationGainM: null == elevationGainM ? _self.elevationGainM : elevationGainM // ignore: cast_nullable_to_non_nullable
as double,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,route: null == route ? _self._route : route // ignore: cast_nullable_to_non_nullable
as List<LatLng>,splits: null == splits ? _self._splits : splits // ignore: cast_nullable_to_non_nullable
as List<Duration>,audioCues: null == audioCues ? _self.audioCues : audioCues // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
