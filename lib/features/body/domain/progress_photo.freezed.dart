// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressPhoto {

 String get id; DateTime get takenAt; PhotoPose get pose; String get localPath; double? get weightKg; String? get note;
/// Create a copy of ProgressPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressPhotoCopyWith<ProgressPhoto> get copyWith => _$ProgressPhotoCopyWithImpl<ProgressPhoto>(this as ProgressPhoto, _$identity);

  /// Serializes this ProgressPhoto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProgressPhoto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressPhoto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.takenAt, _this.takenAt) || other.takenAt == _this.takenAt)&&(identical(other.pose, _this.pose) || other.pose == _this.pose)&&(identical(other.localPath, _this.localPath) || other.localPath == _this.localPath)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProgressPhoto;
  return Object.hash(runtimeType,_this.id,_this.takenAt,_this.pose,_this.localPath,_this.weightKg,_this.note);
}

@override
String toString() {
  final _this = this as ProgressPhoto;
  return 'ProgressPhoto(id: ${_this.id}, takenAt: ${_this.takenAt}, pose: ${_this.pose}, localPath: ${_this.localPath}, weightKg: ${_this.weightKg}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ProgressPhotoCopyWith<$Res>  {
  factory $ProgressPhotoCopyWith(ProgressPhoto value, $Res Function(ProgressPhoto) _then) = _$ProgressPhotoCopyWithImpl;
@useResult
$Res call({
 String id, DateTime takenAt, PhotoPose pose, String localPath, double? weightKg, String? note
});




}
/// @nodoc
class _$ProgressPhotoCopyWithImpl<$Res>
    implements $ProgressPhotoCopyWith<$Res> {
  _$ProgressPhotoCopyWithImpl(this._self, this._then);

  final ProgressPhoto _self;
  final $Res Function(ProgressPhoto) _then;

/// Create a copy of ProgressPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? takenAt = null,Object? pose = null,Object? localPath = null,Object? weightKg = freezed,Object? note = freezed,}) {
  return _then(ProgressPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,pose: null == pose ? _self.pose : pose // ignore: cast_nullable_to_non_nullable
as PhotoPose,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressPhoto].
extension ProgressPhotoPatterns on ProgressPhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressPhoto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressPhoto value)  $default,){
final _that = this;
switch (_that) {
case _ProgressPhoto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressPhoto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime takenAt,  PhotoPose pose,  String localPath,  double? weightKg,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressPhoto() when $default != null:
return $default(_that.id,_that.takenAt,_that.pose,_that.localPath,_that.weightKg,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime takenAt,  PhotoPose pose,  String localPath,  double? weightKg,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ProgressPhoto():
return $default(_that.id,_that.takenAt,_that.pose,_that.localPath,_that.weightKg,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime takenAt,  PhotoPose pose,  String localPath,  double? weightKg,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ProgressPhoto() when $default != null:
return $default(_that.id,_that.takenAt,_that.pose,_that.localPath,_that.weightKg,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressPhoto implements ProgressPhoto {
  const _ProgressPhoto({required this.id, required this.takenAt, required this.pose, required this.localPath, this.weightKg, this.note});
  factory _ProgressPhoto.fromJson(Map<String, dynamic> json) => _$ProgressPhotoFromJson(json);

@override final  String id;
@override final  DateTime takenAt;
@override final  PhotoPose pose;
@override final  String localPath;
@override final  double? weightKg;
@override final  String? note;

/// Create a copy of ProgressPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressPhotoCopyWith<_ProgressPhoto> get copyWith => __$ProgressPhotoCopyWithImpl<_ProgressPhoto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressPhotoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt)&&(identical(other.pose, pose) || other.pose == pose)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,takenAt,pose,localPath,weightKg,note);
}

@override
String toString() {
    return 'ProgressPhoto(id: $id, takenAt: $takenAt, pose: $pose, localPath: $localPath, weightKg: $weightKg, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ProgressPhotoCopyWith<$Res> implements $ProgressPhotoCopyWith<$Res> {
  factory _$ProgressPhotoCopyWith(_ProgressPhoto value, $Res Function(_ProgressPhoto) _then) = __$ProgressPhotoCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime takenAt, PhotoPose pose, String localPath, double? weightKg, String? note
});




}
/// @nodoc
class __$ProgressPhotoCopyWithImpl<$Res>
    implements _$ProgressPhotoCopyWith<$Res> {
  __$ProgressPhotoCopyWithImpl(this._self, this._then);

  final _ProgressPhoto _self;
  final $Res Function(_ProgressPhoto) _then;

/// Create a copy of ProgressPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? takenAt = null,Object? pose = null,Object? localPath = null,Object? weightKg = freezed,Object? note = freezed,}) {
  return _then(_ProgressPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,pose: null == pose ? _self.pose : pose // ignore: cast_nullable_to_non_nullable
as PhotoPose,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
