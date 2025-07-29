// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_chat_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiChatSettings _$AiChatSettingsFromJson(Map<String, dynamic> json) {
  return _AiChatSettings.fromJson(json);
}

/// @nodoc
mixin _$AiChatSettings {
  String get headerMessage => throw _privateConstructorUsedError;
  String get promptChat => throw _privateConstructorUsedError;
  List<String> get tokens => throw _privateConstructorUsedError;
  List<String> get usedTokens => throw _privateConstructorUsedError;

  /// Serializes this AiChatSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiChatSettingsCopyWith<AiChatSettings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiChatSettingsCopyWith<$Res> {
  factory $AiChatSettingsCopyWith(
    AiChatSettings value,
    $Res Function(AiChatSettings) then,
  ) = _$AiChatSettingsCopyWithImpl<$Res, AiChatSettings>;
  @useResult
  $Res call({
    String headerMessage,
    String promptChat,
    List<String> tokens,
    List<String> usedTokens,
  });
}

/// @nodoc
class _$AiChatSettingsCopyWithImpl<$Res, $Val extends AiChatSettings> implements $AiChatSettingsCopyWith<$Res> {
  _$AiChatSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headerMessage = null,
    Object? promptChat = null,
    Object? tokens = null,
    Object? usedTokens = null,
  }) {
    return _then(
      _value.copyWith(
            headerMessage: null == headerMessage
                ? _value.headerMessage
                : headerMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            promptChat: null == promptChat
                ? _value.promptChat
                : promptChat // ignore: cast_nullable_to_non_nullable
                      as String,
            tokens: null == tokens
                ? _value.tokens
                : tokens // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            usedTokens: null == usedTokens
                ? _value.usedTokens
                : usedTokens // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiChatSettingsImplCopyWith<$Res> implements $AiChatSettingsCopyWith<$Res> {
  factory _$$AiChatSettingsImplCopyWith(
    _$AiChatSettingsImpl value,
    $Res Function(_$AiChatSettingsImpl) then,
  ) = __$$AiChatSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String headerMessage,
    String promptChat,
    List<String> tokens,
    List<String> usedTokens,
  });
}

/// @nodoc
class __$$AiChatSettingsImplCopyWithImpl<$Res> extends _$AiChatSettingsCopyWithImpl<$Res, _$AiChatSettingsImpl>
    implements _$$AiChatSettingsImplCopyWith<$Res> {
  __$$AiChatSettingsImplCopyWithImpl(
    _$AiChatSettingsImpl _value,
    $Res Function(_$AiChatSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headerMessage = null,
    Object? promptChat = null,
    Object? tokens = null,
    Object? usedTokens = null,
  }) {
    return _then(
      _$AiChatSettingsImpl(
        headerMessage: null == headerMessage
            ? _value.headerMessage
            : headerMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        promptChat: null == promptChat
            ? _value.promptChat
            : promptChat // ignore: cast_nullable_to_non_nullable
                  as String,
        tokens: null == tokens
            ? _value._tokens
            : tokens // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        usedTokens: null == usedTokens
            ? _value._usedTokens
            : usedTokens // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiChatSettingsImpl implements _AiChatSettings {
  const _$AiChatSettingsImpl({
    required this.headerMessage,
    required this.promptChat,
    required final List<String> tokens,
    final List<String> usedTokens = const [],
  }) : _tokens = tokens,
       _usedTokens = usedTokens;

  factory _$AiChatSettingsImpl.fromJson(Map<String, dynamic> json) => _$$AiChatSettingsImplFromJson(json);

  @override
  final String headerMessage;
  @override
  final String promptChat;
  final List<String> _tokens;
  @override
  List<String> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  final List<String> _usedTokens;
  @override
  @JsonKey()
  List<String> get usedTokens {
    if (_usedTokens is EqualUnmodifiableListView) return _usedTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usedTokens);
  }

  @override
  String toString() {
    return 'AiChatSettings(headerMessage: $headerMessage, promptChat: $promptChat, tokens: $tokens, usedTokens: $usedTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiChatSettingsImpl &&
            (identical(other.headerMessage, headerMessage) || other.headerMessage == headerMessage) &&
            (identical(other.promptChat, promptChat) || other.promptChat == promptChat) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens) &&
            const DeepCollectionEquality().equals(
              other._usedTokens,
              _usedTokens,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    headerMessage,
    promptChat,
    const DeepCollectionEquality().hash(_tokens),
    const DeepCollectionEquality().hash(_usedTokens),
  );

  /// Create a copy of AiChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiChatSettingsImplCopyWith<_$AiChatSettingsImpl> get copyWith =>
      __$$AiChatSettingsImplCopyWithImpl<_$AiChatSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiChatSettingsImplToJson(this);
  }
}

abstract class _AiChatSettings implements AiChatSettings {
  const factory _AiChatSettings({
    required final String headerMessage,
    required final String promptChat,
    required final List<String> tokens,
    final List<String> usedTokens,
  }) = _$AiChatSettingsImpl;

  factory _AiChatSettings.fromJson(Map<String, dynamic> json) = _$AiChatSettingsImpl.fromJson;

  @override
  String get headerMessage;
  @override
  String get promptChat;
  @override
  List<String> get tokens;
  @override
  List<String> get usedTokens;

  /// Create a copy of AiChatSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiChatSettingsImplCopyWith<_$AiChatSettingsImpl> get copyWith => throw _privateConstructorUsedError;
}
