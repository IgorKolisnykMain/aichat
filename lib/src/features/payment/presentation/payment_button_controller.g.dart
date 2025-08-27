// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_button_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PaymentButtonController)
const paymentButtonControllerProvider = PaymentButtonControllerProvider._();

final class PaymentButtonControllerProvider extends $AsyncNotifierProvider<PaymentButtonController, void> {
  const PaymentButtonControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentButtonControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentButtonControllerHash();

  @$internal
  @override
  PaymentButtonController create() => PaymentButtonController();
}

String _$paymentButtonControllerHash() => r'392e33bb2fd34bad93cdfa4bdfeb409909fd6113';

abstract class _$PaymentButtonController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<AsyncValue<void>, void>, AsyncValue<void>, Object?, Object?>;
    element.handleValue(ref, null);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
