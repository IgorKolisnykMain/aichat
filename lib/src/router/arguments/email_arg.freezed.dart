// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailArg {

 String get email;
/// Create a copy of EmailArg
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailArgCopyWith<EmailArg> get copyWith => _$EmailArgCopyWithImpl<EmailArg>(this as EmailArg, _$identity);

  /// Serializes this EmailArg to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailArg&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'EmailArg(email: $email)';
}


}

/// @nodoc
abstract mixin class $EmailArgCopyWith<$Res>  {
  factory $EmailArgCopyWith(EmailArg value, $Res Function(EmailArg) _then) = _$EmailArgCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$EmailArgCopyWithImpl<$Res>
    implements $EmailArgCopyWith<$Res> {
  _$EmailArgCopyWithImpl(this._self, this._then);

  final EmailArg _self;
  final $Res Function(EmailArg) _then;

/// Create a copy of EmailArg
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailArg].
extension EmailArgPatterns on EmailArg {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailArg value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailArg() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailArg value)  $default,){
final _that = this;
switch (_that) {
case _EmailArg():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailArg value)?  $default,){
final _that = this;
switch (_that) {
case _EmailArg() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailArg() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email)  $default,) {final _that = this;
switch (_that) {
case _EmailArg():
return $default(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email)?  $default,) {final _that = this;
switch (_that) {
case _EmailArg() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailArg implements EmailArg {
   _EmailArg({required this.email});
  factory _EmailArg.fromJson(Map<String, dynamic> json) => _$EmailArgFromJson(json);

@override final  String email;

/// Create a copy of EmailArg
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailArgCopyWith<_EmailArg> get copyWith => __$EmailArgCopyWithImpl<_EmailArg>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailArgToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailArg&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'EmailArg(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailArgCopyWith<$Res> implements $EmailArgCopyWith<$Res> {
  factory _$EmailArgCopyWith(_EmailArg value, $Res Function(_EmailArg) _then) = __$EmailArgCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EmailArgCopyWithImpl<$Res>
    implements _$EmailArgCopyWith<$Res> {
  __$EmailArgCopyWithImpl(this._self, this._then);

  final _EmailArg _self;
  final $Res Function(_EmailArg) _then;

/// Create a copy of EmailArg
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EmailArg(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
