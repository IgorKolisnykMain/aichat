// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paywall_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaywallState {
  PaywallStage get stage => throw _privateConstructorUsedError;
  Offering? get currentOffering => throw _privateConstructorUsedError;
  OfferingMetadataModel? get offeringMetadata => throw _privateConstructorUsedError;
  List<String> get packagesWithFreeTrialEligible => throw _privateConstructorUsedError;
  String? get selectedPackageId => throw _privateConstructorUsedError;
  String? get cheapestPackageId => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  /// Create a copy of PaywallState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaywallStateCopyWith<PaywallState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaywallStateCopyWith<$Res> {
  factory $PaywallStateCopyWith(PaywallState value, $Res Function(PaywallState) then) =
      _$PaywallStateCopyWithImpl<$Res, PaywallState>;
  @useResult
  $Res call({
    PaywallStage stage,
    Offering? currentOffering,
    OfferingMetadataModel? offeringMetadata,
    List<String> packagesWithFreeTrialEligible,
    String? selectedPackageId,
    String? cheapestPackageId,
    Object? error,
  });

  $OfferingCopyWith<$Res>? get currentOffering;
  $OfferingMetadataModelCopyWith<$Res>? get offeringMetadata;
}

/// @nodoc
class _$PaywallStateCopyWithImpl<$Res, $Val extends PaywallState> implements $PaywallStateCopyWith<$Res> {
  _$PaywallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaywallState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? currentOffering = freezed,
    Object? offeringMetadata = freezed,
    Object? packagesWithFreeTrialEligible = null,
    Object? selectedPackageId = freezed,
    Object? cheapestPackageId = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            stage: null == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as PaywallStage,
            currentOffering: freezed == currentOffering
                ? _value.currentOffering
                : currentOffering // ignore: cast_nullable_to_non_nullable
                      as Offering?,
            offeringMetadata: freezed == offeringMetadata
                ? _value.offeringMetadata
                : offeringMetadata // ignore: cast_nullable_to_non_nullable
                      as OfferingMetadataModel?,
            packagesWithFreeTrialEligible: null == packagesWithFreeTrialEligible
                ? _value.packagesWithFreeTrialEligible
                : packagesWithFreeTrialEligible // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            selectedPackageId: freezed == selectedPackageId
                ? _value.selectedPackageId
                : selectedPackageId // ignore: cast_nullable_to_non_nullable
                      as String?,
            cheapestPackageId: freezed == cheapestPackageId
                ? _value.cheapestPackageId
                : cheapestPackageId // ignore: cast_nullable_to_non_nullable
                      as String?,
            error: freezed == error ? _value.error : error,
          )
          as $Val,
    );
  }

  /// Create a copy of PaywallState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferingCopyWith<$Res>? get currentOffering {
    if (_value.currentOffering == null) {
      return null;
    }

    return $OfferingCopyWith<$Res>(_value.currentOffering!, (value) {
      return _then(_value.copyWith(currentOffering: value) as $Val);
    });
  }

  /// Create a copy of PaywallState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferingMetadataModelCopyWith<$Res>? get offeringMetadata {
    if (_value.offeringMetadata == null) {
      return null;
    }

    return $OfferingMetadataModelCopyWith<$Res>(_value.offeringMetadata!, (value) {
      return _then(_value.copyWith(offeringMetadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaywallStateImplCopyWith<$Res> implements $PaywallStateCopyWith<$Res> {
  factory _$$PaywallStateImplCopyWith(_$PaywallStateImpl value, $Res Function(_$PaywallStateImpl) then) =
      __$$PaywallStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PaywallStage stage,
    Offering? currentOffering,
    OfferingMetadataModel? offeringMetadata,
    List<String> packagesWithFreeTrialEligible,
    String? selectedPackageId,
    String? cheapestPackageId,
    Object? error,
  });

  @override
  $OfferingCopyWith<$Res>? get currentOffering;
  @override
  $OfferingMetadataModelCopyWith<$Res>? get offeringMetadata;
}

/// @nodoc
class __$$PaywallStateImplCopyWithImpl<$Res> extends _$PaywallStateCopyWithImpl<$Res, _$PaywallStateImpl>
    implements _$$PaywallStateImplCopyWith<$Res> {
  __$$PaywallStateImplCopyWithImpl(_$PaywallStateImpl _value, $Res Function(_$PaywallStateImpl) _then)
    : super(_value, _then);

  /// Create a copy of PaywallState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? currentOffering = freezed,
    Object? offeringMetadata = freezed,
    Object? packagesWithFreeTrialEligible = null,
    Object? selectedPackageId = freezed,
    Object? cheapestPackageId = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$PaywallStateImpl(
        stage: null == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as PaywallStage,
        currentOffering: freezed == currentOffering
            ? _value.currentOffering
            : currentOffering // ignore: cast_nullable_to_non_nullable
                  as Offering?,
        offeringMetadata: freezed == offeringMetadata
            ? _value.offeringMetadata
            : offeringMetadata // ignore: cast_nullable_to_non_nullable
                  as OfferingMetadataModel?,
        packagesWithFreeTrialEligible: null == packagesWithFreeTrialEligible
            ? _value._packagesWithFreeTrialEligible
            : packagesWithFreeTrialEligible // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        selectedPackageId: freezed == selectedPackageId
            ? _value.selectedPackageId
            : selectedPackageId // ignore: cast_nullable_to_non_nullable
                  as String?,
        cheapestPackageId: freezed == cheapestPackageId
            ? _value.cheapestPackageId
            : cheapestPackageId // ignore: cast_nullable_to_non_nullable
                  as String?,
        error: freezed == error ? _value.error : error,
      ),
    );
  }
}

/// @nodoc

class _$PaywallStateImpl implements _PaywallState {
  const _$PaywallStateImpl({
    required this.stage,
    required this.currentOffering,
    required this.offeringMetadata,
    required final List<String> packagesWithFreeTrialEligible,
    required this.selectedPackageId,
    required this.cheapestPackageId,
    required this.error,
  }) : _packagesWithFreeTrialEligible = packagesWithFreeTrialEligible;

  @override
  final PaywallStage stage;
  @override
  final Offering? currentOffering;
  @override
  final OfferingMetadataModel? offeringMetadata;
  final List<String> _packagesWithFreeTrialEligible;
  @override
  List<String> get packagesWithFreeTrialEligible {
    if (_packagesWithFreeTrialEligible is EqualUnmodifiableListView) return _packagesWithFreeTrialEligible;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packagesWithFreeTrialEligible);
  }

  @override
  final String? selectedPackageId;
  @override
  final String? cheapestPackageId;
  @override
  final Object? error;

  @override
  String toString() {
    return 'PaywallState(stage: $stage, currentOffering: $currentOffering, offeringMetadata: $offeringMetadata, packagesWithFreeTrialEligible: $packagesWithFreeTrialEligible, selectedPackageId: $selectedPackageId, cheapestPackageId: $cheapestPackageId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaywallStateImpl &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.currentOffering, currentOffering) || other.currentOffering == currentOffering) &&
            (identical(other.offeringMetadata, offeringMetadata) || other.offeringMetadata == offeringMetadata) &&
            const DeepCollectionEquality().equals(
              other._packagesWithFreeTrialEligible,
              _packagesWithFreeTrialEligible,
            ) &&
            (identical(other.selectedPackageId, selectedPackageId) || other.selectedPackageId == selectedPackageId) &&
            (identical(other.cheapestPackageId, cheapestPackageId) || other.cheapestPackageId == cheapestPackageId) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    stage,
    currentOffering,
    offeringMetadata,
    const DeepCollectionEquality().hash(_packagesWithFreeTrialEligible),
    selectedPackageId,
    cheapestPackageId,
    const DeepCollectionEquality().hash(error),
  );

  /// Create a copy of PaywallState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaywallStateImplCopyWith<_$PaywallStateImpl> get copyWith =>
      __$$PaywallStateImplCopyWithImpl<_$PaywallStateImpl>(this, _$identity);
}

abstract class _PaywallState implements PaywallState {
  const factory _PaywallState({
    required final PaywallStage stage,
    required final Offering? currentOffering,
    required final OfferingMetadataModel? offeringMetadata,
    required final List<String> packagesWithFreeTrialEligible,
    required final String? selectedPackageId,
    required final String? cheapestPackageId,
    required final Object? error,
  }) = _$PaywallStateImpl;

  @override
  PaywallStage get stage;
  @override
  Offering? get currentOffering;
  @override
  OfferingMetadataModel? get offeringMetadata;
  @override
  List<String> get packagesWithFreeTrialEligible;
  @override
  String? get selectedPackageId;
  @override
  String? get cheapestPackageId;
  @override
  Object? get error;

  /// Create a copy of PaywallState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaywallStateImplCopyWith<_$PaywallStateImpl> get copyWith => throw _privateConstructorUsedError;
}
