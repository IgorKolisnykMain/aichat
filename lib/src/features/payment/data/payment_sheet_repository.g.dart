// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_sheet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(paymentSheetRepository)
const paymentSheetRepositoryProvider = PaymentSheetRepositoryProvider._();

final class PaymentSheetRepositoryProvider
    extends $FunctionalProvider<PaymentSheetRepository, PaymentSheetRepository, PaymentSheetRepository>
    with $Provider<PaymentSheetRepository> {
  const PaymentSheetRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentSheetRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentSheetRepositoryHash();

  @$internal
  @override
  $ProviderElement<PaymentSheetRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PaymentSheetRepository create(Ref ref) {
    return paymentSheetRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentSheetRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentSheetRepository>(value),
    );
  }
}

String _$paymentSheetRepositoryHash() => r'99dd30afbc86b1bc6a854cf7d99aba1d4924503e';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
