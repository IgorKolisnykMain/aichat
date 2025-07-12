// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_tutor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AiTutorState {
  AiTutorStage get stage => throw _privateConstructorUsedError;
  List<AiMessage> get messages => throw _privateConstructorUsedError;
  AiMessage? get aiAnsweringOnQuestion => throw _privateConstructorUsedError;
  String? get currentThreadId => throw _privateConstructorUsedError;
  List<String> get userThreads => throw _privateConstructorUsedError;
  String? get streamingResponse => throw _privateConstructorUsedError;
  bool get isStreaming => throw _privateConstructorUsedError;

  /// Create a copy of AiTutorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiTutorStateCopyWith<AiTutorState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiTutorStateCopyWith<$Res> {
  factory $AiTutorStateCopyWith(AiTutorState value, $Res Function(AiTutorState) then) =
      _$AiTutorStateCopyWithImpl<$Res, AiTutorState>;
  @useResult
  $Res call({
    AiTutorStage stage,
    List<AiMessage> messages,
    AiMessage? aiAnsweringOnQuestion,
    String? currentThreadId,
    List<String> userThreads,
    String? streamingResponse,
    bool isStreaming,
  });

  $AiMessageCopyWith<$Res>? get aiAnsweringOnQuestion;
}

/// @nodoc
class _$AiTutorStateCopyWithImpl<$Res, $Val extends AiTutorState> implements $AiTutorStateCopyWith<$Res> {
  _$AiTutorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiTutorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? messages = null,
    Object? aiAnsweringOnQuestion = freezed,
    Object? currentThreadId = freezed,
    Object? userThreads = null,
    Object? streamingResponse = freezed,
    Object? isStreaming = null,
  }) {
    return _then(
      _value.copyWith(
            stage: null == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as AiTutorStage,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<AiMessage>,
            aiAnsweringOnQuestion: freezed == aiAnsweringOnQuestion
                ? _value.aiAnsweringOnQuestion
                : aiAnsweringOnQuestion // ignore: cast_nullable_to_non_nullable
                      as AiMessage?,
            currentThreadId: freezed == currentThreadId
                ? _value.currentThreadId
                : currentThreadId // ignore: cast_nullable_to_non_nullable
                      as String?,
            userThreads: null == userThreads
                ? _value.userThreads
                : userThreads // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            streamingResponse: freezed == streamingResponse
                ? _value.streamingResponse
                : streamingResponse // ignore: cast_nullable_to_non_nullable
                      as String?,
            isStreaming: null == isStreaming
                ? _value.isStreaming
                : isStreaming // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of AiTutorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AiMessageCopyWith<$Res>? get aiAnsweringOnQuestion {
    if (_value.aiAnsweringOnQuestion == null) {
      return null;
    }

    return $AiMessageCopyWith<$Res>(_value.aiAnsweringOnQuestion!, (value) {
      return _then(_value.copyWith(aiAnsweringOnQuestion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AiTutorStateImplCopyWith<$Res> implements $AiTutorStateCopyWith<$Res> {
  factory _$$AiTutorStateImplCopyWith(_$AiTutorStateImpl value, $Res Function(_$AiTutorStateImpl) then) =
      __$$AiTutorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AiTutorStage stage,
    List<AiMessage> messages,
    AiMessage? aiAnsweringOnQuestion,
    String? currentThreadId,
    List<String> userThreads,
    String? streamingResponse,
    bool isStreaming,
  });

  @override
  $AiMessageCopyWith<$Res>? get aiAnsweringOnQuestion;
}

/// @nodoc
class __$$AiTutorStateImplCopyWithImpl<$Res> extends _$AiTutorStateCopyWithImpl<$Res, _$AiTutorStateImpl>
    implements _$$AiTutorStateImplCopyWith<$Res> {
  __$$AiTutorStateImplCopyWithImpl(_$AiTutorStateImpl _value, $Res Function(_$AiTutorStateImpl) _then)
    : super(_value, _then);

  /// Create a copy of AiTutorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? messages = null,
    Object? aiAnsweringOnQuestion = freezed,
    Object? currentThreadId = freezed,
    Object? userThreads = null,
    Object? streamingResponse = freezed,
    Object? isStreaming = null,
  }) {
    return _then(
      _$AiTutorStateImpl(
        stage: null == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as AiTutorStage,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<AiMessage>,
        aiAnsweringOnQuestion: freezed == aiAnsweringOnQuestion
            ? _value.aiAnsweringOnQuestion
            : aiAnsweringOnQuestion // ignore: cast_nullable_to_non_nullable
                  as AiMessage?,
        currentThreadId: freezed == currentThreadId
            ? _value.currentThreadId
            : currentThreadId // ignore: cast_nullable_to_non_nullable
                  as String?,
        userThreads: null == userThreads
            ? _value._userThreads
            : userThreads // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        streamingResponse: freezed == streamingResponse
            ? _value.streamingResponse
            : streamingResponse // ignore: cast_nullable_to_non_nullable
                  as String?,
        isStreaming: null == isStreaming
            ? _value.isStreaming
            : isStreaming // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$AiTutorStateImpl implements _AiTutorState {
  const _$AiTutorStateImpl({
    required this.stage,
    required final List<AiMessage> messages,
    this.aiAnsweringOnQuestion,
    this.currentThreadId,
    final List<String> userThreads = const [],
    this.streamingResponse,
    this.isStreaming = false,
  }) : _messages = messages,
       _userThreads = userThreads;

  @override
  final AiTutorStage stage;
  final List<AiMessage> _messages;
  @override
  List<AiMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final AiMessage? aiAnsweringOnQuestion;
  @override
  final String? currentThreadId;
  final List<String> _userThreads;
  @override
  @JsonKey()
  List<String> get userThreads {
    if (_userThreads is EqualUnmodifiableListView) return _userThreads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userThreads);
  }

  @override
  final String? streamingResponse;
  @override
  @JsonKey()
  final bool isStreaming;

  @override
  String toString() {
    return 'AiTutorState(stage: $stage, messages: $messages, aiAnsweringOnQuestion: $aiAnsweringOnQuestion, currentThreadId: $currentThreadId, userThreads: $userThreads, streamingResponse: $streamingResponse, isStreaming: $isStreaming)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorStateImpl &&
            (identical(other.stage, stage) || other.stage == stage) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.aiAnsweringOnQuestion, aiAnsweringOnQuestion) ||
                other.aiAnsweringOnQuestion == aiAnsweringOnQuestion) &&
            (identical(other.currentThreadId, currentThreadId) || other.currentThreadId == currentThreadId) &&
            const DeepCollectionEquality().equals(other._userThreads, _userThreads) &&
            (identical(other.streamingResponse, streamingResponse) || other.streamingResponse == streamingResponse) &&
            (identical(other.isStreaming, isStreaming) || other.isStreaming == isStreaming));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    stage,
    const DeepCollectionEquality().hash(_messages),
    aiAnsweringOnQuestion,
    currentThreadId,
    const DeepCollectionEquality().hash(_userThreads),
    streamingResponse,
    isStreaming,
  );

  /// Create a copy of AiTutorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorStateImplCopyWith<_$AiTutorStateImpl> get copyWith =>
      __$$AiTutorStateImplCopyWithImpl<_$AiTutorStateImpl>(this, _$identity);
}

abstract class _AiTutorState implements AiTutorState {
  const factory _AiTutorState({
    required final AiTutorStage stage,
    required final List<AiMessage> messages,
    final AiMessage? aiAnsweringOnQuestion,
    final String? currentThreadId,
    final List<String> userThreads,
    final String? streamingResponse,
    final bool isStreaming,
  }) = _$AiTutorStateImpl;

  @override
  AiTutorStage get stage;
  @override
  List<AiMessage> get messages;
  @override
  AiMessage? get aiAnsweringOnQuestion;
  @override
  String? get currentThreadId;
  @override
  List<String> get userThreads;
  @override
  String? get streamingResponse;
  @override
  bool get isStreaming;

  /// Create a copy of AiTutorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorStateImplCopyWith<_$AiTutorStateImpl> get copyWith => throw _privateConstructorUsedError;
}
