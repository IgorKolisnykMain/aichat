// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offering_metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfferingMetadataModel {

@JsonKey(name: 'packages') List<PackageMetadataModel> get packages;
/// Create a copy of OfferingMetadataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferingMetadataModelCopyWith<OfferingMetadataModel> get copyWith => _$OfferingMetadataModelCopyWithImpl<OfferingMetadataModel>(this as OfferingMetadataModel, _$identity);

  /// Serializes this OfferingMetadataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferingMetadataModel&&const DeepCollectionEquality().equals(other.packages, packages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(packages));

@override
String toString() {
  return 'OfferingMetadataModel(packages: $packages)';
}


}

/// @nodoc
abstract mixin class $OfferingMetadataModelCopyWith<$Res>  {
  factory $OfferingMetadataModelCopyWith(OfferingMetadataModel value, $Res Function(OfferingMetadataModel) _then) = _$OfferingMetadataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'packages') List<PackageMetadataModel> packages
});




}
/// @nodoc
class _$OfferingMetadataModelCopyWithImpl<$Res>
    implements $OfferingMetadataModelCopyWith<$Res> {
  _$OfferingMetadataModelCopyWithImpl(this._self, this._then);

  final OfferingMetadataModel _self;
  final $Res Function(OfferingMetadataModel) _then;

/// Create a copy of OfferingMetadataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packages = null,}) {
  return _then(_self.copyWith(
packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageMetadataModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferingMetadataModel].
extension OfferingMetadataModelPatterns on OfferingMetadataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferingMetadataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferingMetadataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferingMetadataModel value)  $default,){
final _that = this;
switch (_that) {
case _OfferingMetadataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferingMetadataModel value)?  $default,){
final _that = this;
switch (_that) {
case _OfferingMetadataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'packages')  List<PackageMetadataModel> packages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferingMetadataModel() when $default != null:
return $default(_that.packages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'packages')  List<PackageMetadataModel> packages)  $default,) {final _that = this;
switch (_that) {
case _OfferingMetadataModel():
return $default(_that.packages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'packages')  List<PackageMetadataModel> packages)?  $default,) {final _that = this;
switch (_that) {
case _OfferingMetadataModel() when $default != null:
return $default(_that.packages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferingMetadataModel implements OfferingMetadataModel {
  const _OfferingMetadataModel({@JsonKey(name: 'packages') required final  List<PackageMetadataModel> packages}): _packages = packages;
  factory _OfferingMetadataModel.fromJson(Map<String, dynamic> json) => _$OfferingMetadataModelFromJson(json);

 final  List<PackageMetadataModel> _packages;
@override@JsonKey(name: 'packages') List<PackageMetadataModel> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}


/// Create a copy of OfferingMetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferingMetadataModelCopyWith<_OfferingMetadataModel> get copyWith => __$OfferingMetadataModelCopyWithImpl<_OfferingMetadataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferingMetadataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferingMetadataModel&&const DeepCollectionEquality().equals(other._packages, _packages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_packages));

@override
String toString() {
  return 'OfferingMetadataModel(packages: $packages)';
}


}

/// @nodoc
abstract mixin class _$OfferingMetadataModelCopyWith<$Res> implements $OfferingMetadataModelCopyWith<$Res> {
  factory _$OfferingMetadataModelCopyWith(_OfferingMetadataModel value, $Res Function(_OfferingMetadataModel) _then) = __$OfferingMetadataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'packages') List<PackageMetadataModel> packages
});




}
/// @nodoc
class __$OfferingMetadataModelCopyWithImpl<$Res>
    implements _$OfferingMetadataModelCopyWith<$Res> {
  __$OfferingMetadataModelCopyWithImpl(this._self, this._then);

  final _OfferingMetadataModel _self;
  final $Res Function(_OfferingMetadataModel) _then;

/// Create a copy of OfferingMetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packages = null,}) {
  return _then(_OfferingMetadataModel(
packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageMetadataModel>,
  ));
}


}

// dart format on
