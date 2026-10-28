// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutSession {

 String get id; String get name; DateTime get startedAt; DateTime? get endedAt; String? get templateId; String? get planDayId; String? get notes; double get totalVolumeKg; double? get caloriesKcal; WorkoutSource get source; bool get healthSynced; List<ExerciseEntry> get entries;
/// Create a copy of WorkoutSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionCopyWith<WorkoutSession> get copyWith => _$WorkoutSessionCopyWithImpl<WorkoutSession>(this as WorkoutSession, _$identity);

  /// Serializes this WorkoutSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WorkoutSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.endedAt, _this.endedAt) || other.endedAt == _this.endedAt)&&(identical(other.templateId, _this.templateId) || other.templateId == _this.templateId)&&(identical(other.planDayId, _this.planDayId) || other.planDayId == _this.planDayId)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.totalVolumeKg, _this.totalVolumeKg) || other.totalVolumeKg == _this.totalVolumeKg)&&(identical(other.caloriesKcal, _this.caloriesKcal) || other.caloriesKcal == _this.caloriesKcal)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.healthSynced, _this.healthSynced) || other.healthSynced == _this.healthSynced)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WorkoutSession;
  return Object.hash(runtimeType,_this.id,_this.name,_this.startedAt,_this.endedAt,_this.templateId,_this.planDayId,_this.notes,_this.totalVolumeKg,_this.caloriesKcal,_this.source,_this.healthSynced,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as WorkoutSession;
  return 'WorkoutSession(id: ${_this.id}, name: ${_this.name}, startedAt: ${_this.startedAt}, endedAt: ${_this.endedAt}, templateId: ${_this.templateId}, planDayId: ${_this.planDayId}, notes: ${_this.notes}, totalVolumeKg: ${_this.totalVolumeKg}, caloriesKcal: ${_this.caloriesKcal}, source: ${_this.source}, healthSynced: ${_this.healthSynced}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionCopyWith<$Res>  {
  factory $WorkoutSessionCopyWith(WorkoutSession value, $Res Function(WorkoutSession) _then) = _$WorkoutSessionCopyWithImpl;
@useResult
$Res call({
 String id, String name, DateTime startedAt, DateTime? endedAt, String? templateId, String? planDayId, String? notes, double totalVolumeKg, double? caloriesKcal, WorkoutSource source, bool healthSynced, List<ExerciseEntry> entries
});




}
/// @nodoc
class _$WorkoutSessionCopyWithImpl<$Res>
    implements $WorkoutSessionCopyWith<$Res> {
  _$WorkoutSessionCopyWithImpl(this._self, this._then);

  final WorkoutSession _self;
  final $Res Function(WorkoutSession) _then;

/// Create a copy of WorkoutSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? startedAt = null,Object? endedAt = freezed,Object? templateId = freezed,Object? planDayId = freezed,Object? notes = freezed,Object? totalVolumeKg = null,Object? caloriesKcal = freezed,Object? source = null,Object? healthSynced = null,Object? entries = null,}) {
  return _then(WorkoutSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,planDayId: freezed == planDayId ? _self.planDayId : planDayId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalVolumeKg: null == totalVolumeKg ? _self.totalVolumeKg : totalVolumeKg // ignore: cast_nullable_to_non_nullable
as double,caloriesKcal: freezed == caloriesKcal ? _self.caloriesKcal : caloriesKcal // ignore: cast_nullable_to_non_nullable
as double?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as WorkoutSource,healthSynced: null == healthSynced ? _self.healthSynced : healthSynced // ignore: cast_nullable_to_non_nullable
as bool,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ExerciseEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutSession].
extension WorkoutSessionPatterns on WorkoutSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutSession value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutSession value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  DateTime startedAt,  DateTime? endedAt,  String? templateId,  String? planDayId,  String? notes,  double totalVolumeKg,  double? caloriesKcal,  WorkoutSource source,  bool healthSynced,  List<ExerciseEntry> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutSession() when $default != null:
return $default(_that.id,_that.name,_that.startedAt,_that.endedAt,_that.templateId,_that.planDayId,_that.notes,_that.totalVolumeKg,_that.caloriesKcal,_that.source,_that.healthSynced,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  DateTime startedAt,  DateTime? endedAt,  String? templateId,  String? planDayId,  String? notes,  double totalVolumeKg,  double? caloriesKcal,  WorkoutSource source,  bool healthSynced,  List<ExerciseEntry> entries)  $default,) {final _that = this;
switch (_that) {
case _WorkoutSession():
return $default(_that.id,_that.name,_that.startedAt,_that.endedAt,_that.templateId,_that.planDayId,_that.notes,_that.totalVolumeKg,_that.caloriesKcal,_that.source,_that.healthSynced,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  DateTime startedAt,  DateTime? endedAt,  String? templateId,  String? planDayId,  String? notes,  double totalVolumeKg,  double? caloriesKcal,  WorkoutSource source,  bool healthSynced,  List<ExerciseEntry> entries)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutSession() when $default != null:
return $default(_that.id,_that.name,_that.startedAt,_that.endedAt,_that.templateId,_that.planDayId,_that.notes,_that.totalVolumeKg,_that.caloriesKcal,_that.source,_that.healthSynced,_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkoutSession extends WorkoutSession {
  const _WorkoutSession({required this.id, required this.name, required this.startedAt, this.endedAt, this.templateId, this.planDayId, this.notes, this.totalVolumeKg = 0, this.caloriesKcal, this.source = WorkoutSource.live, this.healthSynced = false,  List<ExerciseEntry> entries = const <ExerciseEntry>[]}): _entries = entries,super._();
  factory _WorkoutSession.fromJson(Map<String, dynamic> json) => _$WorkoutSessionFromJson(json);

@override final  String id;
@override final  String name;
@override final  DateTime startedAt;
@override final  DateTime? endedAt;
@override final  String? templateId;
@override final  String? planDayId;
@override final  String? notes;
@override@JsonKey() final  double totalVolumeKg;
@override final  double? caloriesKcal;
@override@JsonKey() final  WorkoutSource source;
@override@JsonKey() final  bool healthSynced;
 final  List<ExerciseEntry> _entries;
@override@JsonKey() List<ExerciseEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of WorkoutSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutSessionCopyWith<_WorkoutSession> get copyWith => __$WorkoutSessionCopyWithImpl<_WorkoutSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutSessionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutSession&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.planDayId, planDayId) || other.planDayId == planDayId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.totalVolumeKg, totalVolumeKg) || other.totalVolumeKg == totalVolumeKg)&&(identical(other.caloriesKcal, caloriesKcal) || other.caloriesKcal == caloriesKcal)&&(identical(other.source, source) || other.source == source)&&(identical(other.healthSynced, healthSynced) || other.healthSynced == healthSynced)&&const DeepCollectionEquality().equals(other.entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,startedAt,endedAt,templateId,planDayId,notes,totalVolumeKg,caloriesKcal,source,healthSynced,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'WorkoutSession(id: $id, name: $name, startedAt: $startedAt, endedAt: $endedAt, templateId: $templateId, planDayId: $planDayId, notes: $notes, totalVolumeKg: $totalVolumeKg, caloriesKcal: $caloriesKcal, source: $source, healthSynced: $healthSynced, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$WorkoutSessionCopyWith<$Res> implements $WorkoutSessionCopyWith<$Res> {
  factory _$WorkoutSessionCopyWith(_WorkoutSession value, $Res Function(_WorkoutSession) _then) = __$WorkoutSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, DateTime startedAt, DateTime? endedAt, String? templateId, String? planDayId, String? notes, double totalVolumeKg, double? caloriesKcal, WorkoutSource source, bool healthSynced, List<ExerciseEntry> entries
});




}
/// @nodoc
class __$WorkoutSessionCopyWithImpl<$Res>
    implements _$WorkoutSessionCopyWith<$Res> {
  __$WorkoutSessionCopyWithImpl(this._self, this._then);

  final _WorkoutSession _self;
  final $Res Function(_WorkoutSession) _then;

/// Create a copy of WorkoutSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? startedAt = null,Object? endedAt = freezed,Object? templateId = freezed,Object? planDayId = freezed,Object? notes = freezed,Object? totalVolumeKg = null,Object? caloriesKcal = freezed,Object? source = null,Object? healthSynced = null,Object? entries = null,}) {
  return _then(_WorkoutSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,planDayId: freezed == planDayId ? _self.planDayId : planDayId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,totalVolumeKg: null == totalVolumeKg ? _self.totalVolumeKg : totalVolumeKg // ignore: cast_nullable_to_non_nullable
as double,caloriesKcal: freezed == caloriesKcal ? _self.caloriesKcal : caloriesKcal // ignore: cast_nullable_to_non_nullable
as double?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as WorkoutSource,healthSynced: null == healthSynced ? _self.healthSynced : healthSynced // ignore: cast_nullable_to_non_nullable
as bool,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ExerciseEntry>,
  ));
}


}

// dart format on
