// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WaterLog {

 String get id; DateTime get loggedAt; int get amountMl;
/// Create a copy of WaterLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterLogCopyWith<WaterLog> get copyWith => _$WaterLogCopyWithImpl<WaterLog>(this as WaterLog, _$identity);

  /// Serializes this WaterLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WaterLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterLog&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.loggedAt, _this.loggedAt) || other.loggedAt == _this.loggedAt)&&(identical(other.amountMl, _this.amountMl) || other.amountMl == _this.amountMl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WaterLog;
  return Object.hash(runtimeType,_this.id,_this.loggedAt,_this.amountMl);
}

@override
String toString() {
  final _this = this as WaterLog;
  return 'WaterLog(id: ${_this.id}, loggedAt: ${_this.loggedAt}, amountMl: ${_this.amountMl})';
}


}

/// @nodoc
abstract mixin class $WaterLogCopyWith<$Res>  {
  factory $WaterLogCopyWith(WaterLog value, $Res Function(WaterLog) _then) = _$WaterLogCopyWithImpl;
@useResult
$Res call({
 String id, DateTime loggedAt, int amountMl
});




}
/// @nodoc
class _$WaterLogCopyWithImpl<$Res>
    implements $WaterLogCopyWith<$Res> {
  _$WaterLogCopyWithImpl(this._self, this._then);

  final WaterLog _self;
  final $Res Function(WaterLog) _then;

/// Create a copy of WaterLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? loggedAt = null,Object? amountMl = null,}) {
  return _then(WaterLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,loggedAt: null == loggedAt ? _self.loggedAt : loggedAt // ignore: cast_nullable_to_non_nullable
as DateTime,amountMl: null == amountMl ? _self.amountMl : amountMl // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterLog].
extension WaterLogPatterns on WaterLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterLog value)  $default,){
final _that = this;
switch (_that) {
case _WaterLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterLog value)?  $default,){
final _that = this;
switch (_that) {
case _WaterLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime loggedAt,  int amountMl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterLog() when $default != null:
return $default(_that.id,_that.loggedAt,_that.amountMl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime loggedAt,  int amountMl)  $default,) {final _that = this;
switch (_that) {
case _WaterLog():
return $default(_that.id,_that.loggedAt,_that.amountMl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime loggedAt,  int amountMl)?  $default,) {final _that = this;
switch (_that) {
case _WaterLog() when $default != null:
return $default(_that.id,_that.loggedAt,_that.amountMl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterLog implements WaterLog {
  const _WaterLog({required this.id, required this.loggedAt, required this.amountMl});
  factory _WaterLog.fromJson(Map<String, dynamic> json) => _$WaterLogFromJson(json);

@override final  String id;
@override final  DateTime loggedAt;
@override final  int amountMl;

/// Create a copy of WaterLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterLogCopyWith<_WaterLog> get copyWith => __$WaterLogCopyWithImpl<_WaterLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterLogToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterLog&&(identical(other.id, id) || other.id == id)&&(identical(other.loggedAt, loggedAt) || other.loggedAt == loggedAt)&&(identical(other.amountMl, amountMl) || other.amountMl == amountMl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,loggedAt,amountMl);
}

@override
String toString() {
    return 'WaterLog(id: $id, loggedAt: $loggedAt, amountMl: $amountMl)';
}


}

/// @nodoc
abstract mixin class _$WaterLogCopyWith<$Res> implements $WaterLogCopyWith<$Res> {
  factory _$WaterLogCopyWith(_WaterLog value, $Res Function(_WaterLog) _then) = __$WaterLogCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime loggedAt, int amountMl
});




}
/// @nodoc
class __$WaterLogCopyWithImpl<$Res>
    implements _$WaterLogCopyWith<$Res> {
  __$WaterLogCopyWithImpl(this._self, this._then);

  final _WaterLog _self;
  final $Res Function(_WaterLog) _then;

/// Create a copy of WaterLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? loggedAt = null,Object? amountMl = null,}) {
  return _then(_WaterLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,loggedAt: null == loggedAt ? _self.loggedAt : loggedAt // ignore: cast_nullable_to_non_nullable
as DateTime,amountMl: null == amountMl ? _self.amountMl : amountMl // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
