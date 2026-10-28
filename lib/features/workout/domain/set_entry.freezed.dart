// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetEntry {

 String get id; SetType get type; double? get weightKg; int? get reps; double? get rpe; int? get durationSec; double? get distanceM; DateTime? get completedAt;
/// Create a copy of SetEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetEntryCopyWith<SetEntry> get copyWith => _$SetEntryCopyWithImpl<SetEntry>(this as SetEntry, _$identity);

  /// Serializes this SetEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SetEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg)&&(identical(other.reps, _this.reps) || other.reps == _this.reps)&&(identical(other.rpe, _this.rpe) || other.rpe == _this.rpe)&&(identical(other.durationSec, _this.durationSec) || other.durationSec == _this.durationSec)&&(identical(other.distanceM, _this.distanceM) || other.distanceM == _this.distanceM)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SetEntry;
  return Object.hash(runtimeType,_this.id,_this.type,_this.weightKg,_this.reps,_this.rpe,_this.durationSec,_this.distanceM,_this.completedAt);
}

@override
String toString() {
  final _this = this as SetEntry;
  return 'SetEntry(id: ${_this.id}, type: ${_this.type}, weightKg: ${_this.weightKg}, reps: ${_this.reps}, rpe: ${_this.rpe}, durationSec: ${_this.durationSec}, distanceM: ${_this.distanceM}, completedAt: ${_this.completedAt})';
}


}

/// @nodoc
abstract mixin class $SetEntryCopyWith<$Res>  {
  factory $SetEntryCopyWith(SetEntry value, $Res Function(SetEntry) _then) = _$SetEntryCopyWithImpl;
@useResult
$Res call({
 String id, SetType type, double? weightKg, int? reps, double? rpe, int? durationSec, double? distanceM, DateTime? completedAt
});




}
/// @nodoc
class _$SetEntryCopyWithImpl<$Res>
    implements $SetEntryCopyWith<$Res> {
  _$SetEntryCopyWithImpl(this._self, this._then);

  final SetEntry _self;
  final $Res Function(SetEntry) _then;

/// Create a copy of SetEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? weightKg = freezed,Object? reps = freezed,Object? rpe = freezed,Object? durationSec = freezed,Object? distanceM = freezed,Object? completedAt = freezed,}) {
  return _then(SetEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SetType,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,reps: freezed == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int?,rpe: freezed == rpe ? _self.rpe : rpe // ignore: cast_nullable_to_non_nullable
as double?,durationSec: freezed == durationSec ? _self.durationSec : durationSec // ignore: cast_nullable_to_non_nullable
as int?,distanceM: freezed == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SetEntry].
extension SetEntryPatterns on SetEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetEntry value)  $default,){
final _that = this;
switch (_that) {
case _SetEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetEntry value)?  $default,){
final _that = this;
switch (_that) {
case _SetEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SetType type,  double? weightKg,  int? reps,  double? rpe,  int? durationSec,  double? distanceM,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetEntry() when $default != null:
return $default(_that.id,_that.type,_that.weightKg,_that.reps,_that.rpe,_that.durationSec,_that.distanceM,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SetType type,  double? weightKg,  int? reps,  double? rpe,  int? durationSec,  double? distanceM,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _SetEntry():
return $default(_that.id,_that.type,_that.weightKg,_that.reps,_that.rpe,_that.durationSec,_that.distanceM,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SetType type,  double? weightKg,  int? reps,  double? rpe,  int? durationSec,  double? distanceM,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _SetEntry() when $default != null:
return $default(_that.id,_that.type,_that.weightKg,_that.reps,_that.rpe,_that.durationSec,_that.distanceM,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetEntry extends SetEntry {
  const _SetEntry({required this.id, this.type = SetType.working, this.weightKg, this.reps, this.rpe, this.durationSec, this.distanceM, this.completedAt}): super._();
  factory _SetEntry.fromJson(Map<String, dynamic> json) => _$SetEntryFromJson(json);

@override final  String id;
@override@JsonKey() final  SetType type;
@override final  double? weightKg;
@override final  int? reps;
@override final  double? rpe;
@override final  int? durationSec;
@override final  double? distanceM;
@override final  DateTime? completedAt;

/// Create a copy of SetEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetEntryCopyWith<_SetEntry> get copyWith => __$SetEntryCopyWithImpl<_SetEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.rpe, rpe) || other.rpe == rpe)&&(identical(other.durationSec, durationSec) || other.durationSec == durationSec)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,weightKg,reps,rpe,durationSec,distanceM,completedAt);
}

@override
String toString() {
    return 'SetEntry(id: $id, type: $type, weightKg: $weightKg, reps: $reps, rpe: $rpe, durationSec: $durationSec, distanceM: $distanceM, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$SetEntryCopyWith<$Res> implements $SetEntryCopyWith<$Res> {
  factory _$SetEntryCopyWith(_SetEntry value, $Res Function(_SetEntry) _then) = __$SetEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, SetType type, double? weightKg, int? reps, double? rpe, int? durationSec, double? distanceM, DateTime? completedAt
});




}
/// @nodoc
class __$SetEntryCopyWithImpl<$Res>
    implements _$SetEntryCopyWith<$Res> {
  __$SetEntryCopyWithImpl(this._self, this._then);

  final _SetEntry _self;
  final $Res Function(_SetEntry) _then;

/// Create a copy of SetEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? weightKg = freezed,Object? reps = freezed,Object? rpe = freezed,Object? durationSec = freezed,Object? distanceM = freezed,Object? completedAt = freezed,}) {
  return _then(_SetEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SetType,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,reps: freezed == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int?,rpe: freezed == rpe ? _self.rpe : rpe // ignore: cast_nullable_to_non_nullable
as double?,durationSec: freezed == durationSec ? _self.durationSec : durationSec // ignore: cast_nullable_to_non_nullable
as int?,distanceM: freezed == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
