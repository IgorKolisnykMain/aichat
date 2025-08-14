// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignState {

 SignStage get stage;
/// Create a copy of SignState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignStateCopyWith<SignState> get copyWith => _$SignStateCopyWithImpl<SignState>(this as SignState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignState&&(identical(other.stage, stage) || other.stage == stage));
}


@override
int get hashCode => Object.hash(runtimeType,stage);

@override
String toString() {
  return 'SignState(stage: $stage)';
}


}

/// @nodoc
abstract mixin class $SignStateCopyWith<$Res>  {
  factory $SignStateCopyWith(SignState value, $Res Function(SignState) _then) = _$SignStateCopyWithImpl;
@useResult
$Res call({
 SignStage stage
});




}
/// @nodoc
class _$SignStateCopyWithImpl<$Res>
    implements $SignStateCopyWith<$Res> {
  _$SignStateCopyWithImpl(this._self, this._then);

  final SignState _self;
  final $Res Function(SignState) _then;

/// Create a copy of SignState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stage = null,}) {
  return _then(_self.copyWith(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as SignStage,
  ));
}

}


/// Adds pattern-matching-related methods to [SignState].
extension SignStatePatterns on SignState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignState value)  $default,){
final _that = this;
switch (_that) {
case _SignState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignState value)?  $default,){
final _that = this;
switch (_that) {
case _SignState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SignStage stage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignState() when $default != null:
return $default(_that.stage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SignStage stage)  $default,) {final _that = this;
switch (_that) {
case _SignState():
return $default(_that.stage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SignStage stage)?  $default,) {final _that = this;
switch (_that) {
case _SignState() when $default != null:
return $default(_that.stage);case _:
  return null;

}
}

}

/// @nodoc


class _SignState implements SignState {
  const _SignState({required this.stage});
  

@override final  SignStage stage;

/// Create a copy of SignState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignStateCopyWith<_SignState> get copyWith => __$SignStateCopyWithImpl<_SignState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignState&&(identical(other.stage, stage) || other.stage == stage));
}


@override
int get hashCode => Object.hash(runtimeType,stage);

@override
String toString() {
  return 'SignState(stage: $stage)';
}


}

/// @nodoc
abstract mixin class _$SignStateCopyWith<$Res> implements $SignStateCopyWith<$Res> {
  factory _$SignStateCopyWith(_SignState value, $Res Function(_SignState) _then) = __$SignStateCopyWithImpl;
@override @useResult
$Res call({
 SignStage stage
});




}
/// @nodoc
class __$SignStateCopyWithImpl<$Res>
    implements _$SignStateCopyWith<$Res> {
  __$SignStateCopyWithImpl(this._self, this._then);

  final _SignState _self;
  final $Res Function(_SignState) _then;

/// Create a copy of SignState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stage = null,}) {
  return _then(_SignState(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as SignStage,
  ));
}


}

// dart format on
