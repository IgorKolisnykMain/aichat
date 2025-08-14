// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_recovery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasswordRecoveryState {

 PasswordRecoveryStage get stage; String get email;
/// Create a copy of PasswordRecoveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordRecoveryStateCopyWith<PasswordRecoveryState> get copyWith => _$PasswordRecoveryStateCopyWithImpl<PasswordRecoveryState>(this as PasswordRecoveryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordRecoveryState&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,stage,email);

@override
String toString() {
  return 'PasswordRecoveryState(stage: $stage, email: $email)';
}


}

/// @nodoc
abstract mixin class $PasswordRecoveryStateCopyWith<$Res>  {
  factory $PasswordRecoveryStateCopyWith(PasswordRecoveryState value, $Res Function(PasswordRecoveryState) _then) = _$PasswordRecoveryStateCopyWithImpl;
@useResult
$Res call({
 PasswordRecoveryStage stage, String email
});




}
/// @nodoc
class _$PasswordRecoveryStateCopyWithImpl<$Res>
    implements $PasswordRecoveryStateCopyWith<$Res> {
  _$PasswordRecoveryStateCopyWithImpl(this._self, this._then);

  final PasswordRecoveryState _self;
  final $Res Function(PasswordRecoveryState) _then;

/// Create a copy of PasswordRecoveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stage = null,Object? email = null,}) {
  return _then(_self.copyWith(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as PasswordRecoveryStage,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordRecoveryState].
extension PasswordRecoveryStatePatterns on PasswordRecoveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordRecoveryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordRecoveryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordRecoveryState value)  $default,){
final _that = this;
switch (_that) {
case _PasswordRecoveryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordRecoveryState value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordRecoveryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PasswordRecoveryStage stage,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordRecoveryState() when $default != null:
return $default(_that.stage,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PasswordRecoveryStage stage,  String email)  $default,) {final _that = this;
switch (_that) {
case _PasswordRecoveryState():
return $default(_that.stage,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PasswordRecoveryStage stage,  String email)?  $default,) {final _that = this;
switch (_that) {
case _PasswordRecoveryState() when $default != null:
return $default(_that.stage,_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _PasswordRecoveryState implements PasswordRecoveryState {
  const _PasswordRecoveryState({this.stage = PasswordRecoveryStage.init, this.email = ''});
  

@override@JsonKey() final  PasswordRecoveryStage stage;
@override@JsonKey() final  String email;

/// Create a copy of PasswordRecoveryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordRecoveryStateCopyWith<_PasswordRecoveryState> get copyWith => __$PasswordRecoveryStateCopyWithImpl<_PasswordRecoveryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordRecoveryState&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,stage,email);

@override
String toString() {
  return 'PasswordRecoveryState(stage: $stage, email: $email)';
}


}

/// @nodoc
abstract mixin class _$PasswordRecoveryStateCopyWith<$Res> implements $PasswordRecoveryStateCopyWith<$Res> {
  factory _$PasswordRecoveryStateCopyWith(_PasswordRecoveryState value, $Res Function(_PasswordRecoveryState) _then) = __$PasswordRecoveryStateCopyWithImpl;
@override @useResult
$Res call({
 PasswordRecoveryStage stage, String email
});




}
/// @nodoc
class __$PasswordRecoveryStateCopyWithImpl<$Res>
    implements _$PasswordRecoveryStateCopyWith<$Res> {
  __$PasswordRecoveryStateCopyWithImpl(this._self, this._then);

  final _PasswordRecoveryState _self;
  final $Res Function(_PasswordRecoveryState) _then;

/// Create a copy of PasswordRecoveryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stage = null,Object? email = null,}) {
  return _then(_PasswordRecoveryState(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as PasswordRecoveryStage,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
