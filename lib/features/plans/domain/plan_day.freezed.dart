// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanDay {

 String get id; String get name;/// ISO weekday 1 (Mon) … 7 (Sun) when pinned to a day of the week.
 int? get weekday; List<PlannedExercise> get exercises;
/// Create a copy of PlanDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanDayCopyWith<PlanDay> get copyWith => _$PlanDayCopyWithImpl<PlanDay>(this as PlanDay, _$identity);

  /// Serializes this PlanDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanDay;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanDay&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.weekday, _this.weekday) || other.weekday == _this.weekday)&&const DeepCollectionEquality().equals(other.exercises, _this.exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanDay;
  return Object.hash(runtimeType,_this.id,_this.name,_this.weekday,const DeepCollectionEquality().hash(_this.exercises));
}

@override
String toString() {
  final _this = this as PlanDay;
  return 'PlanDay(id: ${_this.id}, name: ${_this.name}, weekday: ${_this.weekday}, exercises: ${_this.exercises})';
}


}

/// @nodoc
abstract mixin class $PlanDayCopyWith<$Res>  {
  factory $PlanDayCopyWith(PlanDay value, $Res Function(PlanDay) _then) = _$PlanDayCopyWithImpl;
@useResult
$Res call({
 String id, String name, int? weekday, List<PlannedExercise> exercises
});




}
/// @nodoc
class _$PlanDayCopyWithImpl<$Res>
    implements $PlanDayCopyWith<$Res> {
  _$PlanDayCopyWithImpl(this._self, this._then);

  final PlanDay _self;
  final $Res Function(PlanDay) _then;

/// Create a copy of PlanDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? weekday = freezed,Object? exercises = null,}) {
  return _then(PlanDay(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,weekday: freezed == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as int?,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<PlannedExercise>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanDay].
extension PlanDayPatterns on PlanDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanDay value)  $default,){
final _that = this;
switch (_that) {
case _PlanDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanDay value)?  $default,){
final _that = this;
switch (_that) {
case _PlanDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int? weekday,  List<PlannedExercise> exercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanDay() when $default != null:
return $default(_that.id,_that.name,_that.weekday,_that.exercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int? weekday,  List<PlannedExercise> exercises)  $default,) {final _that = this;
switch (_that) {
case _PlanDay():
return $default(_that.id,_that.name,_that.weekday,_that.exercises);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int? weekday,  List<PlannedExercise> exercises)?  $default,) {final _that = this;
switch (_that) {
case _PlanDay() when $default != null:
return $default(_that.id,_that.name,_that.weekday,_that.exercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanDay implements PlanDay {
  const _PlanDay({required this.id, required this.name, this.weekday,  List<PlannedExercise> exercises = const <PlannedExercise>[]}): _exercises = exercises;
  factory _PlanDay.fromJson(Map<String, dynamic> json) => _$PlanDayFromJson(json);

@override final  String id;
@override final  String name;
/// ISO weekday 1 (Mon) … 7 (Sun) when pinned to a day of the week.
@override final  int? weekday;
 final  List<PlannedExercise> _exercises;
@override@JsonKey() List<PlannedExercise> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


/// Create a copy of PlanDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanDayCopyWith<_PlanDay> get copyWith => __$PlanDayCopyWithImpl<_PlanDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanDayToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanDay&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&const DeepCollectionEquality().equals(other.exercises, _exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,weekday,const DeepCollectionEquality().hash(_exercises));
}

@override
String toString() {
    return 'PlanDay(id: $id, name: $name, weekday: $weekday, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class _$PlanDayCopyWith<$Res> implements $PlanDayCopyWith<$Res> {
  factory _$PlanDayCopyWith(_PlanDay value, $Res Function(_PlanDay) _then) = __$PlanDayCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int? weekday, List<PlannedExercise> exercises
});




}
/// @nodoc
class __$PlanDayCopyWithImpl<$Res>
    implements _$PlanDayCopyWith<$Res> {
  __$PlanDayCopyWithImpl(this._self, this._then);

  final _PlanDay _self;
  final $Res Function(_PlanDay) _then;

/// Create a copy of PlanDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? weekday = freezed,Object? exercises = null,}) {
  return _then(_PlanDay(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,weekday: freezed == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as int?,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<PlannedExercise>,
  ));
}


}

// dart format on
