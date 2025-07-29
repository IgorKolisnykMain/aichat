// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offering_metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OfferingMetadataModel _$OfferingMetadataModelFromJson(
  Map<String, dynamic> json,
) {
  return _OfferingMetadataModel.fromJson(json);
}

/// @nodoc
mixin _$OfferingMetadataModel {
  @JsonKey(name: 'packages')
  List<PackageMetadataModel> get packages => throw _privateConstructorUsedError;

  /// Serializes this OfferingMetadataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfferingMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferingMetadataModelCopyWith<OfferingMetadataModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferingMetadataModelCopyWith<$Res> {
  factory $OfferingMetadataModelCopyWith(
    OfferingMetadataModel value,
    $Res Function(OfferingMetadataModel) then,
  ) = _$OfferingMetadataModelCopyWithImpl<$Res, OfferingMetadataModel>;
  @useResult
  $Res call({@JsonKey(name: 'packages') List<PackageMetadataModel> packages});
}

/// @nodoc
class _$OfferingMetadataModelCopyWithImpl<$Res, $Val extends OfferingMetadataModel>
    implements $OfferingMetadataModelCopyWith<$Res> {
  _$OfferingMetadataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferingMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? packages = null}) {
    return _then(
      _value.copyWith(
            packages: null == packages
                ? _value.packages
                : packages // ignore: cast_nullable_to_non_nullable
                      as List<PackageMetadataModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfferingMetadataModelImplCopyWith<$Res> implements $OfferingMetadataModelCopyWith<$Res> {
  factory _$$OfferingMetadataModelImplCopyWith(
    _$OfferingMetadataModelImpl value,
    $Res Function(_$OfferingMetadataModelImpl) then,
  ) = __$$OfferingMetadataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'packages') List<PackageMetadataModel> packages});
}

/// @nodoc
class __$$OfferingMetadataModelImplCopyWithImpl<$Res>
    extends _$OfferingMetadataModelCopyWithImpl<$Res, _$OfferingMetadataModelImpl>
    implements _$$OfferingMetadataModelImplCopyWith<$Res> {
  __$$OfferingMetadataModelImplCopyWithImpl(
    _$OfferingMetadataModelImpl _value,
    $Res Function(_$OfferingMetadataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfferingMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? packages = null}) {
    return _then(
      _$OfferingMetadataModelImpl(
        packages: null == packages
            ? _value._packages
            : packages // ignore: cast_nullable_to_non_nullable
                  as List<PackageMetadataModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferingMetadataModelImpl implements _OfferingMetadataModel {
  const _$OfferingMetadataModelImpl({
    @JsonKey(name: 'packages') required final List<PackageMetadataModel> packages,
  }) : _packages = packages;

  factory _$OfferingMetadataModelImpl.fromJson(Map<String, dynamic> json) => _$$OfferingMetadataModelImplFromJson(json);

  final List<PackageMetadataModel> _packages;
  @override
  @JsonKey(name: 'packages')
  List<PackageMetadataModel> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  @override
  String toString() {
    return 'OfferingMetadataModel(packages: $packages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferingMetadataModelImpl &&
            const DeepCollectionEquality().equals(other._packages, _packages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_packages));

  /// Create a copy of OfferingMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferingMetadataModelImplCopyWith<_$OfferingMetadataModelImpl> get copyWith =>
      __$$OfferingMetadataModelImplCopyWithImpl<_$OfferingMetadataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferingMetadataModelImplToJson(this);
  }
}

abstract class _OfferingMetadataModel implements OfferingMetadataModel {
  const factory _OfferingMetadataModel({
    @JsonKey(name: 'packages') required final List<PackageMetadataModel> packages,
  }) = _$OfferingMetadataModelImpl;

  factory _OfferingMetadataModel.fromJson(Map<String, dynamic> json) = _$OfferingMetadataModelImpl.fromJson;

  @override
  @JsonKey(name: 'packages')
  List<PackageMetadataModel> get packages;

  /// Create a copy of OfferingMetadataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferingMetadataModelImplCopyWith<_$OfferingMetadataModelImpl> get copyWith => throw _privateConstructorUsedError;
}
