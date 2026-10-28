// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonalRecord {

 String get id; String get exerciseId; RecordType get type; double get value; int? get reps; DateTime get achievedAt; String? get sessionId;
/// Create a copy of PersonalRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalRecordCopyWith<PersonalRecord> get copyWith => _$PersonalRecordCopyWithImpl<PersonalRecord>(this as PersonalRecord, _$identity);

  /// Serializes this PersonalRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PersonalRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.exerciseId, _this.exerciseId) || other.exerciseId == _this.exerciseId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.reps, _this.reps) || other.reps == _this.reps)&&(identical(other.achievedAt, _this.achievedAt) || other.achievedAt == _this.achievedAt)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PersonalRecord;
  return Object.hash(runtimeType,_this.id,_this.exerciseId,_this.type,_this.value,_this.reps,_this.achievedAt,_this.sessionId);
}

@override
String toString() {
  final _this = this as PersonalRecord;
  return 'PersonalRecord(id: ${_this.id}, exerciseId: ${_this.exerciseId}, type: ${_this.type}, value: ${_this.value}, reps: ${_this.reps}, achievedAt: ${_this.achievedAt}, sessionId: ${_this.sessionId})';
}


}

/// @nodoc
abstract mixin class $PersonalRecordCopyWith<$Res>  {
  factory $PersonalRecordCopyWith(PersonalRecord value, $Res Function(PersonalRecord) _then) = _$PersonalRecordCopyWithImpl;
@useResult
$Res call({
 String id, String exerciseId, RecordType type, double value, int? reps, DateTime achievedAt, String? sessionId
});




}
/// @nodoc
class _$PersonalRecordCopyWithImpl<$Res>
    implements $PersonalRecordCopyWith<$Res> {
  _$PersonalRecordCopyWithImpl(this._self, this._then);

  final PersonalRecord _self;
  final $Res Function(PersonalRecord) _then;

/// Create a copy of PersonalRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? exerciseId = null,Object? type = null,Object? value = null,Object? reps = freezed,Object? achievedAt = null,Object? sessionId = freezed,}) {
  return _then(PersonalRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RecordType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,reps: freezed == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int?,achievedAt: null == achievedAt ? _self.achievedAt : achievedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalRecord].
extension PersonalRecordPatterns on PersonalRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalRecord value)  $default,){
final _that = this;
switch (_that) {
case _PersonalRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalRecord value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String exerciseId,  RecordType type,  double value,  int? reps,  DateTime achievedAt,  String? sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalRecord() when $default != null:
return $default(_that.id,_that.exerciseId,_that.type,_that.value,_that.reps,_that.achievedAt,_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String exerciseId,  RecordType type,  double value,  int? reps,  DateTime achievedAt,  String? sessionId)  $default,) {final _that = this;
switch (_that) {
case _PersonalRecord():
return $default(_that.id,_that.exerciseId,_that.type,_that.value,_that.reps,_that.achievedAt,_that.sessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String exerciseId,  RecordType type,  double value,  int? reps,  DateTime achievedAt,  String? sessionId)?  $default,) {final _that = this;
switch (_that) {
case _PersonalRecord() when $default != null:
return $default(_that.id,_that.exerciseId,_that.type,_that.value,_that.reps,_that.achievedAt,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalRecord implements PersonalRecord {
  const _PersonalRecord({required this.id, required this.exerciseId, required this.type, required this.value, this.reps, required this.achievedAt, this.sessionId});
  factory _PersonalRecord.fromJson(Map<String, dynamic> json) => _$PersonalRecordFromJson(json);

@override final  String id;
@override final  String exerciseId;
@override final  RecordType type;
@override final  double value;
@override final  int? reps;
@override final  DateTime achievedAt;
@override final  String? sessionId;

/// Create a copy of PersonalRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalRecordCopyWith<_PersonalRecord> get copyWith => __$PersonalRecordCopyWithImpl<_PersonalRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.achievedAt, achievedAt) || other.achievedAt == achievedAt)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,exerciseId,type,value,reps,achievedAt,sessionId);
}

@override
String toString() {
    return 'PersonalRecord(id: $id, exerciseId: $exerciseId, type: $type, value: $value, reps: $reps, achievedAt: $achievedAt, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$PersonalRecordCopyWith<$Res> implements $PersonalRecordCopyWith<$Res> {
  factory _$PersonalRecordCopyWith(_PersonalRecord value, $Res Function(_PersonalRecord) _then) = __$PersonalRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String exerciseId, RecordType type, double value, int? reps, DateTime achievedAt, String? sessionId
});




}
/// @nodoc
class __$PersonalRecordCopyWithImpl<$Res>
    implements _$PersonalRecordCopyWith<$Res> {
  __$PersonalRecordCopyWithImpl(this._self, this._then);

  final _PersonalRecord _self;
  final $Res Function(_PersonalRecord) _then;

/// Create a copy of PersonalRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? exerciseId = null,Object? type = null,Object? value = null,Object? reps = freezed,Object? achievedAt = null,Object? sessionId = freezed,}) {
  return _then(_PersonalRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RecordType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,reps: freezed == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int?,achievedAt: null == achievedAt ? _self.achievedAt : achievedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
