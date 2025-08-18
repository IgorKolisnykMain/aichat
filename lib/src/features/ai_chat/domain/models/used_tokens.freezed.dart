// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'used_tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsedTokens {

 List<String> get usedTokens;
/// Create a copy of UsedTokens
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsedTokensCopyWith<UsedTokens> get copyWith => _$UsedTokensCopyWithImpl<UsedTokens>(this as UsedTokens, _$identity);

  /// Serializes this UsedTokens to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsedTokens&&const DeepCollectionEquality().equals(other.usedTokens, usedTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(usedTokens));

@override
String toString() {
  return 'UsedTokens(usedTokens: $usedTokens)';
}


}

/// @nodoc
abstract mixin class $UsedTokensCopyWith<$Res>  {
  factory $UsedTokensCopyWith(UsedTokens value, $Res Function(UsedTokens) _then) = _$UsedTokensCopyWithImpl;
@useResult
$Res call({
 List<String> usedTokens
});




}
/// @nodoc
class _$UsedTokensCopyWithImpl<$Res>
    implements $UsedTokensCopyWith<$Res> {
  _$UsedTokensCopyWithImpl(this._self, this._then);

  final UsedTokens _self;
  final $Res Function(UsedTokens) _then;

/// Create a copy of UsedTokens
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usedTokens = null,}) {
  return _then(_self.copyWith(
usedTokens: null == usedTokens ? _self.usedTokens : usedTokens // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UsedTokens].
extension UsedTokensPatterns on UsedTokens {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsedTokens value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsedTokens() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsedTokens value)  $default,){
final _that = this;
switch (_that) {
case _UsedTokens():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsedTokens value)?  $default,){
final _that = this;
switch (_that) {
case _UsedTokens() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> usedTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsedTokens() when $default != null:
return $default(_that.usedTokens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> usedTokens)  $default,) {final _that = this;
switch (_that) {
case _UsedTokens():
return $default(_that.usedTokens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> usedTokens)?  $default,) {final _that = this;
switch (_that) {
case _UsedTokens() when $default != null:
return $default(_that.usedTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsedTokens implements UsedTokens {
  const _UsedTokens({final  List<String> usedTokens = const []}): _usedTokens = usedTokens;
  factory _UsedTokens.fromJson(Map<String, dynamic> json) => _$UsedTokensFromJson(json);

 final  List<String> _usedTokens;
@override@JsonKey() List<String> get usedTokens {
  if (_usedTokens is EqualUnmodifiableListView) return _usedTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usedTokens);
}


/// Create a copy of UsedTokens
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsedTokensCopyWith<_UsedTokens> get copyWith => __$UsedTokensCopyWithImpl<_UsedTokens>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsedTokensToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsedTokens&&const DeepCollectionEquality().equals(other._usedTokens, _usedTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_usedTokens));

@override
String toString() {
  return 'UsedTokens(usedTokens: $usedTokens)';
}


}

/// @nodoc
abstract mixin class _$UsedTokensCopyWith<$Res> implements $UsedTokensCopyWith<$Res> {
  factory _$UsedTokensCopyWith(_UsedTokens value, $Res Function(_UsedTokens) _then) = __$UsedTokensCopyWithImpl;
@override @useResult
$Res call({
 List<String> usedTokens
});




}
/// @nodoc
class __$UsedTokensCopyWithImpl<$Res>
    implements _$UsedTokensCopyWith<$Res> {
  __$UsedTokensCopyWithImpl(this._self, this._then);

  final _UsedTokens _self;
  final $Res Function(_UsedTokens) _then;

/// Create a copy of UsedTokens
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usedTokens = null,}) {
  return _then(_UsedTokens(
usedTokens: null == usedTokens ? _self._usedTokens : usedTokens // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
