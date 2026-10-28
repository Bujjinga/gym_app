// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealEntry {

 String get id; DateTime get loggedAt; MealType get meal; String get name; int get calories; double get proteinG; double get carbsG; double get fatG;
/// Create a copy of MealEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealEntryCopyWith<MealEntry> get copyWith => _$MealEntryCopyWithImpl<MealEntry>(this as MealEntry, _$identity);

  /// Serializes this MealEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MealEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.loggedAt, _this.loggedAt) || other.loggedAt == _this.loggedAt)&&(identical(other.meal, _this.meal) || other.meal == _this.meal)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.calories, _this.calories) || other.calories == _this.calories)&&(identical(other.proteinG, _this.proteinG) || other.proteinG == _this.proteinG)&&(identical(other.carbsG, _this.carbsG) || other.carbsG == _this.carbsG)&&(identical(other.fatG, _this.fatG) || other.fatG == _this.fatG));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MealEntry;
  return Object.hash(runtimeType,_this.id,_this.loggedAt,_this.meal,_this.name,_this.calories,_this.proteinG,_this.carbsG,_this.fatG);
}

@override
String toString() {
  final _this = this as MealEntry;
  return 'MealEntry(id: ${_this.id}, loggedAt: ${_this.loggedAt}, meal: ${_this.meal}, name: ${_this.name}, calories: ${_this.calories}, proteinG: ${_this.proteinG}, carbsG: ${_this.carbsG}, fatG: ${_this.fatG})';
}


}

/// @nodoc
abstract mixin class $MealEntryCopyWith<$Res>  {
  factory $MealEntryCopyWith(MealEntry value, $Res Function(MealEntry) _then) = _$MealEntryCopyWithImpl;
@useResult
$Res call({
 String id, DateTime loggedAt, MealType meal, String name, int calories, double proteinG, double carbsG, double fatG
});




}
/// @nodoc
class _$MealEntryCopyWithImpl<$Res>
    implements $MealEntryCopyWith<$Res> {
  _$MealEntryCopyWithImpl(this._self, this._then);

  final MealEntry _self;
  final $Res Function(MealEntry) _then;

/// Create a copy of MealEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? loggedAt = null,Object? meal = null,Object? name = null,Object? calories = null,Object? proteinG = null,Object? carbsG = null,Object? fatG = null,}) {
  return _then(MealEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,loggedAt: null == loggedAt ? _self.loggedAt : loggedAt // ignore: cast_nullable_to_non_nullable
as DateTime,meal: null == meal ? _self.meal : meal // ignore: cast_nullable_to_non_nullable
as MealType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,proteinG: null == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double,carbsG: null == carbsG ? _self.carbsG : carbsG // ignore: cast_nullable_to_non_nullable
as double,fatG: null == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MealEntry].
extension MealEntryPatterns on MealEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealEntry value)  $default,){
final _that = this;
switch (_that) {
case _MealEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MealEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime loggedAt,  MealType meal,  String name,  int calories,  double proteinG,  double carbsG,  double fatG)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealEntry() when $default != null:
return $default(_that.id,_that.loggedAt,_that.meal,_that.name,_that.calories,_that.proteinG,_that.carbsG,_that.fatG);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime loggedAt,  MealType meal,  String name,  int calories,  double proteinG,  double carbsG,  double fatG)  $default,) {final _that = this;
switch (_that) {
case _MealEntry():
return $default(_that.id,_that.loggedAt,_that.meal,_that.name,_that.calories,_that.proteinG,_that.carbsG,_that.fatG);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime loggedAt,  MealType meal,  String name,  int calories,  double proteinG,  double carbsG,  double fatG)?  $default,) {final _that = this;
switch (_that) {
case _MealEntry() when $default != null:
return $default(_that.id,_that.loggedAt,_that.meal,_that.name,_that.calories,_that.proteinG,_that.carbsG,_that.fatG);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealEntry implements MealEntry {
  const _MealEntry({required this.id, required this.loggedAt, required this.meal, required this.name, required this.calories, this.proteinG = 0, this.carbsG = 0, this.fatG = 0});
  factory _MealEntry.fromJson(Map<String, dynamic> json) => _$MealEntryFromJson(json);

@override final  String id;
@override final  DateTime loggedAt;
@override final  MealType meal;
@override final  String name;
@override final  int calories;
@override@JsonKey() final  double proteinG;
@override@JsonKey() final  double carbsG;
@override@JsonKey() final  double fatG;

/// Create a copy of MealEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealEntryCopyWith<_MealEntry> get copyWith => __$MealEntryCopyWithImpl<_MealEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.loggedAt, loggedAt) || other.loggedAt == loggedAt)&&(identical(other.meal, meal) || other.meal == meal)&&(identical(other.name, name) || other.name == name)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.carbsG, carbsG) || other.carbsG == carbsG)&&(identical(other.fatG, fatG) || other.fatG == fatG));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,loggedAt,meal,name,calories,proteinG,carbsG,fatG);
}

@override
String toString() {
    return 'MealEntry(id: $id, loggedAt: $loggedAt, meal: $meal, name: $name, calories: $calories, proteinG: $proteinG, carbsG: $carbsG, fatG: $fatG)';
}


}

/// @nodoc
abstract mixin class _$MealEntryCopyWith<$Res> implements $MealEntryCopyWith<$Res> {
  factory _$MealEntryCopyWith(_MealEntry value, $Res Function(_MealEntry) _then) = __$MealEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime loggedAt, MealType meal, String name, int calories, double proteinG, double carbsG, double fatG
});




}
/// @nodoc
class __$MealEntryCopyWithImpl<$Res>
    implements _$MealEntryCopyWith<$Res> {
  __$MealEntryCopyWithImpl(this._self, this._then);

  final _MealEntry _self;
  final $Res Function(_MealEntry) _then;

/// Create a copy of MealEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? loggedAt = null,Object? meal = null,Object? name = null,Object? calories = null,Object? proteinG = null,Object? carbsG = null,Object? fatG = null,}) {
  return _then(_MealEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,loggedAt: null == loggedAt ? _self.loggedAt : loggedAt // ignore: cast_nullable_to_non_nullable
as DateTime,meal: null == meal ? _self.meal : meal // ignore: cast_nullable_to_non_nullable
as MealType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,proteinG: null == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double,carbsG: null == carbsG ? _self.carbsG : carbsG // ignore: cast_nullable_to_non_nullable
as double,fatG: null == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
