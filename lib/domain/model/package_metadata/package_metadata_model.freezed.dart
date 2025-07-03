// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PackageMetadataModel _$PackageMetadataModelFromJson(Map<String, dynamic> json) {
  return _PackageMetadataModel.fromJson(json);
}

/// @nodoc
mixin _$PackageMetadataModel {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount')
  double get discount => throw _privateConstructorUsedError;

  /// Serializes this PackageMetadataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageMetadataModelCopyWith<PackageMetadataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageMetadataModelCopyWith<$Res> {
  factory $PackageMetadataModelCopyWith(
    PackageMetadataModel value,
    $Res Function(PackageMetadataModel) then,
  ) = _$PackageMetadataModelCopyWithImpl<$Res, PackageMetadataModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'discount') double discount,
  });
}

/// @nodoc
class _$PackageMetadataModelCopyWithImpl<
  $Res,
  $Val extends PackageMetadataModel
>
    implements $PackageMetadataModelCopyWith<$Res> {
  _$PackageMetadataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? discount = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PackageMetadataModelImplCopyWith<$Res>
    implements $PackageMetadataModelCopyWith<$Res> {
  factory _$$PackageMetadataModelImplCopyWith(
    _$PackageMetadataModelImpl value,
    $Res Function(_$PackageMetadataModelImpl) then,
  ) = __$$PackageMetadataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') String id,
    @JsonKey(name: 'discount') double discount,
  });
}

/// @nodoc
class __$$PackageMetadataModelImplCopyWithImpl<$Res>
    extends _$PackageMetadataModelCopyWithImpl<$Res, _$PackageMetadataModelImpl>
    implements _$$PackageMetadataModelImplCopyWith<$Res> {
  __$$PackageMetadataModelImplCopyWithImpl(
    _$PackageMetadataModelImpl _value,
    $Res Function(_$PackageMetadataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PackageMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? discount = null}) {
    return _then(
      _$PackageMetadataModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageMetadataModelImpl implements _PackageMetadataModel {
  const _$PackageMetadataModelImpl({
    @JsonKey(name: 'id') required this.id,
    @JsonKey(name: 'discount') required this.discount,
  });

  factory _$PackageMetadataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageMetadataModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'discount')
  final double discount;

  @override
  String toString() {
    return 'PackageMetadataModel(id: $id, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageMetadataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, discount);

  /// Create a copy of PackageMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageMetadataModelImplCopyWith<_$PackageMetadataModelImpl>
  get copyWith =>
      __$$PackageMetadataModelImplCopyWithImpl<_$PackageMetadataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageMetadataModelImplToJson(this);
  }
}

abstract class _PackageMetadataModel implements PackageMetadataModel {
  const factory _PackageMetadataModel({
    @JsonKey(name: 'id') required final String id,
    @JsonKey(name: 'discount') required final double discount,
  }) = _$PackageMetadataModelImpl;

  factory _PackageMetadataModel.fromJson(Map<String, dynamic> json) =
      _$PackageMetadataModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'discount')
  double get discount;

  /// Create a copy of PackageMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageMetadataModelImplCopyWith<_$PackageMetadataModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
