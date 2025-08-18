// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_id_treads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserIdTreads {

 List<String> get threads;
/// Create a copy of UserIdTreads
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserIdTreadsCopyWith<UserIdTreads> get copyWith => _$UserIdTreadsCopyWithImpl<UserIdTreads>(this as UserIdTreads, _$identity);

  /// Serializes this UserIdTreads to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserIdTreads&&const DeepCollectionEquality().equals(other.threads, threads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(threads));

@override
String toString() {
  return 'UserIdTreads(threads: $threads)';
}


}

/// @nodoc
abstract mixin class $UserIdTreadsCopyWith<$Res>  {
  factory $UserIdTreadsCopyWith(UserIdTreads value, $Res Function(UserIdTreads) _then) = _$UserIdTreadsCopyWithImpl;
@useResult
$Res call({
 List<String> threads
});




}
/// @nodoc
class _$UserIdTreadsCopyWithImpl<$Res>
    implements $UserIdTreadsCopyWith<$Res> {
  _$UserIdTreadsCopyWithImpl(this._self, this._then);

  final UserIdTreads _self;
  final $Res Function(UserIdTreads) _then;

/// Create a copy of UserIdTreads
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? threads = null,}) {
  return _then(_self.copyWith(
threads: null == threads ? _self.threads : threads // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserIdTreads].
extension UserIdTreadsPatterns on UserIdTreads {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserIdTreads value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserIdTreads() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserIdTreads value)  $default,){
final _that = this;
switch (_that) {
case _UserIdTreads():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserIdTreads value)?  $default,){
final _that = this;
switch (_that) {
case _UserIdTreads() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> threads)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserIdTreads() when $default != null:
return $default(_that.threads);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> threads)  $default,) {final _that = this;
switch (_that) {
case _UserIdTreads():
return $default(_that.threads);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> threads)?  $default,) {final _that = this;
switch (_that) {
case _UserIdTreads() when $default != null:
return $default(_that.threads);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserIdTreads implements UserIdTreads {
   _UserIdTreads({required final  List<String> threads}): _threads = threads;
  factory _UserIdTreads.fromJson(Map<String, dynamic> json) => _$UserIdTreadsFromJson(json);

 final  List<String> _threads;
@override List<String> get threads {
  if (_threads is EqualUnmodifiableListView) return _threads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_threads);
}


/// Create a copy of UserIdTreads
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserIdTreadsCopyWith<_UserIdTreads> get copyWith => __$UserIdTreadsCopyWithImpl<_UserIdTreads>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserIdTreadsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserIdTreads&&const DeepCollectionEquality().equals(other._threads, _threads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_threads));

@override
String toString() {
  return 'UserIdTreads(threads: $threads)';
}


}

/// @nodoc
abstract mixin class _$UserIdTreadsCopyWith<$Res> implements $UserIdTreadsCopyWith<$Res> {
  factory _$UserIdTreadsCopyWith(_UserIdTreads value, $Res Function(_UserIdTreads) _then) = __$UserIdTreadsCopyWithImpl;
@override @useResult
$Res call({
 List<String> threads
});




}
/// @nodoc
class __$UserIdTreadsCopyWithImpl<$Res>
    implements _$UserIdTreadsCopyWith<$Res> {
  __$UserIdTreadsCopyWithImpl(this._self, this._then);

  final _UserIdTreads _self;
  final $Res Function(_UserIdTreads) _then;

/// Create a copy of UserIdTreads
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? threads = null,}) {
  return _then(_UserIdTreads(
threads: null == threads ? _self._threads : threads // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
