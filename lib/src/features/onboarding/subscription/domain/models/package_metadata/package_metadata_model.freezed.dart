// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageMetadataModel {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'discount') double get discount;
/// Create a copy of PackageMetadataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageMetadataModelCopyWith<PackageMetadataModel> get copyWith => _$PackageMetadataModelCopyWithImpl<PackageMetadataModel>(this as PackageMetadataModel, _$identity);

  /// Serializes this PackageMetadataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageMetadataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,discount);

@override
String toString() {
  return 'PackageMetadataModel(id: $id, discount: $discount)';
}


}

/// @nodoc
abstract mixin class $PackageMetadataModelCopyWith<$Res>  {
  factory $PackageMetadataModelCopyWith(PackageMetadataModel value, $Res Function(PackageMetadataModel) _then) = _$PackageMetadataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'discount') double discount
});




}
/// @nodoc
class _$PackageMetadataModelCopyWithImpl<$Res>
    implements $PackageMetadataModelCopyWith<$Res> {
  _$PackageMetadataModelCopyWithImpl(this._self, this._then);

  final PackageMetadataModel _self;
  final $Res Function(PackageMetadataModel) _then;

/// Create a copy of PackageMetadataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? discount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageMetadataModel].
extension PackageMetadataModelPatterns on PackageMetadataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageMetadataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageMetadataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageMetadataModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageMetadataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageMetadataModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageMetadataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'discount')  double discount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageMetadataModel() when $default != null:
return $default(_that.id,_that.discount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'discount')  double discount)  $default,) {final _that = this;
switch (_that) {
case _PackageMetadataModel():
return $default(_that.id,_that.discount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'discount')  double discount)?  $default,) {final _that = this;
switch (_that) {
case _PackageMetadataModel() when $default != null:
return $default(_that.id,_that.discount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageMetadataModel implements PackageMetadataModel {
  const _PackageMetadataModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'discount') required this.discount});
  factory _PackageMetadataModel.fromJson(Map<String, dynamic> json) => _$PackageMetadataModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'discount') final  double discount;

/// Create a copy of PackageMetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageMetadataModelCopyWith<_PackageMetadataModel> get copyWith => __$PackageMetadataModelCopyWithImpl<_PackageMetadataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageMetadataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageMetadataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,discount);

@override
String toString() {
  return 'PackageMetadataModel(id: $id, discount: $discount)';
}


}

/// @nodoc
abstract mixin class _$PackageMetadataModelCopyWith<$Res> implements $PackageMetadataModelCopyWith<$Res> {
  factory _$PackageMetadataModelCopyWith(_PackageMetadataModel value, $Res Function(_PackageMetadataModel) _then) = __$PackageMetadataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'discount') double discount
});




}
/// @nodoc
class __$PackageMetadataModelCopyWithImpl<$Res>
    implements _$PackageMetadataModelCopyWith<$Res> {
  __$PackageMetadataModelCopyWithImpl(this._self, this._then);

  final _PackageMetadataModel _self;
  final $Res Function(_PackageMetadataModel) _then;

/// Create a copy of PackageMetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? discount = null,}) {
  return _then(_PackageMetadataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
