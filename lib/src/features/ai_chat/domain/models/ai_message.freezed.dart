// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiMessage _$AiMessageFromJson(Map<String, dynamic> json) {
  return _AiMessage.fromJson(json);
}

/// @nodoc
mixin _$AiMessage {
  String get message => throw _privateConstructorUsedError;
  AiChatItemType get type => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String? get customPrompt => throw _privateConstructorUsedError;

  /// Serializes this AiMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiMessageCopyWith<AiMessage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiMessageCopyWith<$Res> {
  factory $AiMessageCopyWith(AiMessage value, $Res Function(AiMessage) then) = _$AiMessageCopyWithImpl<$Res, AiMessage>;
  @useResult
  $Res call({
    String message,
    AiChatItemType type,
    String date,
    String? customPrompt,
  });
}

/// @nodoc
class _$AiMessageCopyWithImpl<$Res, $Val extends AiMessage> implements $AiMessageCopyWith<$Res> {
  _$AiMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? date = null,
    Object? customPrompt = freezed,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AiChatItemType,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            customPrompt: freezed == customPrompt
                ? _value.customPrompt
                : customPrompt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiMessageImplCopyWith<$Res> implements $AiMessageCopyWith<$Res> {
  factory _$$AiMessageImplCopyWith(
    _$AiMessageImpl value,
    $Res Function(_$AiMessageImpl) then,
  ) = __$$AiMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    AiChatItemType type,
    String date,
    String? customPrompt,
  });
}

/// @nodoc
class __$$AiMessageImplCopyWithImpl<$Res> extends _$AiMessageCopyWithImpl<$Res, _$AiMessageImpl>
    implements _$$AiMessageImplCopyWith<$Res> {
  __$$AiMessageImplCopyWithImpl(
    _$AiMessageImpl _value,
    $Res Function(_$AiMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? date = null,
    Object? customPrompt = freezed,
  }) {
    return _then(
      _$AiMessageImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AiChatItemType,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        customPrompt: freezed == customPrompt
            ? _value.customPrompt
            : customPrompt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiMessageImpl extends _AiMessage {
  const _$AiMessageImpl({
    required this.message,
    required this.type,
    required this.date,
    this.customPrompt,
  }) : super._();

  factory _$AiMessageImpl.fromJson(Map<String, dynamic> json) => _$$AiMessageImplFromJson(json);

  @override
  final String message;
  @override
  final AiChatItemType type;
  @override
  final String date;
  @override
  final String? customPrompt;

  @override
  String toString() {
    return 'AiMessage._base(message: $message, type: $type, date: $date, customPrompt: $customPrompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiMessageImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.customPrompt, customPrompt) || other.customPrompt == customPrompt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, type, date, customPrompt);

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiMessageImplCopyWith<_$AiMessageImpl> get copyWith =>
      __$$AiMessageImplCopyWithImpl<_$AiMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiMessageImplToJson(this);
  }
}

abstract class _AiMessage extends AiMessage {
  const factory _AiMessage({
    required final String message,
    required final AiChatItemType type,
    required final String date,
    final String? customPrompt,
  }) = _$AiMessageImpl;
  const _AiMessage._() : super._();

  factory _AiMessage.fromJson(Map<String, dynamic> json) = _$AiMessageImpl.fromJson;

  @override
  String get message;
  @override
  AiChatItemType get type;
  @override
  String get date;
  @override
  String? get customPrompt;

  /// Create a copy of AiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiMessageImplCopyWith<_$AiMessageImpl> get copyWith => throw _privateConstructorUsedError;
}
