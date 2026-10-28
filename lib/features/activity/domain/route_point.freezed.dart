// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoutePoint {

 String get id; DateTime get recordedAt; double get latitude; double get longitude; double? get altitudeM; double? get speedMps; double? get accuracyM; int? get heartRate;
/// Create a copy of RoutePoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoutePointCopyWith<RoutePoint> get copyWith => _$RoutePointCopyWithImpl<RoutePoint>(this as RoutePoint, _$identity);

  /// Serializes this RoutePoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoutePoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoutePoint&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.recordedAt, _this.recordedAt) || other.recordedAt == _this.recordedAt)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.altitudeM, _this.altitudeM) || other.altitudeM == _this.altitudeM)&&(identical(other.speedMps, _this.speedMps) || other.speedMps == _this.speedMps)&&(identical(other.accuracyM, _this.accuracyM) || other.accuracyM == _this.accuracyM)&&(identical(other.heartRate, _this.heartRate) || other.heartRate == _this.heartRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoutePoint;
  return Object.hash(runtimeType,_this.id,_this.recordedAt,_this.latitude,_this.longitude,_this.altitudeM,_this.speedMps,_this.accuracyM,_this.heartRate);
}

@override
String toString() {
  final _this = this as RoutePoint;
  return 'RoutePoint(id: ${_this.id}, recordedAt: ${_this.recordedAt}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, altitudeM: ${_this.altitudeM}, speedMps: ${_this.speedMps}, accuracyM: ${_this.accuracyM}, heartRate: ${_this.heartRate})';
}


}

/// @nodoc
abstract mixin class $RoutePointCopyWith<$Res>  {
  factory $RoutePointCopyWith(RoutePoint value, $Res Function(RoutePoint) _then) = _$RoutePointCopyWithImpl;
@useResult
$Res call({
 String id, DateTime recordedAt, double latitude, double longitude, double? altitudeM, double? speedMps, double? accuracyM, int? heartRate
});




}
/// @nodoc
class _$RoutePointCopyWithImpl<$Res>
    implements $RoutePointCopyWith<$Res> {
  _$RoutePointCopyWithImpl(this._self, this._then);

  final RoutePoint _self;
  final $Res Function(RoutePoint) _then;

/// Create a copy of RoutePoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recordedAt = null,Object? latitude = null,Object? longitude = null,Object? altitudeM = freezed,Object? speedMps = freezed,Object? accuracyM = freezed,Object? heartRate = freezed,}) {
  return _then(RoutePoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,altitudeM: freezed == altitudeM ? _self.altitudeM : altitudeM // ignore: cast_nullable_to_non_nullable
as double?,speedMps: freezed == speedMps ? _self.speedMps : speedMps // ignore: cast_nullable_to_non_nullable
as double?,accuracyM: freezed == accuracyM ? _self.accuracyM : accuracyM // ignore: cast_nullable_to_non_nullable
as double?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoutePoint].
extension RoutePointPatterns on RoutePoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoutePoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoutePoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoutePoint value)  $default,){
final _that = this;
switch (_that) {
case _RoutePoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoutePoint value)?  $default,){
final _that = this;
switch (_that) {
case _RoutePoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime recordedAt,  double latitude,  double longitude,  double? altitudeM,  double? speedMps,  double? accuracyM,  int? heartRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoutePoint() when $default != null:
return $default(_that.id,_that.recordedAt,_that.latitude,_that.longitude,_that.altitudeM,_that.speedMps,_that.accuracyM,_that.heartRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime recordedAt,  double latitude,  double longitude,  double? altitudeM,  double? speedMps,  double? accuracyM,  int? heartRate)  $default,) {final _that = this;
switch (_that) {
case _RoutePoint():
return $default(_that.id,_that.recordedAt,_that.latitude,_that.longitude,_that.altitudeM,_that.speedMps,_that.accuracyM,_that.heartRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime recordedAt,  double latitude,  double longitude,  double? altitudeM,  double? speedMps,  double? accuracyM,  int? heartRate)?  $default,) {final _that = this;
switch (_that) {
case _RoutePoint() when $default != null:
return $default(_that.id,_that.recordedAt,_that.latitude,_that.longitude,_that.altitudeM,_that.speedMps,_that.accuracyM,_that.heartRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoutePoint implements RoutePoint {
  const _RoutePoint({required this.id, required this.recordedAt, required this.latitude, required this.longitude, this.altitudeM, this.speedMps, this.accuracyM, this.heartRate});
  factory _RoutePoint.fromJson(Map<String, dynamic> json) => _$RoutePointFromJson(json);

@override final  String id;
@override final  DateTime recordedAt;
@override final  double latitude;
@override final  double longitude;
@override final  double? altitudeM;
@override final  double? speedMps;
@override final  double? accuracyM;
@override final  int? heartRate;

/// Create a copy of RoutePoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoutePointCopyWith<_RoutePoint> get copyWith => __$RoutePointCopyWithImpl<_RoutePoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoutePointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoutePoint&&(identical(other.id, id) || other.id == id)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.altitudeM, altitudeM) || other.altitudeM == altitudeM)&&(identical(other.speedMps, speedMps) || other.speedMps == speedMps)&&(identical(other.accuracyM, accuracyM) || other.accuracyM == accuracyM)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,recordedAt,latitude,longitude,altitudeM,speedMps,accuracyM,heartRate);
}

@override
String toString() {
    return 'RoutePoint(id: $id, recordedAt: $recordedAt, latitude: $latitude, longitude: $longitude, altitudeM: $altitudeM, speedMps: $speedMps, accuracyM: $accuracyM, heartRate: $heartRate)';
}


}

/// @nodoc
abstract mixin class _$RoutePointCopyWith<$Res> implements $RoutePointCopyWith<$Res> {
  factory _$RoutePointCopyWith(_RoutePoint value, $Res Function(_RoutePoint) _then) = __$RoutePointCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime recordedAt, double latitude, double longitude, double? altitudeM, double? speedMps, double? accuracyM, int? heartRate
});




}
/// @nodoc
class __$RoutePointCopyWithImpl<$Res>
    implements _$RoutePointCopyWith<$Res> {
  __$RoutePointCopyWithImpl(this._self, this._then);

  final _RoutePoint _self;
  final $Res Function(_RoutePoint) _then;

/// Create a copy of RoutePoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recordedAt = null,Object? latitude = null,Object? longitude = null,Object? altitudeM = freezed,Object? speedMps = freezed,Object? accuracyM = freezed,Object? heartRate = freezed,}) {
  return _then(_RoutePoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,altitudeM: freezed == altitudeM ? _self.altitudeM : altitudeM // ignore: cast_nullable_to_non_nullable
as double?,speedMps: freezed == speedMps ? _self.speedMps : speedMps // ignore: cast_nullable_to_non_nullable
as double?,accuracyM: freezed == accuracyM ? _self.accuracyM : accuracyM // ignore: cast_nullable_to_non_nullable
as double?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
