// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AchievementProgress {

 String get key;/// 0..1 toward unlocking.
 double get progress; DateTime? get unlockedAt;
/// Create a copy of AchievementProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementProgressCopyWith<AchievementProgress> get copyWith => _$AchievementProgressCopyWithImpl<AchievementProgress>(this as AchievementProgress, _$identity);

  /// Serializes this AchievementProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AchievementProgress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementProgress&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.unlockedAt, _this.unlockedAt) || other.unlockedAt == _this.unlockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AchievementProgress;
  return Object.hash(runtimeType,_this.key,_this.progress,_this.unlockedAt);
}

@override
String toString() {
  final _this = this as AchievementProgress;
  return 'AchievementProgress(key: ${_this.key}, progress: ${_this.progress}, unlockedAt: ${_this.unlockedAt})';
}


}

/// @nodoc
abstract mixin class $AchievementProgressCopyWith<$Res>  {
  factory $AchievementProgressCopyWith(AchievementProgress value, $Res Function(AchievementProgress) _then) = _$AchievementProgressCopyWithImpl;
@useResult
$Res call({
 String key, double progress, DateTime? unlockedAt
});




}
/// @nodoc
class _$AchievementProgressCopyWithImpl<$Res>
    implements $AchievementProgressCopyWith<$Res> {
  _$AchievementProgressCopyWithImpl(this._self, this._then);

  final AchievementProgress _self;
  final $Res Function(AchievementProgress) _then;

/// Create a copy of AchievementProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? progress = null,Object? unlockedAt = freezed,}) {
  return _then(AchievementProgress(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementProgress].
extension AchievementProgressPatterns on AchievementProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementProgress value)  $default,){
final _that = this;
switch (_that) {
case _AchievementProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementProgress value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  double progress,  DateTime? unlockedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementProgress() when $default != null:
return $default(_that.key,_that.progress,_that.unlockedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  double progress,  DateTime? unlockedAt)  $default,) {final _that = this;
switch (_that) {
case _AchievementProgress():
return $default(_that.key,_that.progress,_that.unlockedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  double progress,  DateTime? unlockedAt)?  $default,) {final _that = this;
switch (_that) {
case _AchievementProgress() when $default != null:
return $default(_that.key,_that.progress,_that.unlockedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AchievementProgress extends AchievementProgress {
  const _AchievementProgress({required this.key, this.progress = 0, this.unlockedAt}): super._();
  factory _AchievementProgress.fromJson(Map<String, dynamic> json) => _$AchievementProgressFromJson(json);

@override final  String key;
/// 0..1 toward unlocking.
@override@JsonKey() final  double progress;
@override final  DateTime? unlockedAt;

/// Create a copy of AchievementProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementProgressCopyWith<_AchievementProgress> get copyWith => __$AchievementProgressCopyWithImpl<_AchievementProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementProgressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementProgress&&(identical(other.key, key) || other.key == key)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,progress,unlockedAt);
}

@override
String toString() {
    return 'AchievementProgress(key: $key, progress: $progress, unlockedAt: $unlockedAt)';
}


}

/// @nodoc
abstract mixin class _$AchievementProgressCopyWith<$Res> implements $AchievementProgressCopyWith<$Res> {
  factory _$AchievementProgressCopyWith(_AchievementProgress value, $Res Function(_AchievementProgress) _then) = __$AchievementProgressCopyWithImpl;
@override @useResult
$Res call({
 String key, double progress, DateTime? unlockedAt
});




}
/// @nodoc
class __$AchievementProgressCopyWithImpl<$Res>
    implements _$AchievementProgressCopyWith<$Res> {
  __$AchievementProgressCopyWithImpl(this._self, this._then);

  final _AchievementProgress _self;
  final $Res Function(_AchievementProgress) _then;

/// Create a copy of AchievementProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? progress = null,Object? unlockedAt = freezed,}) {
  return _then(_AchievementProgress(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
