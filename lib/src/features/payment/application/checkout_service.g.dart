// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(checkoutService)
const checkoutServiceProvider = CheckoutServiceProvider._();

final class CheckoutServiceProvider extends $FunctionalProvider<CheckoutService, CheckoutService, CheckoutService>
    with $Provider<CheckoutService> {
  const CheckoutServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutServiceHash();

  @$internal
  @override
  $ProviderElement<CheckoutService> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  CheckoutService create(Ref ref) {
    return checkoutService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckoutService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckoutService>(value),
    );
  }
}

String _$checkoutServiceHash() => r'5eb3bc74e086e921d8b0c447576bedbda26d4145';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
