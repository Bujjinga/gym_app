// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cardio_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardioSession {

 String get id; CardioType get type; CardioSource get source; DateTime get startedAt; DateTime? get endedAt; int get durationSec; double get distanceM; double? get caloriesKcal; double? get elevationGainM; int? get avgHeartRate; int? get maxHeartRate; int? get steps; String? get notes;
/// Create a copy of CardioSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardioSessionCopyWith<CardioSession> get copyWith => _$CardioSessionCopyWithImpl<CardioSession>(this as CardioSession, _$identity);

  /// Serializes this CardioSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CardioSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardioSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.endedAt, _this.endedAt) || other.endedAt == _this.endedAt)&&(identical(other.durationSec, _this.durationSec) || other.durationSec == _this.durationSec)&&(identical(other.distanceM, _this.distanceM) || other.distanceM == _this.distanceM)&&(identical(other.caloriesKcal, _this.caloriesKcal) || other.caloriesKcal == _this.caloriesKcal)&&(identical(other.elevationGainM, _this.elevationGainM) || other.elevationGainM == _this.elevationGainM)&&(identical(other.avgHeartRate, _this.avgHeartRate) || other.avgHeartRate == _this.avgHeartRate)&&(identical(other.maxHeartRate, _this.maxHeartRate) || other.maxHeartRate == _this.maxHeartRate)&&(identical(other.steps, _this.steps) || other.steps == _this.steps)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CardioSession;
  return Object.hash(runtimeType,_this.id,_this.type,_this.source,_this.startedAt,_this.endedAt,_this.durationSec,_this.distanceM,_this.caloriesKcal,_this.elevationGainM,_this.avgHeartRate,_this.maxHeartRate,_this.steps,_this.notes);
}

@override
String toString() {
  final _this = this as CardioSession;
  return 'CardioSession(id: ${_this.id}, type: ${_this.type}, source: ${_this.source}, startedAt: ${_this.startedAt}, endedAt: ${_this.endedAt}, durationSec: ${_this.durationSec}, distanceM: ${_this.distanceM}, caloriesKcal: ${_this.caloriesKcal}, elevationGainM: ${_this.elevationGainM}, avgHeartRate: ${_this.avgHeartRate}, maxHeartRate: ${_this.maxHeartRate}, steps: ${_this.steps}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $CardioSessionCopyWith<$Res>  {
  factory $CardioSessionCopyWith(CardioSession value, $Res Function(CardioSession) _then) = _$CardioSessionCopyWithImpl;
@useResult
$Res call({
 String id, CardioType type, CardioSource source, DateTime startedAt, DateTime? endedAt, int durationSec, double distanceM, double? caloriesKcal, double? elevationGainM, int? avgHeartRate, int? maxHeartRate, int? steps, String? notes
});




}
/// @nodoc
class _$CardioSessionCopyWithImpl<$Res>
    implements $CardioSessionCopyWith<$Res> {
  _$CardioSessionCopyWithImpl(this._self, this._then);

  final CardioSession _self;
  final $Res Function(CardioSession) _then;

/// Create a copy of CardioSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? source = null,Object? startedAt = null,Object? endedAt = freezed,Object? durationSec = null,Object? distanceM = null,Object? caloriesKcal = freezed,Object? elevationGainM = freezed,Object? avgHeartRate = freezed,Object? maxHeartRate = freezed,Object? steps = freezed,Object? notes = freezed,}) {
  return _then(CardioSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CardioType,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as CardioSource,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationSec: null == durationSec ? _self.durationSec : durationSec // ignore: cast_nullable_to_non_nullable
as int,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,caloriesKcal: freezed == caloriesKcal ? _self.caloriesKcal : caloriesKcal // ignore: cast_nullable_to_non_nullable
as double?,elevationGainM: freezed == elevationGainM ? _self.elevationGainM : elevationGainM // ignore: cast_nullable_to_non_nullable
as double?,avgHeartRate: freezed == avgHeartRate ? _self.avgHeartRate : avgHeartRate // ignore: cast_nullable_to_non_nullable
as int?,maxHeartRate: freezed == maxHeartRate ? _self.maxHeartRate : maxHeartRate // ignore: cast_nullable_to_non_nullable
as int?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CardioSession].
extension CardioSessionPatterns on CardioSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardioSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardioSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardioSession value)  $default,){
final _that = this;
switch (_that) {
case _CardioSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardioSession value)?  $default,){
final _that = this;
switch (_that) {
case _CardioSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  CardioType type,  CardioSource source,  DateTime startedAt,  DateTime? endedAt,  int durationSec,  double distanceM,  double? caloriesKcal,  double? elevationGainM,  int? avgHeartRate,  int? maxHeartRate,  int? steps,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardioSession() when $default != null:
return $default(_that.id,_that.type,_that.source,_that.startedAt,_that.endedAt,_that.durationSec,_that.distanceM,_that.caloriesKcal,_that.elevationGainM,_that.avgHeartRate,_that.maxHeartRate,_that.steps,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  CardioType type,  CardioSource source,  DateTime startedAt,  DateTime? endedAt,  int durationSec,  double distanceM,  double? caloriesKcal,  double? elevationGainM,  int? avgHeartRate,  int? maxHeartRate,  int? steps,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CardioSession():
return $default(_that.id,_that.type,_that.source,_that.startedAt,_that.endedAt,_that.durationSec,_that.distanceM,_that.caloriesKcal,_that.elevationGainM,_that.avgHeartRate,_that.maxHeartRate,_that.steps,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  CardioType type,  CardioSource source,  DateTime startedAt,  DateTime? endedAt,  int durationSec,  double distanceM,  double? caloriesKcal,  double? elevationGainM,  int? avgHeartRate,  int? maxHeartRate,  int? steps,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CardioSession() when $default != null:
return $default(_that.id,_that.type,_that.source,_that.startedAt,_that.endedAt,_that.durationSec,_that.distanceM,_that.caloriesKcal,_that.elevationGainM,_that.avgHeartRate,_that.maxHeartRate,_that.steps,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardioSession implements CardioSession {
  const _CardioSession({required this.id, required this.type, required this.source, required this.startedAt, this.endedAt, this.durationSec = 0, this.distanceM = 0, this.caloriesKcal, this.elevationGainM, this.avgHeartRate, this.maxHeartRate, this.steps, this.notes});
  factory _CardioSession.fromJson(Map<String, dynamic> json) => _$CardioSessionFromJson(json);

@override final  String id;
@override final  CardioType type;
@override final  CardioSource source;
@override final  DateTime startedAt;
@override final  DateTime? endedAt;
@override@JsonKey() final  int durationSec;
@override@JsonKey() final  double distanceM;
@override final  double? caloriesKcal;
@override final  double? elevationGainM;
@override final  int? avgHeartRate;
@override final  int? maxHeartRate;
@override final  int? steps;
@override final  String? notes;

/// Create a copy of CardioSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardioSessionCopyWith<_CardioSession> get copyWith => __$CardioSessionCopyWithImpl<_CardioSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardioSessionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardioSession&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.source, source) || other.source == source)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.durationSec, durationSec) || other.durationSec == durationSec)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.caloriesKcal, caloriesKcal) || other.caloriesKcal == caloriesKcal)&&(identical(other.elevationGainM, elevationGainM) || other.elevationGainM == elevationGainM)&&(identical(other.avgHeartRate, avgHeartRate) || other.avgHeartRate == avgHeartRate)&&(identical(other.maxHeartRate, maxHeartRate) || other.maxHeartRate == maxHeartRate)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,source,startedAt,endedAt,durationSec,distanceM,caloriesKcal,elevationGainM,avgHeartRate,maxHeartRate,steps,notes);
}

@override
String toString() {
    return 'CardioSession(id: $id, type: $type, source: $source, startedAt: $startedAt, endedAt: $endedAt, durationSec: $durationSec, distanceM: $distanceM, caloriesKcal: $caloriesKcal, elevationGainM: $elevationGainM, avgHeartRate: $avgHeartRate, maxHeartRate: $maxHeartRate, steps: $steps, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CardioSessionCopyWith<$Res> implements $CardioSessionCopyWith<$Res> {
  factory _$CardioSessionCopyWith(_CardioSession value, $Res Function(_CardioSession) _then) = __$CardioSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, CardioType type, CardioSource source, DateTime startedAt, DateTime? endedAt, int durationSec, double distanceM, double? caloriesKcal, double? elevationGainM, int? avgHeartRate, int? maxHeartRate, int? steps, String? notes
});




}
/// @nodoc
class __$CardioSessionCopyWithImpl<$Res>
    implements _$CardioSessionCopyWith<$Res> {
  __$CardioSessionCopyWithImpl(this._self, this._then);

  final _CardioSession _self;
  final $Res Function(_CardioSession) _then;

/// Create a copy of CardioSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? source = null,Object? startedAt = null,Object? endedAt = freezed,Object? durationSec = null,Object? distanceM = null,Object? caloriesKcal = freezed,Object? elevationGainM = freezed,Object? avgHeartRate = freezed,Object? maxHeartRate = freezed,Object? steps = freezed,Object? notes = freezed,}) {
  return _then(_CardioSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CardioType,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as CardioSource,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationSec: null == durationSec ? _self.durationSec : durationSec // ignore: cast_nullable_to_non_nullable
as int,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,caloriesKcal: freezed == caloriesKcal ? _self.caloriesKcal : caloriesKcal // ignore: cast_nullable_to_non_nullable
as double?,elevationGainM: freezed == elevationGainM ? _self.elevationGainM : elevationGainM // ignore: cast_nullable_to_non_nullable
as double?,avgHeartRate: freezed == avgHeartRate ? _self.avgHeartRate : avgHeartRate // ignore: cast_nullable_to_non_nullable
as int?,maxHeartRate: freezed == maxHeartRate ? _self.maxHeartRate : maxHeartRate // ignore: cast_nullable_to_non_nullable
as int?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
