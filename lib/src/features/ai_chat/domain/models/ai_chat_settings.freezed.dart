// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_chat_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiChatSettings {

 String get headerMessage; String get promptChat; List<String> get tokens; List<String> get usedTokens;
/// Create a copy of AiChatSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiChatSettingsCopyWith<AiChatSettings> get copyWith => _$AiChatSettingsCopyWithImpl<AiChatSettings>(this as AiChatSettings, _$identity);

  /// Serializes this AiChatSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiChatSettings&&(identical(other.headerMessage, headerMessage) || other.headerMessage == headerMessage)&&(identical(other.promptChat, promptChat) || other.promptChat == promptChat)&&const DeepCollectionEquality().equals(other.tokens, tokens)&&const DeepCollectionEquality().equals(other.usedTokens, usedTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,headerMessage,promptChat,const DeepCollectionEquality().hash(tokens),const DeepCollectionEquality().hash(usedTokens));

@override
String toString() {
  return 'AiChatSettings(headerMessage: $headerMessage, promptChat: $promptChat, tokens: $tokens, usedTokens: $usedTokens)';
}


}

/// @nodoc
abstract mixin class $AiChatSettingsCopyWith<$Res>  {
  factory $AiChatSettingsCopyWith(AiChatSettings value, $Res Function(AiChatSettings) _then) = _$AiChatSettingsCopyWithImpl;
@useResult
$Res call({
 String headerMessage, String promptChat, List<String> tokens, List<String> usedTokens
});




}
/// @nodoc
class _$AiChatSettingsCopyWithImpl<$Res>
    implements $AiChatSettingsCopyWith<$Res> {
  _$AiChatSettingsCopyWithImpl(this._self, this._then);

  final AiChatSettings _self;
  final $Res Function(AiChatSettings) _then;

/// Create a copy of AiChatSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? headerMessage = null,Object? promptChat = null,Object? tokens = null,Object? usedTokens = null,}) {
  return _then(_self.copyWith(
headerMessage: null == headerMessage ? _self.headerMessage : headerMessage // ignore: cast_nullable_to_non_nullable
as String,promptChat: null == promptChat ? _self.promptChat : promptChat // ignore: cast_nullable_to_non_nullable
as String,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<String>,usedTokens: null == usedTokens ? _self.usedTokens : usedTokens // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiChatSettings].
extension AiChatSettingsPatterns on AiChatSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiChatSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiChatSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiChatSettings value)  $default,){
final _that = this;
switch (_that) {
case _AiChatSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiChatSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AiChatSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String headerMessage,  String promptChat,  List<String> tokens,  List<String> usedTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiChatSettings() when $default != null:
return $default(_that.headerMessage,_that.promptChat,_that.tokens,_that.usedTokens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String headerMessage,  String promptChat,  List<String> tokens,  List<String> usedTokens)  $default,) {final _that = this;
switch (_that) {
case _AiChatSettings():
return $default(_that.headerMessage,_that.promptChat,_that.tokens,_that.usedTokens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String headerMessage,  String promptChat,  List<String> tokens,  List<String> usedTokens)?  $default,) {final _that = this;
switch (_that) {
case _AiChatSettings() when $default != null:
return $default(_that.headerMessage,_that.promptChat,_that.tokens,_that.usedTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiChatSettings implements AiChatSettings {
  const _AiChatSettings({required this.headerMessage, required this.promptChat, required final  List<String> tokens, final  List<String> usedTokens = const []}): _tokens = tokens,_usedTokens = usedTokens;
  factory _AiChatSettings.fromJson(Map<String, dynamic> json) => _$AiChatSettingsFromJson(json);

@override final  String headerMessage;
@override final  String promptChat;
 final  List<String> _tokens;
@override List<String> get tokens {
  if (_tokens is EqualUnmodifiableListView) return _tokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tokens);
}

 final  List<String> _usedTokens;
@override@JsonKey() List<String> get usedTokens {
  if (_usedTokens is EqualUnmodifiableListView) return _usedTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usedTokens);
}


/// Create a copy of AiChatSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiChatSettingsCopyWith<_AiChatSettings> get copyWith => __$AiChatSettingsCopyWithImpl<_AiChatSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiChatSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiChatSettings&&(identical(other.headerMessage, headerMessage) || other.headerMessage == headerMessage)&&(identical(other.promptChat, promptChat) || other.promptChat == promptChat)&&const DeepCollectionEquality().equals(other._tokens, _tokens)&&const DeepCollectionEquality().equals(other._usedTokens, _usedTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,headerMessage,promptChat,const DeepCollectionEquality().hash(_tokens),const DeepCollectionEquality().hash(_usedTokens));

@override
String toString() {
  return 'AiChatSettings(headerMessage: $headerMessage, promptChat: $promptChat, tokens: $tokens, usedTokens: $usedTokens)';
}


}

/// @nodoc
abstract mixin class _$AiChatSettingsCopyWith<$Res> implements $AiChatSettingsCopyWith<$Res> {
  factory _$AiChatSettingsCopyWith(_AiChatSettings value, $Res Function(_AiChatSettings) _then) = __$AiChatSettingsCopyWithImpl;
@override @useResult
$Res call({
 String headerMessage, String promptChat, List<String> tokens, List<String> usedTokens
});




}
/// @nodoc
class __$AiChatSettingsCopyWithImpl<$Res>
    implements _$AiChatSettingsCopyWith<$Res> {
  __$AiChatSettingsCopyWithImpl(this._self, this._then);

  final _AiChatSettings _self;
  final $Res Function(_AiChatSettings) _then;

/// Create a copy of AiChatSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? headerMessage = null,Object? promptChat = null,Object? tokens = null,Object? usedTokens = null,}) {
  return _then(_AiChatSettings(
headerMessage: null == headerMessage ? _self.headerMessage : headerMessage // ignore: cast_nullable_to_non_nullable
as String,promptChat: null == promptChat ? _self.promptChat : promptChat // ignore: cast_nullable_to_non_nullable
as String,tokens: null == tokens ? _self._tokens : tokens // ignore: cast_nullable_to_non_nullable
as List<String>,usedTokens: null == usedTokens ? _self._usedTokens : usedTokens // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
