// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_sessions_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(checkoutSessionsRepository)
const checkoutSessionsRepositoryProvider = CheckoutSessionsRepositoryProvider._();

final class CheckoutSessionsRepositoryProvider
    extends $FunctionalProvider<CheckoutSessionsRepository, CheckoutSessionsRepository, CheckoutSessionsRepository>
    with $Provider<CheckoutSessionsRepository> {
  const CheckoutSessionsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutSessionsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutSessionsRepositoryHash();

  @$internal
  @override
  $ProviderElement<CheckoutSessionsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckoutSessionsRepository create(Ref ref) {
    return checkoutSessionsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckoutSessionsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckoutSessionsRepository>(value),
    );
  }
}

String _$checkoutSessionsRepositoryHash() => r'28a211029e5db05813c91b0cf49bd5cc75000fc0';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
