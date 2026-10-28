// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Plan {

 String get id; String get name; String? get description; bool get isPrebuilt; bool get active; DateTime? get startDate; int? get weeks; List<PlanDay> get days;
/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanCopyWith<Plan> get copyWith => _$PlanCopyWithImpl<Plan>(this as Plan, _$identity);

  /// Serializes this Plan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Plan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Plan&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.isPrebuilt, _this.isPrebuilt) || other.isPrebuilt == _this.isPrebuilt)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.weeks, _this.weeks) || other.weeks == _this.weeks)&&const DeepCollectionEquality().equals(other.days, _this.days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Plan;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.isPrebuilt,_this.active,_this.startDate,_this.weeks,const DeepCollectionEquality().hash(_this.days));
}

@override
String toString() {
  final _this = this as Plan;
  return 'Plan(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, isPrebuilt: ${_this.isPrebuilt}, active: ${_this.active}, startDate: ${_this.startDate}, weeks: ${_this.weeks}, days: ${_this.days})';
}


}

/// @nodoc
abstract mixin class $PlanCopyWith<$Res>  {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) _then) = _$PlanCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, bool isPrebuilt, bool active, DateTime? startDate, int? weeks, List<PlanDay> days
});




}
/// @nodoc
class _$PlanCopyWithImpl<$Res>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._self, this._then);

  final Plan _self;
  final $Res Function(Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? isPrebuilt = null,Object? active = null,Object? startDate = freezed,Object? weeks = freezed,Object? days = null,}) {
  return _then(Plan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isPrebuilt: null == isPrebuilt ? _self.isPrebuilt : isPrebuilt // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,weeks: freezed == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as int?,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<PlanDay>,
  ));
}

}


/// Adds pattern-matching-related methods to [Plan].
extension PlanPatterns on Plan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Plan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Plan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Plan value)  $default,){
final _that = this;
switch (_that) {
case _Plan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Plan value)?  $default,){
final _that = this;
switch (_that) {
case _Plan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  bool isPrebuilt,  bool active,  DateTime? startDate,  int? weeks,  List<PlanDay> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.isPrebuilt,_that.active,_that.startDate,_that.weeks,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  bool isPrebuilt,  bool active,  DateTime? startDate,  int? weeks,  List<PlanDay> days)  $default,) {final _that = this;
switch (_that) {
case _Plan():
return $default(_that.id,_that.name,_that.description,_that.isPrebuilt,_that.active,_that.startDate,_that.weeks,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  bool isPrebuilt,  bool active,  DateTime? startDate,  int? weeks,  List<PlanDay> days)?  $default,) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.isPrebuilt,_that.active,_that.startDate,_that.weeks,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Plan implements Plan {
  const _Plan({required this.id, required this.name, this.description, this.isPrebuilt = false, this.active = false, this.startDate, this.weeks,  List<PlanDay> days = const <PlanDay>[]}): _days = days;
  factory _Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override@JsonKey() final  bool isPrebuilt;
@override@JsonKey() final  bool active;
@override final  DateTime? startDate;
@override final  int? weeks;
 final  List<PlanDay> _days;
@override@JsonKey() List<PlanDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanCopyWith<_Plan> get copyWith => __$PlanCopyWithImpl<_Plan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plan&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPrebuilt, isPrebuilt) || other.isPrebuilt == isPrebuilt)&&(identical(other.active, active) || other.active == active)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.weeks, weeks) || other.weeks == weeks)&&const DeepCollectionEquality().equals(other.days, _days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,isPrebuilt,active,startDate,weeks,const DeepCollectionEquality().hash(_days));
}

@override
String toString() {
    return 'Plan(id: $id, name: $name, description: $description, isPrebuilt: $isPrebuilt, active: $active, startDate: $startDate, weeks: $weeks, days: $days)';
}


}

/// @nodoc
abstract mixin class _$PlanCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$PlanCopyWith(_Plan value, $Res Function(_Plan) _then) = __$PlanCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, bool isPrebuilt, bool active, DateTime? startDate, int? weeks, List<PlanDay> days
});




}
/// @nodoc
class __$PlanCopyWithImpl<$Res>
    implements _$PlanCopyWith<$Res> {
  __$PlanCopyWithImpl(this._self, this._then);

  final _Plan _self;
  final $Res Function(_Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? isPrebuilt = null,Object? active = null,Object? startDate = freezed,Object? weeks = freezed,Object? days = null,}) {
  return _then(_Plan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isPrebuilt: null == isPrebuilt ? _self.isPrebuilt : isPrebuilt // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,weeks: freezed == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as int?,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<PlanDay>,
  ));
}


}

// dart format on
