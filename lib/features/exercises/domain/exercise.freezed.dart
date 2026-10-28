// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Exercise {

 String get id; String get name; MuscleGroup get primaryMuscle; List<MuscleGroup> get secondaryMuscles; Equipment get equipment; Difficulty get difficulty; MovementPattern get movementPattern;/// Step-by-step form cues.
 List<String> get instructions; List<String> get mistakes; String? get animationAsset; bool get isCustom; bool get isFavorite;
/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseCopyWith<Exercise> get copyWith => _$ExerciseCopyWithImpl<Exercise>(this as Exercise, _$identity);

  /// Serializes this Exercise to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Exercise;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Exercise&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.primaryMuscle, _this.primaryMuscle) || other.primaryMuscle == _this.primaryMuscle)&&const DeepCollectionEquality().equals(other.secondaryMuscles, _this.secondaryMuscles)&&(identical(other.equipment, _this.equipment) || other.equipment == _this.equipment)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.movementPattern, _this.movementPattern) || other.movementPattern == _this.movementPattern)&&const DeepCollectionEquality().equals(other.instructions, _this.instructions)&&const DeepCollectionEquality().equals(other.mistakes, _this.mistakes)&&(identical(other.animationAsset, _this.animationAsset) || other.animationAsset == _this.animationAsset)&&(identical(other.isCustom, _this.isCustom) || other.isCustom == _this.isCustom)&&(identical(other.isFavorite, _this.isFavorite) || other.isFavorite == _this.isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Exercise;
  return Object.hash(runtimeType,_this.id,_this.name,_this.primaryMuscle,const DeepCollectionEquality().hash(_this.secondaryMuscles),_this.equipment,_this.difficulty,_this.movementPattern,const DeepCollectionEquality().hash(_this.instructions),const DeepCollectionEquality().hash(_this.mistakes),_this.animationAsset,_this.isCustom,_this.isFavorite);
}

@override
String toString() {
  final _this = this as Exercise;
  return 'Exercise(id: ${_this.id}, name: ${_this.name}, primaryMuscle: ${_this.primaryMuscle}, secondaryMuscles: ${_this.secondaryMuscles}, equipment: ${_this.equipment}, difficulty: ${_this.difficulty}, movementPattern: ${_this.movementPattern}, instructions: ${_this.instructions}, mistakes: ${_this.mistakes}, animationAsset: ${_this.animationAsset}, isCustom: ${_this.isCustom}, isFavorite: ${_this.isFavorite})';
}


}

/// @nodoc
abstract mixin class $ExerciseCopyWith<$Res>  {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) _then) = _$ExerciseCopyWithImpl;
@useResult
$Res call({
 String id, String name, MuscleGroup primaryMuscle, List<MuscleGroup> secondaryMuscles, Equipment equipment, Difficulty difficulty, MovementPattern movementPattern, List<String> instructions, List<String> mistakes, String? animationAsset, bool isCustom, bool isFavorite
});




}
/// @nodoc
class _$ExerciseCopyWithImpl<$Res>
    implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._self, this._then);

  final Exercise _self;
  final $Res Function(Exercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? primaryMuscle = null,Object? secondaryMuscles = null,Object? equipment = null,Object? difficulty = null,Object? movementPattern = null,Object? instructions = null,Object? mistakes = null,Object? animationAsset = freezed,Object? isCustom = null,Object? isFavorite = null,}) {
  return _then(Exercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primaryMuscle: null == primaryMuscle ? _self.primaryMuscle : primaryMuscle // ignore: cast_nullable_to_non_nullable
as MuscleGroup,secondaryMuscles: null == secondaryMuscles ? _self.secondaryMuscles : secondaryMuscles // ignore: cast_nullable_to_non_nullable
as List<MuscleGroup>,equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as Equipment,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,movementPattern: null == movementPattern ? _self.movementPattern : movementPattern // ignore: cast_nullable_to_non_nullable
as MovementPattern,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,mistakes: null == mistakes ? _self.mistakes : mistakes // ignore: cast_nullable_to_non_nullable
as List<String>,animationAsset: freezed == animationAsset ? _self.animationAsset : animationAsset // ignore: cast_nullable_to_non_nullable
as String?,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Exercise].
extension ExercisePatterns on Exercise {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Exercise value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Exercise() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Exercise value)  $default,){
final _that = this;
switch (_that) {
case _Exercise():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Exercise value)?  $default,){
final _that = this;
switch (_that) {
case _Exercise() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  MuscleGroup primaryMuscle,  List<MuscleGroup> secondaryMuscles,  Equipment equipment,  Difficulty difficulty,  MovementPattern movementPattern,  List<String> instructions,  List<String> mistakes,  String? animationAsset,  bool isCustom,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that.id,_that.name,_that.primaryMuscle,_that.secondaryMuscles,_that.equipment,_that.difficulty,_that.movementPattern,_that.instructions,_that.mistakes,_that.animationAsset,_that.isCustom,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  MuscleGroup primaryMuscle,  List<MuscleGroup> secondaryMuscles,  Equipment equipment,  Difficulty difficulty,  MovementPattern movementPattern,  List<String> instructions,  List<String> mistakes,  String? animationAsset,  bool isCustom,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _Exercise():
return $default(_that.id,_that.name,_that.primaryMuscle,_that.secondaryMuscles,_that.equipment,_that.difficulty,_that.movementPattern,_that.instructions,_that.mistakes,_that.animationAsset,_that.isCustom,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  MuscleGroup primaryMuscle,  List<MuscleGroup> secondaryMuscles,  Equipment equipment,  Difficulty difficulty,  MovementPattern movementPattern,  List<String> instructions,  List<String> mistakes,  String? animationAsset,  bool isCustom,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _Exercise() when $default != null:
return $default(_that.id,_that.name,_that.primaryMuscle,_that.secondaryMuscles,_that.equipment,_that.difficulty,_that.movementPattern,_that.instructions,_that.mistakes,_that.animationAsset,_that.isCustom,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Exercise implements Exercise {
  const _Exercise({required this.id, required this.name, required this.primaryMuscle,  List<MuscleGroup> secondaryMuscles = const <MuscleGroup>[], required this.equipment, required this.difficulty, required this.movementPattern,  List<String> instructions = const <String>[],  List<String> mistakes = const <String>[], this.animationAsset, this.isCustom = false, this.isFavorite = false}): _secondaryMuscles = secondaryMuscles,_instructions = instructions,_mistakes = mistakes;
  factory _Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

@override final  String id;
@override final  String name;
@override final  MuscleGroup primaryMuscle;
 final  List<MuscleGroup> _secondaryMuscles;
@override@JsonKey() List<MuscleGroup> get secondaryMuscles {
  if (_secondaryMuscles is EqualUnmodifiableListView) return _secondaryMuscles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secondaryMuscles);
}

@override final  Equipment equipment;
@override final  Difficulty difficulty;
@override final  MovementPattern movementPattern;
/// Step-by-step form cues.
 final  List<String> _instructions;
/// Step-by-step form cues.
@override@JsonKey() List<String> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}

 final  List<String> _mistakes;
@override@JsonKey() List<String> get mistakes {
  if (_mistakes is EqualUnmodifiableListView) return _mistakes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mistakes);
}

@override final  String? animationAsset;
@override@JsonKey() final  bool isCustom;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseCopyWith<_Exercise> get copyWith => __$ExerciseCopyWithImpl<_Exercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Exercise&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.primaryMuscle, primaryMuscle) || other.primaryMuscle == primaryMuscle)&&const DeepCollectionEquality().equals(other.secondaryMuscles, _secondaryMuscles)&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.movementPattern, movementPattern) || other.movementPattern == movementPattern)&&const DeepCollectionEquality().equals(other.instructions, _instructions)&&const DeepCollectionEquality().equals(other.mistakes, _mistakes)&&(identical(other.animationAsset, animationAsset) || other.animationAsset == animationAsset)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,primaryMuscle,const DeepCollectionEquality().hash(_secondaryMuscles),equipment,difficulty,movementPattern,const DeepCollectionEquality().hash(_instructions),const DeepCollectionEquality().hash(_mistakes),animationAsset,isCustom,isFavorite);
}

@override
String toString() {
    return 'Exercise(id: $id, name: $name, primaryMuscle: $primaryMuscle, secondaryMuscles: $secondaryMuscles, equipment: $equipment, difficulty: $difficulty, movementPattern: $movementPattern, instructions: $instructions, mistakes: $mistakes, animationAsset: $animationAsset, isCustom: $isCustom, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) _then) = __$ExerciseCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, MuscleGroup primaryMuscle, List<MuscleGroup> secondaryMuscles, Equipment equipment, Difficulty difficulty, MovementPattern movementPattern, List<String> instructions, List<String> mistakes, String? animationAsset, bool isCustom, bool isFavorite
});




}
/// @nodoc
class __$ExerciseCopyWithImpl<$Res>
    implements _$ExerciseCopyWith<$Res> {
  __$ExerciseCopyWithImpl(this._self, this._then);

  final _Exercise _self;
  final $Res Function(_Exercise) _then;

/// Create a copy of Exercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? primaryMuscle = null,Object? secondaryMuscles = null,Object? equipment = null,Object? difficulty = null,Object? movementPattern = null,Object? instructions = null,Object? mistakes = null,Object? animationAsset = freezed,Object? isCustom = null,Object? isFavorite = null,}) {
  return _then(_Exercise(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primaryMuscle: null == primaryMuscle ? _self.primaryMuscle : primaryMuscle // ignore: cast_nullable_to_non_nullable
as MuscleGroup,secondaryMuscles: null == secondaryMuscles ? _self._secondaryMuscles : secondaryMuscles // ignore: cast_nullable_to_non_nullable
as List<MuscleGroup>,equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as Equipment,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,movementPattern: null == movementPattern ? _self.movementPattern : movementPattern // ignore: cast_nullable_to_non_nullable
as MovementPattern,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,mistakes: null == mistakes ? _self._mistakes : mistakes // ignore: cast_nullable_to_non_nullable
as List<String>,animationAsset: freezed == animationAsset ? _self.animationAsset : animationAsset // ignore: cast_nullable_to_non_nullable
as String?,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
