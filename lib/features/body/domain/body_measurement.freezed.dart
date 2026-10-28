// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'body_measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BodyMeasurement {

 String get id; MeasurementType get type; double get value; DateTime get measuredAt;
/// Create a copy of BodyMeasurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BodyMeasurementCopyWith<BodyMeasurement> get copyWith => _$BodyMeasurementCopyWithImpl<BodyMeasurement>(this as BodyMeasurement, _$identity);

  /// Serializes this BodyMeasurement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BodyMeasurement;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BodyMeasurement&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.measuredAt, _this.measuredAt) || other.measuredAt == _this.measuredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BodyMeasurement;
  return Object.hash(runtimeType,_this.id,_this.type,_this.value,_this.measuredAt);
}

@override
String toString() {
  final _this = this as BodyMeasurement;
  return 'BodyMeasurement(id: ${_this.id}, type: ${_this.type}, value: ${_this.value}, measuredAt: ${_this.measuredAt})';
}


}

/// @nodoc
abstract mixin class $BodyMeasurementCopyWith<$Res>  {
  factory $BodyMeasurementCopyWith(BodyMeasurement value, $Res Function(BodyMeasurement) _then) = _$BodyMeasurementCopyWithImpl;
@useResult
$Res call({
 String id, MeasurementType type, double value, DateTime measuredAt
});




}
/// @nodoc
class _$BodyMeasurementCopyWithImpl<$Res>
    implements $BodyMeasurementCopyWith<$Res> {
  _$BodyMeasurementCopyWithImpl(this._self, this._then);

  final BodyMeasurement _self;
  final $Res Function(BodyMeasurement) _then;

/// Create a copy of BodyMeasurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? value = null,Object? measuredAt = null,}) {
  return _then(BodyMeasurement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MeasurementType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,measuredAt: null == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BodyMeasurement].
extension BodyMeasurementPatterns on BodyMeasurement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BodyMeasurement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BodyMeasurement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BodyMeasurement value)  $default,){
final _that = this;
switch (_that) {
case _BodyMeasurement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BodyMeasurement value)?  $default,){
final _that = this;
switch (_that) {
case _BodyMeasurement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MeasurementType type,  double value,  DateTime measuredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BodyMeasurement() when $default != null:
return $default(_that.id,_that.type,_that.value,_that.measuredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MeasurementType type,  double value,  DateTime measuredAt)  $default,) {final _that = this;
switch (_that) {
case _BodyMeasurement():
return $default(_that.id,_that.type,_that.value,_that.measuredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MeasurementType type,  double value,  DateTime measuredAt)?  $default,) {final _that = this;
switch (_that) {
case _BodyMeasurement() when $default != null:
return $default(_that.id,_that.type,_that.value,_that.measuredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BodyMeasurement implements BodyMeasurement {
  const _BodyMeasurement({required this.id, required this.type, required this.value, required this.measuredAt});
  factory _BodyMeasurement.fromJson(Map<String, dynamic> json) => _$BodyMeasurementFromJson(json);

@override final  String id;
@override final  MeasurementType type;
@override final  double value;
@override final  DateTime measuredAt;

/// Create a copy of BodyMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BodyMeasurementCopyWith<_BodyMeasurement> get copyWith => __$BodyMeasurementCopyWithImpl<_BodyMeasurement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BodyMeasurementToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BodyMeasurement&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value)&&(identical(other.measuredAt, measuredAt) || other.measuredAt == measuredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,value,measuredAt);
}

@override
String toString() {
    return 'BodyMeasurement(id: $id, type: $type, value: $value, measuredAt: $measuredAt)';
}


}

/// @nodoc
abstract mixin class _$BodyMeasurementCopyWith<$Res> implements $BodyMeasurementCopyWith<$Res> {
  factory _$BodyMeasurementCopyWith(_BodyMeasurement value, $Res Function(_BodyMeasurement) _then) = __$BodyMeasurementCopyWithImpl;
@override @useResult
$Res call({
 String id, MeasurementType type, double value, DateTime measuredAt
});




}
/// @nodoc
class __$BodyMeasurementCopyWithImpl<$Res>
    implements _$BodyMeasurementCopyWith<$Res> {
  __$BodyMeasurementCopyWithImpl(this._self, this._then);

  final _BodyMeasurement _self;
  final $Res Function(_BodyMeasurement) _then;

/// Create a copy of BodyMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? value = null,Object? measuredAt = null,}) {
  return _then(_BodyMeasurement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MeasurementType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,measuredAt: null == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
