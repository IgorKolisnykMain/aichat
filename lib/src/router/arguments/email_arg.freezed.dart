// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmailArg _$EmailArgFromJson(Map<String, dynamic> json) {
  return _EmailArg.fromJson(json);
}

/// @nodoc
mixin _$EmailArg {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this EmailArg to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailArgCopyWith<EmailArg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailArgCopyWith<$Res> {
  factory $EmailArgCopyWith(EmailArg value, $Res Function(EmailArg) then) = _$EmailArgCopyWithImpl<$Res, EmailArg>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailArgCopyWithImpl<$Res, $Val extends EmailArg> implements $EmailArgCopyWith<$Res> {
  _$EmailArgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmailArgImplCopyWith<$Res> implements $EmailArgCopyWith<$Res> {
  factory _$$EmailArgImplCopyWith(_$EmailArgImpl value, $Res Function(_$EmailArgImpl) then) =
      __$$EmailArgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailArgImplCopyWithImpl<$Res> extends _$EmailArgCopyWithImpl<$Res, _$EmailArgImpl>
    implements _$$EmailArgImplCopyWith<$Res> {
  __$$EmailArgImplCopyWithImpl(_$EmailArgImpl _value, $Res Function(_$EmailArgImpl) _then) : super(_value, _then);

  /// Create a copy of EmailArg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$EmailArgImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailArgImpl implements _EmailArg {
  _$EmailArgImpl({required this.email});

  factory _$EmailArgImpl.fromJson(Map<String, dynamic> json) => _$$EmailArgImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'EmailArg(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailArgImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of EmailArg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailArgImplCopyWith<_$EmailArgImpl> get copyWith =>
      __$$EmailArgImplCopyWithImpl<_$EmailArgImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailArgImplToJson(this);
  }
}

abstract class _EmailArg implements EmailArg {
  factory _EmailArg({required final String email}) = _$EmailArgImpl;

  factory _EmailArg.fromJson(Map<String, dynamic> json) = _$EmailArgImpl.fromJson;

  @override
  String get email;

  /// Create a copy of EmailArg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailArgImplCopyWith<_$EmailArgImpl> get copyWith => throw _privateConstructorUsedError;
}
