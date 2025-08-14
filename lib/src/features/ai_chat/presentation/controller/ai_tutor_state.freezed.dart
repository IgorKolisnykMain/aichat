// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_tutor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiTutorState {

 AiTutorStage get stage; ChatHistory get chatHistory; AiMessage? get aiAnsweringOnQuestion; String? get currentThreadId; List<String> get userThreads; String? get streamingResponse; bool get isStreaming;
/// Create a copy of AiTutorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiTutorStateCopyWith<AiTutorState> get copyWith => _$AiTutorStateCopyWithImpl<AiTutorState>(this as AiTutorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiTutorState&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.chatHistory, chatHistory) || other.chatHistory == chatHistory)&&(identical(other.aiAnsweringOnQuestion, aiAnsweringOnQuestion) || other.aiAnsweringOnQuestion == aiAnsweringOnQuestion)&&(identical(other.currentThreadId, currentThreadId) || other.currentThreadId == currentThreadId)&&const DeepCollectionEquality().equals(other.userThreads, userThreads)&&(identical(other.streamingResponse, streamingResponse) || other.streamingResponse == streamingResponse)&&(identical(other.isStreaming, isStreaming) || other.isStreaming == isStreaming));
}


@override
int get hashCode => Object.hash(runtimeType,stage,chatHistory,aiAnsweringOnQuestion,currentThreadId,const DeepCollectionEquality().hash(userThreads),streamingResponse,isStreaming);

@override
String toString() {
  return 'AiTutorState(stage: $stage, chatHistory: $chatHistory, aiAnsweringOnQuestion: $aiAnsweringOnQuestion, currentThreadId: $currentThreadId, userThreads: $userThreads, streamingResponse: $streamingResponse, isStreaming: $isStreaming)';
}


}

/// @nodoc
abstract mixin class $AiTutorStateCopyWith<$Res>  {
  factory $AiTutorStateCopyWith(AiTutorState value, $Res Function(AiTutorState) _then) = _$AiTutorStateCopyWithImpl;
@useResult
$Res call({
 AiTutorStage stage, ChatHistory chatHistory, AiMessage? aiAnsweringOnQuestion, String? currentThreadId, List<String> userThreads, String? streamingResponse, bool isStreaming
});


$ChatHistoryCopyWith<$Res> get chatHistory;$AiMessageCopyWith<$Res>? get aiAnsweringOnQuestion;

}
/// @nodoc
class _$AiTutorStateCopyWithImpl<$Res>
    implements $AiTutorStateCopyWith<$Res> {
  _$AiTutorStateCopyWithImpl(this._self, this._then);

  final AiTutorState _self;
  final $Res Function(AiTutorState) _then;

/// Create a copy of AiTutorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stage = null,Object? chatHistory = null,Object? aiAnsweringOnQuestion = freezed,Object? currentThreadId = freezed,Object? userThreads = null,Object? streamingResponse = freezed,Object? isStreaming = null,}) {
  return _then(_self.copyWith(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as AiTutorStage,chatHistory: null == chatHistory ? _self.chatHistory : chatHistory // ignore: cast_nullable_to_non_nullable
as ChatHistory,aiAnsweringOnQuestion: freezed == aiAnsweringOnQuestion ? _self.aiAnsweringOnQuestion : aiAnsweringOnQuestion // ignore: cast_nullable_to_non_nullable
as AiMessage?,currentThreadId: freezed == currentThreadId ? _self.currentThreadId : currentThreadId // ignore: cast_nullable_to_non_nullable
as String?,userThreads: null == userThreads ? _self.userThreads : userThreads // ignore: cast_nullable_to_non_nullable
as List<String>,streamingResponse: freezed == streamingResponse ? _self.streamingResponse : streamingResponse // ignore: cast_nullable_to_non_nullable
as String?,isStreaming: null == isStreaming ? _self.isStreaming : isStreaming // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AiTutorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatHistoryCopyWith<$Res> get chatHistory {
  
  return $ChatHistoryCopyWith<$Res>(_self.chatHistory, (value) {
    return _then(_self.copyWith(chatHistory: value));
  });
}/// Create a copy of AiTutorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiMessageCopyWith<$Res>? get aiAnsweringOnQuestion {
    if (_self.aiAnsweringOnQuestion == null) {
    return null;
  }

  return $AiMessageCopyWith<$Res>(_self.aiAnsweringOnQuestion!, (value) {
    return _then(_self.copyWith(aiAnsweringOnQuestion: value));
  });
}
}


/// Adds pattern-matching-related methods to [AiTutorState].
extension AiTutorStatePatterns on AiTutorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiTutorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiTutorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiTutorState value)  $default,){
final _that = this;
switch (_that) {
case _AiTutorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiTutorState value)?  $default,){
final _that = this;
switch (_that) {
case _AiTutorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AiTutorStage stage,  ChatHistory chatHistory,  AiMessage? aiAnsweringOnQuestion,  String? currentThreadId,  List<String> userThreads,  String? streamingResponse,  bool isStreaming)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiTutorState() when $default != null:
return $default(_that.stage,_that.chatHistory,_that.aiAnsweringOnQuestion,_that.currentThreadId,_that.userThreads,_that.streamingResponse,_that.isStreaming);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AiTutorStage stage,  ChatHistory chatHistory,  AiMessage? aiAnsweringOnQuestion,  String? currentThreadId,  List<String> userThreads,  String? streamingResponse,  bool isStreaming)  $default,) {final _that = this;
switch (_that) {
case _AiTutorState():
return $default(_that.stage,_that.chatHistory,_that.aiAnsweringOnQuestion,_that.currentThreadId,_that.userThreads,_that.streamingResponse,_that.isStreaming);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AiTutorStage stage,  ChatHistory chatHistory,  AiMessage? aiAnsweringOnQuestion,  String? currentThreadId,  List<String> userThreads,  String? streamingResponse,  bool isStreaming)?  $default,) {final _that = this;
switch (_that) {
case _AiTutorState() when $default != null:
return $default(_that.stage,_that.chatHistory,_that.aiAnsweringOnQuestion,_that.currentThreadId,_that.userThreads,_that.streamingResponse,_that.isStreaming);case _:
  return null;

}
}

}

/// @nodoc


class _AiTutorState implements AiTutorState {
  const _AiTutorState({required this.stage, required this.chatHistory, this.aiAnsweringOnQuestion, this.currentThreadId, final  List<String> userThreads = const [], this.streamingResponse, this.isStreaming = false}): _userThreads = userThreads;
  

@override final  AiTutorStage stage;
@override final  ChatHistory chatHistory;
@override final  AiMessage? aiAnsweringOnQuestion;
@override final  String? currentThreadId;
 final  List<String> _userThreads;
@override@JsonKey() List<String> get userThreads {
  if (_userThreads is EqualUnmodifiableListView) return _userThreads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userThreads);
}

@override final  String? streamingResponse;
@override@JsonKey() final  bool isStreaming;

/// Create a copy of AiTutorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiTutorStateCopyWith<_AiTutorState> get copyWith => __$AiTutorStateCopyWithImpl<_AiTutorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiTutorState&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.chatHistory, chatHistory) || other.chatHistory == chatHistory)&&(identical(other.aiAnsweringOnQuestion, aiAnsweringOnQuestion) || other.aiAnsweringOnQuestion == aiAnsweringOnQuestion)&&(identical(other.currentThreadId, currentThreadId) || other.currentThreadId == currentThreadId)&&const DeepCollectionEquality().equals(other._userThreads, _userThreads)&&(identical(other.streamingResponse, streamingResponse) || other.streamingResponse == streamingResponse)&&(identical(other.isStreaming, isStreaming) || other.isStreaming == isStreaming));
}


@override
int get hashCode => Object.hash(runtimeType,stage,chatHistory,aiAnsweringOnQuestion,currentThreadId,const DeepCollectionEquality().hash(_userThreads),streamingResponse,isStreaming);

@override
String toString() {
  return 'AiTutorState(stage: $stage, chatHistory: $chatHistory, aiAnsweringOnQuestion: $aiAnsweringOnQuestion, currentThreadId: $currentThreadId, userThreads: $userThreads, streamingResponse: $streamingResponse, isStreaming: $isStreaming)';
}


}

/// @nodoc
abstract mixin class _$AiTutorStateCopyWith<$Res> implements $AiTutorStateCopyWith<$Res> {
  factory _$AiTutorStateCopyWith(_AiTutorState value, $Res Function(_AiTutorState) _then) = __$AiTutorStateCopyWithImpl;
@override @useResult
$Res call({
 AiTutorStage stage, ChatHistory chatHistory, AiMessage? aiAnsweringOnQuestion, String? currentThreadId, List<String> userThreads, String? streamingResponse, bool isStreaming
});


@override $ChatHistoryCopyWith<$Res> get chatHistory;@override $AiMessageCopyWith<$Res>? get aiAnsweringOnQuestion;

}
/// @nodoc
class __$AiTutorStateCopyWithImpl<$Res>
    implements _$AiTutorStateCopyWith<$Res> {
  __$AiTutorStateCopyWithImpl(this._self, this._then);

  final _AiTutorState _self;
  final $Res Function(_AiTutorState) _then;

/// Create a copy of AiTutorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stage = null,Object? chatHistory = null,Object? aiAnsweringOnQuestion = freezed,Object? currentThreadId = freezed,Object? userThreads = null,Object? streamingResponse = freezed,Object? isStreaming = null,}) {
  return _then(_AiTutorState(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as AiTutorStage,chatHistory: null == chatHistory ? _self.chatHistory : chatHistory // ignore: cast_nullable_to_non_nullable
as ChatHistory,aiAnsweringOnQuestion: freezed == aiAnsweringOnQuestion ? _self.aiAnsweringOnQuestion : aiAnsweringOnQuestion // ignore: cast_nullable_to_non_nullable
as AiMessage?,currentThreadId: freezed == currentThreadId ? _self.currentThreadId : currentThreadId // ignore: cast_nullable_to_non_nullable
as String?,userThreads: null == userThreads ? _self._userThreads : userThreads // ignore: cast_nullable_to_non_nullable
as List<String>,streamingResponse: freezed == streamingResponse ? _self.streamingResponse : streamingResponse // ignore: cast_nullable_to_non_nullable
as String?,isStreaming: null == isStreaming ? _self.isStreaming : isStreaming // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AiTutorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatHistoryCopyWith<$Res> get chatHistory {
  
  return $ChatHistoryCopyWith<$Res>(_self.chatHistory, (value) {
    return _then(_self.copyWith(chatHistory: value));
  });
}/// Create a copy of AiTutorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiMessageCopyWith<$Res>? get aiAnsweringOnQuestion {
    if (_self.aiAnsweringOnQuestion == null) {
    return null;
  }

  return $AiMessageCopyWith<$Res>(_self.aiAnsweringOnQuestion!, (value) {
    return _then(_self.copyWith(aiAnsweringOnQuestion: value));
  });
}
}

// dart format on
