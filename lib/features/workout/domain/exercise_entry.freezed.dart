// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseEntry {

 String get id; String get exerciseId;/// Entries sharing a group number form a superset/circuit.
 int? get supersetGroup; int get restSeconds; String? get notes; List<SetEntry> get sets;
/// Create a copy of ExerciseEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseEntryCopyWith<ExerciseEntry> get copyWith => _$ExerciseEntryCopyWithImpl<ExerciseEntry>(this as ExerciseEntry, _$identity);

  /// Serializes this ExerciseEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ExerciseEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.exerciseId, _this.exerciseId) || other.exerciseId == _this.exerciseId)&&(identical(other.supersetGroup, _this.supersetGroup) || other.supersetGroup == _this.supersetGroup)&&(identical(other.restSeconds, _this.restSeconds) || other.restSeconds == _this.restSeconds)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.sets, _this.sets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ExerciseEntry;
  return Object.hash(runtimeType,_this.id,_this.exerciseId,_this.supersetGroup,_this.restSeconds,_this.notes,const DeepCollectionEquality().hash(_this.sets));
}

@override
String toString() {
  final _this = this as ExerciseEntry;
  return 'ExerciseEntry(id: ${_this.id}, exerciseId: ${_this.exerciseId}, supersetGroup: ${_this.supersetGroup}, restSeconds: ${_this.restSeconds}, notes: ${_this.notes}, sets: ${_this.sets})';
}


}

/// @nodoc
abstract mixin class $ExerciseEntryCopyWith<$Res>  {
  factory $ExerciseEntryCopyWith(ExerciseEntry value, $Res Function(ExerciseEntry) _then) = _$ExerciseEntryCopyWithImpl;
@useResult
$Res call({
 String id, String exerciseId, int? supersetGroup, int restSeconds, String? notes, List<SetEntry> sets
});




}
/// @nodoc
class _$ExerciseEntryCopyWithImpl<$Res>
    implements $ExerciseEntryCopyWith<$Res> {
  _$ExerciseEntryCopyWithImpl(this._self, this._then);

  final ExerciseEntry _self;
  final $Res Function(ExerciseEntry) _then;

/// Create a copy of ExerciseEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? exerciseId = null,Object? supersetGroup = freezed,Object? restSeconds = null,Object? notes = freezed,Object? sets = null,}) {
  return _then(ExerciseEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,supersetGroup: freezed == supersetGroup ? _self.supersetGroup : supersetGroup // ignore: cast_nullable_to_non_nullable
as int?,restSeconds: null == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as List<SetEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseEntry].
extension ExerciseEntryPatterns on ExerciseEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseEntry value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String exerciseId,  int? supersetGroup,  int restSeconds,  String? notes,  List<SetEntry> sets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseEntry() when $default != null:
return $default(_that.id,_that.exerciseId,_that.supersetGroup,_that.restSeconds,_that.notes,_that.sets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String exerciseId,  int? supersetGroup,  int restSeconds,  String? notes,  List<SetEntry> sets)  $default,) {final _that = this;
switch (_that) {
case _ExerciseEntry():
return $default(_that.id,_that.exerciseId,_that.supersetGroup,_that.restSeconds,_that.notes,_that.sets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String exerciseId,  int? supersetGroup,  int restSeconds,  String? notes,  List<SetEntry> sets)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseEntry() when $default != null:
return $default(_that.id,_that.exerciseId,_that.supersetGroup,_that.restSeconds,_that.notes,_that.sets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseEntry implements ExerciseEntry {
  const _ExerciseEntry({required this.id, required this.exerciseId, this.supersetGroup, this.restSeconds = 90, this.notes,  List<SetEntry> sets = const <SetEntry>[]}): _sets = sets;
  factory _ExerciseEntry.fromJson(Map<String, dynamic> json) => _$ExerciseEntryFromJson(json);

@override final  String id;
@override final  String exerciseId;
/// Entries sharing a group number form a superset/circuit.
@override final  int? supersetGroup;
@override@JsonKey() final  int restSeconds;
@override final  String? notes;
 final  List<SetEntry> _sets;
@override@JsonKey() List<SetEntry> get sets {
  if (_sets is EqualUnmodifiableListView) return _sets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sets);
}


/// Create a copy of ExerciseEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseEntryCopyWith<_ExerciseEntry> get copyWith => __$ExerciseEntryCopyWithImpl<_ExerciseEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.supersetGroup, supersetGroup) || other.supersetGroup == supersetGroup)&&(identical(other.restSeconds, restSeconds) || other.restSeconds == restSeconds)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.sets, _sets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,exerciseId,supersetGroup,restSeconds,notes,const DeepCollectionEquality().hash(_sets));
}

@override
String toString() {
    return 'ExerciseEntry(id: $id, exerciseId: $exerciseId, supersetGroup: $supersetGroup, restSeconds: $restSeconds, notes: $notes, sets: $sets)';
}


}

/// @nodoc
abstract mixin class _$ExerciseEntryCopyWith<$Res> implements $ExerciseEntryCopyWith<$Res> {
  factory _$ExerciseEntryCopyWith(_ExerciseEntry value, $Res Function(_ExerciseEntry) _then) = __$ExerciseEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String exerciseId, int? supersetGroup, int restSeconds, String? notes, List<SetEntry> sets
});




}
/// @nodoc
class __$ExerciseEntryCopyWithImpl<$Res>
    implements _$ExerciseEntryCopyWith<$Res> {
  __$ExerciseEntryCopyWithImpl(this._self, this._then);

  final _ExerciseEntry _self;
  final $Res Function(_ExerciseEntry) _then;

/// Create a copy of ExerciseEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? exerciseId = null,Object? supersetGroup = freezed,Object? restSeconds = null,Object? notes = freezed,Object? sets = null,}) {
  return _then(_ExerciseEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,supersetGroup: freezed == supersetGroup ? _self.supersetGroup : supersetGroup // ignore: cast_nullable_to_non_nullable
as int?,restSeconds: null == restSeconds ? _self.restSeconds : restSeconds // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,sets: null == sets ? _self._sets : sets // ignore: cast_nullable_to_non_nullable
as List<SetEntry>,
  ));
}


}

// dart format on
