// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserChat {

 AssistantId get assistantId; List<AiMessage> get chatHistory; List<String> get threads; List<String> get usedAiTokens;
/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserChatCopyWith<UserChat> get copyWith => _$UserChatCopyWithImpl<UserChat>(this as UserChat, _$identity);

  /// Serializes this UserChat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserChat&&(identical(other.assistantId, assistantId) || other.assistantId == assistantId)&&const DeepCollectionEquality().equals(other.chatHistory, chatHistory)&&const DeepCollectionEquality().equals(other.threads, threads)&&const DeepCollectionEquality().equals(other.usedAiTokens, usedAiTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assistantId,const DeepCollectionEquality().hash(chatHistory),const DeepCollectionEquality().hash(threads),const DeepCollectionEquality().hash(usedAiTokens));

@override
String toString() {
  return 'UserChat(assistantId: $assistantId, chatHistory: $chatHistory, threads: $threads, usedAiTokens: $usedAiTokens)';
}


}

/// @nodoc
abstract mixin class $UserChatCopyWith<$Res>  {
  factory $UserChatCopyWith(UserChat value, $Res Function(UserChat) _then) = _$UserChatCopyWithImpl;
@useResult
$Res call({
 AssistantId assistantId, List<AiMessage> chatHistory, List<String> threads, List<String> usedAiTokens
});




}
/// @nodoc
class _$UserChatCopyWithImpl<$Res>
    implements $UserChatCopyWith<$Res> {
  _$UserChatCopyWithImpl(this._self, this._then);

  final UserChat _self;
  final $Res Function(UserChat) _then;

/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assistantId = null,Object? chatHistory = null,Object? threads = null,Object? usedAiTokens = null,}) {
  return _then(_self.copyWith(
assistantId: null == assistantId ? _self.assistantId : assistantId // ignore: cast_nullable_to_non_nullable
as AssistantId,chatHistory: null == chatHistory ? _self.chatHistory : chatHistory // ignore: cast_nullable_to_non_nullable
as List<AiMessage>,threads: null == threads ? _self.threads : threads // ignore: cast_nullable_to_non_nullable
as List<String>,usedAiTokens: null == usedAiTokens ? _self.usedAiTokens : usedAiTokens // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserChat].
extension UserChatPatterns on UserChat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserChat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserChat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserChat value)  $default,){
final _that = this;
switch (_that) {
case _UserChat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserChat value)?  $default,){
final _that = this;
switch (_that) {
case _UserChat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AssistantId assistantId,  List<AiMessage> chatHistory,  List<String> threads,  List<String> usedAiTokens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserChat() when $default != null:
return $default(_that.assistantId,_that.chatHistory,_that.threads,_that.usedAiTokens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AssistantId assistantId,  List<AiMessage> chatHistory,  List<String> threads,  List<String> usedAiTokens)  $default,) {final _that = this;
switch (_that) {
case _UserChat():
return $default(_that.assistantId,_that.chatHistory,_that.threads,_that.usedAiTokens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AssistantId assistantId,  List<AiMessage> chatHistory,  List<String> threads,  List<String> usedAiTokens)?  $default,) {final _that = this;
switch (_that) {
case _UserChat() when $default != null:
return $default(_that.assistantId,_that.chatHistory,_that.threads,_that.usedAiTokens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserChat implements UserChat {
  const _UserChat({required this.assistantId, final  List<AiMessage> chatHistory = const [], final  List<String> threads = const [], final  List<String> usedAiTokens = const []}): _chatHistory = chatHistory,_threads = threads,_usedAiTokens = usedAiTokens;
  factory _UserChat.fromJson(Map<String, dynamic> json) => _$UserChatFromJson(json);

@override final  AssistantId assistantId;
 final  List<AiMessage> _chatHistory;
@override@JsonKey() List<AiMessage> get chatHistory {
  if (_chatHistory is EqualUnmodifiableListView) return _chatHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chatHistory);
}

 final  List<String> _threads;
@override@JsonKey() List<String> get threads {
  if (_threads is EqualUnmodifiableListView) return _threads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_threads);
}

 final  List<String> _usedAiTokens;
@override@JsonKey() List<String> get usedAiTokens {
  if (_usedAiTokens is EqualUnmodifiableListView) return _usedAiTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usedAiTokens);
}


/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserChatCopyWith<_UserChat> get copyWith => __$UserChatCopyWithImpl<_UserChat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserChatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserChat&&(identical(other.assistantId, assistantId) || other.assistantId == assistantId)&&const DeepCollectionEquality().equals(other._chatHistory, _chatHistory)&&const DeepCollectionEquality().equals(other._threads, _threads)&&const DeepCollectionEquality().equals(other._usedAiTokens, _usedAiTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assistantId,const DeepCollectionEquality().hash(_chatHistory),const DeepCollectionEquality().hash(_threads),const DeepCollectionEquality().hash(_usedAiTokens));

@override
String toString() {
  return 'UserChat(assistantId: $assistantId, chatHistory: $chatHistory, threads: $threads, usedAiTokens: $usedAiTokens)';
}


}

/// @nodoc
abstract mixin class _$UserChatCopyWith<$Res> implements $UserChatCopyWith<$Res> {
  factory _$UserChatCopyWith(_UserChat value, $Res Function(_UserChat) _then) = __$UserChatCopyWithImpl;
@override @useResult
$Res call({
 AssistantId assistantId, List<AiMessage> chatHistory, List<String> threads, List<String> usedAiTokens
});




}
/// @nodoc
class __$UserChatCopyWithImpl<$Res>
    implements _$UserChatCopyWith<$Res> {
  __$UserChatCopyWithImpl(this._self, this._then);

  final _UserChat _self;
  final $Res Function(_UserChat) _then;

/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assistantId = null,Object? chatHistory = null,Object? threads = null,Object? usedAiTokens = null,}) {
  return _then(_UserChat(
assistantId: null == assistantId ? _self.assistantId : assistantId // ignore: cast_nullable_to_non_nullable
as AssistantId,chatHistory: null == chatHistory ? _self._chatHistory : chatHistory // ignore: cast_nullable_to_non_nullable
as List<AiMessage>,threads: null == threads ? _self._threads : threads // ignore: cast_nullable_to_non_nullable
as List<String>,usedAiTokens: null == usedAiTokens ? _self._usedAiTokens : usedAiTokens // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
