// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paywall_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaywallState {

 PaywallStage get stage; Offering? get currentOffering; OfferingMetadataModel? get offeringMetadata; List<String> get packagesWithFreeTrialEligible; String? get selectedPackageId; String? get cheapestPackageId;
/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaywallStateCopyWith<PaywallState> get copyWith => _$PaywallStateCopyWithImpl<PaywallState>(this as PaywallState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaywallState&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.currentOffering, currentOffering) || other.currentOffering == currentOffering)&&(identical(other.offeringMetadata, offeringMetadata) || other.offeringMetadata == offeringMetadata)&&const DeepCollectionEquality().equals(other.packagesWithFreeTrialEligible, packagesWithFreeTrialEligible)&&(identical(other.selectedPackageId, selectedPackageId) || other.selectedPackageId == selectedPackageId)&&(identical(other.cheapestPackageId, cheapestPackageId) || other.cheapestPackageId == cheapestPackageId));
}


@override
int get hashCode => Object.hash(runtimeType,stage,currentOffering,offeringMetadata,const DeepCollectionEquality().hash(packagesWithFreeTrialEligible),selectedPackageId,cheapestPackageId);

@override
String toString() {
  return 'PaywallState(stage: $stage, currentOffering: $currentOffering, offeringMetadata: $offeringMetadata, packagesWithFreeTrialEligible: $packagesWithFreeTrialEligible, selectedPackageId: $selectedPackageId, cheapestPackageId: $cheapestPackageId)';
}


}

/// @nodoc
abstract mixin class $PaywallStateCopyWith<$Res>  {
  factory $PaywallStateCopyWith(PaywallState value, $Res Function(PaywallState) _then) = _$PaywallStateCopyWithImpl;
@useResult
$Res call({
 PaywallStage stage, Offering? currentOffering, OfferingMetadataModel? offeringMetadata, List<String> packagesWithFreeTrialEligible, String? selectedPackageId, String? cheapestPackageId
});


$OfferingMetadataModelCopyWith<$Res>? get offeringMetadata;

}
/// @nodoc
class _$PaywallStateCopyWithImpl<$Res>
    implements $PaywallStateCopyWith<$Res> {
  _$PaywallStateCopyWithImpl(this._self, this._then);

  final PaywallState _self;
  final $Res Function(PaywallState) _then;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stage = null,Object? currentOffering = freezed,Object? offeringMetadata = freezed,Object? packagesWithFreeTrialEligible = null,Object? selectedPackageId = freezed,Object? cheapestPackageId = freezed,}) {
  return _then(_self.copyWith(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as PaywallStage,currentOffering: freezed == currentOffering ? _self.currentOffering : currentOffering // ignore: cast_nullable_to_non_nullable
as Offering?,offeringMetadata: freezed == offeringMetadata ? _self.offeringMetadata : offeringMetadata // ignore: cast_nullable_to_non_nullable
as OfferingMetadataModel?,packagesWithFreeTrialEligible: null == packagesWithFreeTrialEligible ? _self.packagesWithFreeTrialEligible : packagesWithFreeTrialEligible // ignore: cast_nullable_to_non_nullable
as List<String>,selectedPackageId: freezed == selectedPackageId ? _self.selectedPackageId : selectedPackageId // ignore: cast_nullable_to_non_nullable
as String?,cheapestPackageId: freezed == cheapestPackageId ? _self.cheapestPackageId : cheapestPackageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferingMetadataModelCopyWith<$Res>? get offeringMetadata {
    if (_self.offeringMetadata == null) {
    return null;
  }

  return $OfferingMetadataModelCopyWith<$Res>(_self.offeringMetadata!, (value) {
    return _then(_self.copyWith(offeringMetadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaywallState].
extension PaywallStatePatterns on PaywallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaywallState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaywallState value)  $default,){
final _that = this;
switch (_that) {
case _PaywallState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaywallState value)?  $default,){
final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaywallStage stage,  Offering? currentOffering,  OfferingMetadataModel? offeringMetadata,  List<String> packagesWithFreeTrialEligible,  String? selectedPackageId,  String? cheapestPackageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
return $default(_that.stage,_that.currentOffering,_that.offeringMetadata,_that.packagesWithFreeTrialEligible,_that.selectedPackageId,_that.cheapestPackageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaywallStage stage,  Offering? currentOffering,  OfferingMetadataModel? offeringMetadata,  List<String> packagesWithFreeTrialEligible,  String? selectedPackageId,  String? cheapestPackageId)  $default,) {final _that = this;
switch (_that) {
case _PaywallState():
return $default(_that.stage,_that.currentOffering,_that.offeringMetadata,_that.packagesWithFreeTrialEligible,_that.selectedPackageId,_that.cheapestPackageId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaywallStage stage,  Offering? currentOffering,  OfferingMetadataModel? offeringMetadata,  List<String> packagesWithFreeTrialEligible,  String? selectedPackageId,  String? cheapestPackageId)?  $default,) {final _that = this;
switch (_that) {
case _PaywallState() when $default != null:
return $default(_that.stage,_that.currentOffering,_that.offeringMetadata,_that.packagesWithFreeTrialEligible,_that.selectedPackageId,_that.cheapestPackageId);case _:
  return null;

}
}

}

/// @nodoc


class _PaywallState implements PaywallState {
  const _PaywallState({required this.stage, required this.currentOffering, required this.offeringMetadata, required final  List<String> packagesWithFreeTrialEligible, required this.selectedPackageId, required this.cheapestPackageId}): _packagesWithFreeTrialEligible = packagesWithFreeTrialEligible;
  

@override final  PaywallStage stage;
@override final  Offering? currentOffering;
@override final  OfferingMetadataModel? offeringMetadata;
 final  List<String> _packagesWithFreeTrialEligible;
@override List<String> get packagesWithFreeTrialEligible {
  if (_packagesWithFreeTrialEligible is EqualUnmodifiableListView) return _packagesWithFreeTrialEligible;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packagesWithFreeTrialEligible);
}

@override final  String? selectedPackageId;
@override final  String? cheapestPackageId;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaywallStateCopyWith<_PaywallState> get copyWith => __$PaywallStateCopyWithImpl<_PaywallState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaywallState&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.currentOffering, currentOffering) || other.currentOffering == currentOffering)&&(identical(other.offeringMetadata, offeringMetadata) || other.offeringMetadata == offeringMetadata)&&const DeepCollectionEquality().equals(other._packagesWithFreeTrialEligible, _packagesWithFreeTrialEligible)&&(identical(other.selectedPackageId, selectedPackageId) || other.selectedPackageId == selectedPackageId)&&(identical(other.cheapestPackageId, cheapestPackageId) || other.cheapestPackageId == cheapestPackageId));
}


@override
int get hashCode => Object.hash(runtimeType,stage,currentOffering,offeringMetadata,const DeepCollectionEquality().hash(_packagesWithFreeTrialEligible),selectedPackageId,cheapestPackageId);

@override
String toString() {
  return 'PaywallState(stage: $stage, currentOffering: $currentOffering, offeringMetadata: $offeringMetadata, packagesWithFreeTrialEligible: $packagesWithFreeTrialEligible, selectedPackageId: $selectedPackageId, cheapestPackageId: $cheapestPackageId)';
}


}

/// @nodoc
abstract mixin class _$PaywallStateCopyWith<$Res> implements $PaywallStateCopyWith<$Res> {
  factory _$PaywallStateCopyWith(_PaywallState value, $Res Function(_PaywallState) _then) = __$PaywallStateCopyWithImpl;
@override @useResult
$Res call({
 PaywallStage stage, Offering? currentOffering, OfferingMetadataModel? offeringMetadata, List<String> packagesWithFreeTrialEligible, String? selectedPackageId, String? cheapestPackageId
});


@override $OfferingMetadataModelCopyWith<$Res>? get offeringMetadata;

}
/// @nodoc
class __$PaywallStateCopyWithImpl<$Res>
    implements _$PaywallStateCopyWith<$Res> {
  __$PaywallStateCopyWithImpl(this._self, this._then);

  final _PaywallState _self;
  final $Res Function(_PaywallState) _then;

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stage = null,Object? currentOffering = freezed,Object? offeringMetadata = freezed,Object? packagesWithFreeTrialEligible = null,Object? selectedPackageId = freezed,Object? cheapestPackageId = freezed,}) {
  return _then(_PaywallState(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as PaywallStage,currentOffering: freezed == currentOffering ? _self.currentOffering : currentOffering // ignore: cast_nullable_to_non_nullable
as Offering?,offeringMetadata: freezed == offeringMetadata ? _self.offeringMetadata : offeringMetadata // ignore: cast_nullable_to_non_nullable
as OfferingMetadataModel?,packagesWithFreeTrialEligible: null == packagesWithFreeTrialEligible ? _self._packagesWithFreeTrialEligible : packagesWithFreeTrialEligible // ignore: cast_nullable_to_non_nullable
as List<String>,selectedPackageId: freezed == selectedPackageId ? _self.selectedPackageId : selectedPackageId // ignore: cast_nullable_to_non_nullable
as String?,cheapestPackageId: freezed == cheapestPackageId ? _self.cheapestPackageId : cheapestPackageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PaywallState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferingMetadataModelCopyWith<$Res>? get offeringMetadata {
    if (_self.offeringMetadata == null) {
    return null;
  }

  return $OfferingMetadataModelCopyWith<$Res>(_self.offeringMetadata!, (value) {
    return _then(_self.copyWith(offeringMetadata: value));
  });
}
}

// dart format on
