// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planned_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlannedExercise {

 String get exerciseId; int get sets; int get reps;/// Upper end of a rep range (null for a fixed rep target).
 int? get repsMax; int get restSeconds;/// Exercises sharing a group number are done as a superset/circuit.
 int? get supersetGroup; String? get notes;
/// Create a copy of PlannedExercise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlannedExerciseCopyWith<PlannedExercise> get copyWith => _$PlannedExerciseCopyWithImpl<PlannedExercise>(this as PlannedExercise, _$identity);

  /// Serializes this PlannedExercise to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlannedExercise;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlannedExercise&&(identical(other.exerciseId, _this.exerciseId) || other.exerciseId == _this.exerciseId)&&(identical(other.sets, _this.sets) || other.sets == _this.sets)&&(identical(other.reps, _this.reps) || other.reps == _this.reps)&&(identical(other.repsMax, _this.repsMax) || other.repsMax == _this.repsMax)&&(identical(other.restSeconds, _this.restSeconds) || other.restSeconds == _this.restSeconds)&&(identical(other.supersetGroup, _this.supersetGroup) || other.supersetGroup == _this.supersetGroup)&&(identical(other.notes, _this.notes) || other.notes == _this.notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlannedExercise;
  return Object.hash(runtimeType,_this.exerciseId,_this.sets,_this.reps,_this.repsMax,_this.restSeconds,_this.supersetGroup,_this.notes);
}

@override
String toString() {
  final _this = this as PlannedExercise;
  return 'PlannedExercise(exerciseId: ${_this.exerciseId}, sets: ${_this.sets}, reps: ${_this.reps}, repsMax: ${_this.repsMax}, restSeconds: ${_this.restSeconds}, supersetGroup: ${_this.supersetGroup}, notes: ${_this.notes})';
}


}

/// @nodoc
abstract mixin class $PlannedExerciseCopyWith<$Res>  {
  factory $PlannedExerciseCopyWith(PlannedExercise value, $Res Function(PlannedExercise) _then) = _$PlannedExerciseCopyWithImpl;
@useResult
$Res call({
 String exerciseId, int sets, int reps, int? repsMax, int restSeconds, int? supersetGroup, String? notes
});




}
/// @nodoc
class _$PlannedExerciseCopyWithImpl<$Res>
    implements $PlannedExerciseCopyWith<$Res> {
  _$PlannedExerciseCopyWithImpl(this._self, this._then);

  final PlannedExercise _self;
  final $Res Function(PlannedExercise) _then;

/// Create a copy of PlannedExercise
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exerciseId = null,Object? sets = null,Object? reps = null,Object? repsMax = freezed,Object? restSeconds = null,Object? supersetGroup = freezed,Object? notes = freezed,}) {
  return _then(PlannedExercise(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,repsMax: freezed == repsMax ? _self.repsMax : repsMax // ignore: cast_nullable_to_non_nullable
as int?,restSeconds: null == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int,supersetGroup: freezed == supersetGroup ? _self.supersetGroup : supersetGroup // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlannedExercise].
extension PlannedExercisePatterns on PlannedExercise {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlannedExercise value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlannedExercise() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlannedExercise value)  $default,){
final _that = this;
switch (_that) {
case _PlannedExercise():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlannedExercise value)?  $default,){
final _that = this;
switch (_that) {
case _PlannedExercise() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exerciseId,  int sets,  int reps,  int? repsMax,  int restSeconds,  int? supersetGroup,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlannedExercise() when $default != null:
return $default(_that.exerciseId,_that.sets,_that.reps,_that.repsMax,_that.restSeconds,_that.supersetGroup,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exerciseId,  int sets,  int reps,  int? repsMax,  int restSeconds,  int? supersetGroup,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _PlannedExercise():
return $default(_that.exerciseId,_that.sets,_that.reps,_that.repsMax,_that.restSeconds,_that.supersetGroup,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exerciseId,  int sets,  int reps,  int? repsMax,  int restSeconds,  int? supersetGroup,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _PlannedExercise() when $default != null:
return $default(_that.exerciseId,_that.sets,_that.reps,_that.repsMax,_that.restSeconds,_that.supersetGroup,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlannedExercise implements PlannedExercise {
  const _PlannedExercise({required this.exerciseId, this.sets = 3, this.reps = 10, this.repsMax, this.restSeconds = 90, this.supersetGroup, this.notes});
  factory _PlannedExercise.fromJson(Map<String, dynamic> json) => _$PlannedExerciseFromJson(json);

@override final  String exerciseId;
@override@JsonKey() final  int sets;
@override@JsonKey() final  int reps;
/// Upper end of a rep range (null for a fixed rep target).
@override final  int? repsMax;
@override@JsonKey() final  int restSeconds;
/// Exercises sharing a group number are done as a superset/circuit.
@override final  int? supersetGroup;
@override final  String? notes;

/// Create a copy of PlannedExercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlannedExerciseCopyWith<_PlannedExercise> get copyWith => __$PlannedExerciseCopyWithImpl<_PlannedExercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlannedExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlannedExercise&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.repsMax, repsMax) || other.repsMax == repsMax)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds)&&(identical(other.supersetGroup, supersetGroup) || other.supersetGroup == supersetGroup)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,exerciseId,sets,reps,repsMax,restSeconds,supersetGroup,notes);
}

@override
String toString() {
    return 'PlannedExercise(exerciseId: $exerciseId, sets: $sets, reps: $reps, repsMax: $repsMax, restSeconds: $restSeconds, supersetGroup: $supersetGroup, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$PlannedExerciseCopyWith<$Res> implements $PlannedExerciseCopyWith<$Res> {
  factory _$PlannedExerciseCopyWith(_PlannedExercise value, $Res Function(_PlannedExercise) _then) = __$PlannedExerciseCopyWithImpl;
@override @useResult
$Res call({
 String exerciseId, int sets, int reps, int? repsMax, int restSeconds, int? supersetGroup, String? notes
});




}
/// @nodoc
class __$PlannedExerciseCopyWithImpl<$Res>
    implements _$PlannedExerciseCopyWith<$Res> {
  __$PlannedExerciseCopyWithImpl(this._self, this._then);

  final _PlannedExercise _self;
  final $Res Function(_PlannedExercise) _then;

/// Create a copy of PlannedExercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exerciseId = null,Object? sets = null,Object? reps = null,Object? repsMax = freezed,Object? restSeconds = null,Object? supersetGroup = freezed,Object? notes = freezed,}) {
  return _then(_PlannedExercise(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,repsMax: freezed == repsMax ? _self.repsMax : repsMax // ignore: cast_nullable_to_non_nullable
as int?,restSeconds: null == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int,supersetGroup: freezed == supersetGroup ? _self.supersetGroup : supersetGroup // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
