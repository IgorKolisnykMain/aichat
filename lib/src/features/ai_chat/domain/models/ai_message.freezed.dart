// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AiMessage _$AiMessageFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'header':
          return AiHeaderMessage.fromJson(
            json
          );
                case 'myQuestion':
          return AiQuestionMessage.fromJson(
            json
          );
                case 'aiAnswer':
          return AiAnswerMessage.fromJson(
            json
          );
                case 'loadingMock':
          return AiLoadingMessage.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'AiMessage',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$AiMessage {

 String get message;
/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiMessageCopyWith<AiMessage> get copyWith => _$AiMessageCopyWithImpl<AiMessage>(this as AiMessage, _$identity);

  /// Serializes this AiMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiMessage&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AiMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $AiMessageCopyWith<$Res>  {
  factory $AiMessageCopyWith(AiMessage value, $Res Function(AiMessage) _then) = _$AiMessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AiMessageCopyWithImpl<$Res>
    implements $AiMessageCopyWith<$Res> {
  _$AiMessageCopyWithImpl(this._self, this._then);

  final AiMessage _self;
  final $Res Function(AiMessage) _then;

/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiMessage].
extension AiMessagePatterns on AiMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AiHeaderMessage value)?  header,TResult Function( AiQuestionMessage value)?  myQuestion,TResult Function( AiAnswerMessage value)?  aiAnswer,TResult Function( AiLoadingMessage value)?  loadingMock,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AiHeaderMessage() when header != null:
return header(_that);case AiQuestionMessage() when myQuestion != null:
return myQuestion(_that);case AiAnswerMessage() when aiAnswer != null:
return aiAnswer(_that);case AiLoadingMessage() when loadingMock != null:
return loadingMock(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AiHeaderMessage value)  header,required TResult Function( AiQuestionMessage value)  myQuestion,required TResult Function( AiAnswerMessage value)  aiAnswer,required TResult Function( AiLoadingMessage value)  loadingMock,}){
final _that = this;
switch (_that) {
case AiHeaderMessage():
return header(_that);case AiQuestionMessage():
return myQuestion(_that);case AiAnswerMessage():
return aiAnswer(_that);case AiLoadingMessage():
return loadingMock(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AiHeaderMessage value)?  header,TResult? Function( AiQuestionMessage value)?  myQuestion,TResult? Function( AiAnswerMessage value)?  aiAnswer,TResult? Function( AiLoadingMessage value)?  loadingMock,}){
final _that = this;
switch (_that) {
case AiHeaderMessage() when header != null:
return header(_that);case AiQuestionMessage() when myQuestion != null:
return myQuestion(_that);case AiAnswerMessage() when aiAnswer != null:
return aiAnswer(_that);case AiLoadingMessage() when loadingMock != null:
return loadingMock(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  header,TResult Function( String message,  String? date,  String? customPrompt)?  myQuestion,TResult Function( String message,  String? date)?  aiAnswer,TResult Function( String message)?  loadingMock,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AiHeaderMessage() when header != null:
return header(_that.message);case AiQuestionMessage() when myQuestion != null:
return myQuestion(_that.message,_that.date,_that.customPrompt);case AiAnswerMessage() when aiAnswer != null:
return aiAnswer(_that.message,_that.date);case AiLoadingMessage() when loadingMock != null:
return loadingMock(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  header,required TResult Function( String message,  String? date,  String? customPrompt)  myQuestion,required TResult Function( String message,  String? date)  aiAnswer,required TResult Function( String message)  loadingMock,}) {final _that = this;
switch (_that) {
case AiHeaderMessage():
return header(_that.message);case AiQuestionMessage():
return myQuestion(_that.message,_that.date,_that.customPrompt);case AiAnswerMessage():
return aiAnswer(_that.message,_that.date);case AiLoadingMessage():
return loadingMock(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  header,TResult? Function( String message,  String? date,  String? customPrompt)?  myQuestion,TResult? Function( String message,  String? date)?  aiAnswer,TResult? Function( String message)?  loadingMock,}) {final _that = this;
switch (_that) {
case AiHeaderMessage() when header != null:
return header(_that.message);case AiQuestionMessage() when myQuestion != null:
return myQuestion(_that.message,_that.date,_that.customPrompt);case AiAnswerMessage() when aiAnswer != null:
return aiAnswer(_that.message,_that.date);case AiLoadingMessage() when loadingMock != null:
return loadingMock(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class AiHeaderMessage extends AiMessage {
  const AiHeaderMessage({required this.message, final  String? $type}): $type = $type ?? 'header',super._();
  factory AiHeaderMessage.fromJson(Map<String, dynamic> json) => _$AiHeaderMessageFromJson(json);

@override final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiHeaderMessageCopyWith<AiHeaderMessage> get copyWith => _$AiHeaderMessageCopyWithImpl<AiHeaderMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiHeaderMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiHeaderMessage&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AiMessage.header(message: $message)';
}


}

/// @nodoc
abstract mixin class $AiHeaderMessageCopyWith<$Res> implements $AiMessageCopyWith<$Res> {
  factory $AiHeaderMessageCopyWith(AiHeaderMessage value, $Res Function(AiHeaderMessage) _then) = _$AiHeaderMessageCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AiHeaderMessageCopyWithImpl<$Res>
    implements $AiHeaderMessageCopyWith<$Res> {
  _$AiHeaderMessageCopyWithImpl(this._self, this._then);

  final AiHeaderMessage _self;
  final $Res Function(AiHeaderMessage) _then;

/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AiHeaderMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AiQuestionMessage extends AiMessage {
  const AiQuestionMessage({required this.message, this.date, this.customPrompt, final  String? $type}): $type = $type ?? 'myQuestion',super._();
  factory AiQuestionMessage.fromJson(Map<String, dynamic> json) => _$AiQuestionMessageFromJson(json);

@override final  String message;
 final  String? date;
 final  String? customPrompt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiQuestionMessageCopyWith<AiQuestionMessage> get copyWith => _$AiQuestionMessageCopyWithImpl<AiQuestionMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiQuestionMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiQuestionMessage&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.customPrompt, customPrompt) || other.customPrompt == customPrompt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,date,customPrompt);

@override
String toString() {
  return 'AiMessage.myQuestion(message: $message, date: $date, customPrompt: $customPrompt)';
}


}

/// @nodoc
abstract mixin class $AiQuestionMessageCopyWith<$Res> implements $AiMessageCopyWith<$Res> {
  factory $AiQuestionMessageCopyWith(AiQuestionMessage value, $Res Function(AiQuestionMessage) _then) = _$AiQuestionMessageCopyWithImpl;
@override @useResult
$Res call({
 String message, String? date, String? customPrompt
});




}
/// @nodoc
class _$AiQuestionMessageCopyWithImpl<$Res>
    implements $AiQuestionMessageCopyWith<$Res> {
  _$AiQuestionMessageCopyWithImpl(this._self, this._then);

  final AiQuestionMessage _self;
  final $Res Function(AiQuestionMessage) _then;

/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? date = freezed,Object? customPrompt = freezed,}) {
  return _then(AiQuestionMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,customPrompt: freezed == customPrompt ? _self.customPrompt : customPrompt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AiAnswerMessage extends AiMessage {
  const AiAnswerMessage({required this.message, this.date, final  String? $type}): $type = $type ?? 'aiAnswer',super._();
  factory AiAnswerMessage.fromJson(Map<String, dynamic> json) => _$AiAnswerMessageFromJson(json);

@override final  String message;
 final  String? date;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAnswerMessageCopyWith<AiAnswerMessage> get copyWith => _$AiAnswerMessageCopyWithImpl<AiAnswerMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiAnswerMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAnswerMessage&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,date);

@override
String toString() {
  return 'AiMessage.aiAnswer(message: $message, date: $date)';
}


}

/// @nodoc
abstract mixin class $AiAnswerMessageCopyWith<$Res> implements $AiMessageCopyWith<$Res> {
  factory $AiAnswerMessageCopyWith(AiAnswerMessage value, $Res Function(AiAnswerMessage) _then) = _$AiAnswerMessageCopyWithImpl;
@override @useResult
$Res call({
 String message, String? date
});




}
/// @nodoc
class _$AiAnswerMessageCopyWithImpl<$Res>
    implements $AiAnswerMessageCopyWith<$Res> {
  _$AiAnswerMessageCopyWithImpl(this._self, this._then);

  final AiAnswerMessage _self;
  final $Res Function(AiAnswerMessage) _then;

/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? date = freezed,}) {
  return _then(AiAnswerMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AiLoadingMessage extends AiMessage {
  const AiLoadingMessage({this.message = '', final  String? $type}): $type = $type ?? 'loadingMock',super._();
  factory AiLoadingMessage.fromJson(Map<String, dynamic> json) => _$AiLoadingMessageFromJson(json);

@override@JsonKey() final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiLoadingMessageCopyWith<AiLoadingMessage> get copyWith => _$AiLoadingMessageCopyWithImpl<AiLoadingMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiLoadingMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiLoadingMessage&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AiMessage.loadingMock(message: $message)';
}


}

/// @nodoc
abstract mixin class $AiLoadingMessageCopyWith<$Res> implements $AiMessageCopyWith<$Res> {
  factory $AiLoadingMessageCopyWith(AiLoadingMessage value, $Res Function(AiLoadingMessage) _then) = _$AiLoadingMessageCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AiLoadingMessageCopyWithImpl<$Res>
    implements $AiLoadingMessageCopyWith<$Res> {
  _$AiLoadingMessageCopyWithImpl(this._self, this._then);

  final AiLoadingMessage _self;
  final $Res Function(AiLoadingMessage) _then;

/// Create a copy of AiMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AiLoadingMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
