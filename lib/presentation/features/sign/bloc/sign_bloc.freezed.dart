// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SignState {
  SignStage get stage => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  /// Create a copy of SignState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignStateCopyWith<SignState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignStateCopyWith<$Res> {
  factory $SignStateCopyWith(SignState value, $Res Function(SignState) then) =
      _$SignStateCopyWithImpl<$Res, SignState>;
  @useResult
  $Res call({SignStage stage, Object? error});
}

/// @nodoc
class _$SignStateCopyWithImpl<$Res, $Val extends SignState>
    implements $SignStateCopyWith<$Res> {
  _$SignStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stage = null, Object? error = freezed}) {
    return _then(
      _value.copyWith(
            stage: null == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as SignStage,
            error: freezed == error ? _value.error : error,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignStateImplCopyWith<$Res>
    implements $SignStateCopyWith<$Res> {
  factory _$$SignStateImplCopyWith(
    _$SignStateImpl value,
    $Res Function(_$SignStateImpl) then,
  ) = __$$SignStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignStage stage, Object? error});
}

/// @nodoc
class __$$SignStateImplCopyWithImpl<$Res>
    extends _$SignStateCopyWithImpl<$Res, _$SignStateImpl>
    implements _$$SignStateImplCopyWith<$Res> {
  __$$SignStateImplCopyWithImpl(
    _$SignStateImpl _value,
    $Res Function(_$SignStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? stage = null, Object? error = freezed}) {
    return _then(
      _$SignStateImpl(
        stage: null == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as SignStage,
        error: freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$SignStateImpl implements _SignState {
  const _$SignStateImpl({required this.stage, this.error});

  @override
  final SignStage stage;
  @override
  final Object? error;

  @override
  String toString() {
    return 'SignState(stage: $stage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignStateImpl &&
            (identical(other.stage, stage) || other.stage == stage) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    stage,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of SignState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignStateImplCopyWith<_$SignStateImpl> get copyWith =>
      __$$SignStateImplCopyWithImpl<_$SignStateImpl>(this, _$identity);
}

abstract class _SignState implements SignState {
  const factory _SignState({
    required final SignStage stage,
    final Object? error,
  }) = _$SignStateImpl;

  @override
  SignStage get stage;
  @override
  Object? get error;

  /// Create a copy of SignState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignStateImplCopyWith<_$SignStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
