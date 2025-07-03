// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_recovery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PasswordRecoveryState {
  PasswordRecoveryStage get stage => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Create a copy of PasswordRecoveryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordRecoveryStateCopyWith<PasswordRecoveryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordRecoveryStateCopyWith<$Res> {
  factory $PasswordRecoveryStateCopyWith(
    PasswordRecoveryState value,
    $Res Function(PasswordRecoveryState) then,
  ) = _$PasswordRecoveryStateCopyWithImpl<$Res, PasswordRecoveryState>;
  @useResult
  $Res call({PasswordRecoveryStage stage, String email});
}

/// @nodoc
class _$PasswordRecoveryStateCopyWithImpl<
  $Res,
  $Val extends PasswordRecoveryState
>
    implements $PasswordRecoveryStateCopyWith<$Res> {
  _$PasswordRecoveryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordRecoveryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stage = null, Object? email = null}) {
    return _then(
      _value.copyWith(
            stage: null == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as PasswordRecoveryStage,
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
abstract class _$$PasswordRecoveryStateImplCopyWith<$Res>
    implements $PasswordRecoveryStateCopyWith<$Res> {
  factory _$$PasswordRecoveryStateImplCopyWith(
    _$PasswordRecoveryStateImpl value,
    $Res Function(_$PasswordRecoveryStateImpl) then,
  ) = __$$PasswordRecoveryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PasswordRecoveryStage stage, String email});
}

/// @nodoc
class __$$PasswordRecoveryStateImplCopyWithImpl<$Res>
    extends
        _$PasswordRecoveryStateCopyWithImpl<$Res, _$PasswordRecoveryStateImpl>
    implements _$$PasswordRecoveryStateImplCopyWith<$Res> {
  __$$PasswordRecoveryStateImplCopyWithImpl(
    _$PasswordRecoveryStateImpl _value,
    $Res Function(_$PasswordRecoveryStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordRecoveryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stage = null, Object? email = null}) {
    return _then(
      _$PasswordRecoveryStateImpl(
        stage: null == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as PasswordRecoveryStage,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordRecoveryStateImpl implements _PasswordRecoveryState {
  const _$PasswordRecoveryStateImpl({
    this.stage = PasswordRecoveryStage.init,
    this.email = '',
  });

  @override
  @JsonKey()
  final PasswordRecoveryStage stage;
  @override
  @JsonKey()
  final String email;

  @override
  String toString() {
    return 'PasswordRecoveryState(stage: $stage, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordRecoveryStateImpl &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stage, email);

  /// Create a copy of PasswordRecoveryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordRecoveryStateImplCopyWith<_$PasswordRecoveryStateImpl>
  get copyWith =>
      __$$PasswordRecoveryStateImplCopyWithImpl<_$PasswordRecoveryStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PasswordRecoveryState implements PasswordRecoveryState {
  const factory _PasswordRecoveryState({
    final PasswordRecoveryStage stage,
    final String email,
  }) = _$PasswordRecoveryStateImpl;

  @override
  PasswordRecoveryStage get stage;
  @override
  String get email;

  /// Create a copy of PasswordRecoveryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordRecoveryStateImplCopyWith<_$PasswordRecoveryStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
