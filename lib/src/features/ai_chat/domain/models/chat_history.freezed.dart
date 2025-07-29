// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatHistory _$ChatHistoryFromJson(Map<String, dynamic> json) {
  return _ChatHistory.fromJson(json);
}

/// @nodoc
mixin _$ChatHistory {
  List<AiMessage> get messages => throw _privateConstructorUsedError;

  /// Serializes this ChatHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatHistoryCopyWith<ChatHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatHistoryCopyWith<$Res> {
  factory $ChatHistoryCopyWith(
    ChatHistory value,
    $Res Function(ChatHistory) then,
  ) = _$ChatHistoryCopyWithImpl<$Res, ChatHistory>;
  @useResult
  $Res call({List<AiMessage> messages});
}

/// @nodoc
class _$ChatHistoryCopyWithImpl<$Res, $Val extends ChatHistory>
    implements $ChatHistoryCopyWith<$Res> {
  _$ChatHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messages = null}) {
    return _then(
      _value.copyWith(
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<AiMessage>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatHistoryImplCopyWith<$Res>
    implements $ChatHistoryCopyWith<$Res> {
  factory _$$ChatHistoryImplCopyWith(
    _$ChatHistoryImpl value,
    $Res Function(_$ChatHistoryImpl) then,
  ) = __$$ChatHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AiMessage> messages});
}

/// @nodoc
class __$$ChatHistoryImplCopyWithImpl<$Res>
    extends _$ChatHistoryCopyWithImpl<$Res, _$ChatHistoryImpl>
    implements _$$ChatHistoryImplCopyWith<$Res> {
  __$$ChatHistoryImplCopyWithImpl(
    _$ChatHistoryImpl _value,
    $Res Function(_$ChatHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messages = null}) {
    return _then(
      _$ChatHistoryImpl(
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<AiMessage>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatHistoryImpl implements _ChatHistory {
  const _$ChatHistoryImpl({required final List<AiMessage> messages})
    : _messages = messages;

  factory _$ChatHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatHistoryImplFromJson(json);

  final List<AiMessage> _messages;
  @override
  List<AiMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatHistory(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatHistoryImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ChatHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatHistoryImplCopyWith<_$ChatHistoryImpl> get copyWith =>
      __$$ChatHistoryImplCopyWithImpl<_$ChatHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatHistoryImplToJson(this);
  }
}

abstract class _ChatHistory implements ChatHistory {
  const factory _ChatHistory({required final List<AiMessage> messages}) =
      _$ChatHistoryImpl;

  factory _ChatHistory.fromJson(Map<String, dynamic> json) =
      _$ChatHistoryImpl.fromJson;

  @override
  List<AiMessage> get messages;

  /// Create a copy of ChatHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatHistoryImplCopyWith<_$ChatHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
