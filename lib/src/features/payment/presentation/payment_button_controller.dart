import 'dart:async';

import 'package:aichat/src/features/payment/application/checkout_service.dart';
import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:aichat/src/utils/notifier_mounted.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_button_controller.g.dart';

@riverpod
class PaymentButtonController extends _$PaymentButtonController with NotifierMounted {
  @override
  Future<void> build() async {
    ref.onDispose(setUnmounted);
    // nothing to do
  }

  Future<void> pay({
    required Product product,
    required bool isWeb,
    String? windowUrl,
    void Function(String)? webUrlCallback,
  }) async {
    final checkoutService = ref.read(checkoutServiceProvider);
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(
      () => checkoutService.pay(
        product: product,
        isWeb: isWeb,
        windowUrl: windowUrl,
        webUrlCallback: webUrlCallback,
      ),
    );
    // * Check if the controller is mounted before setting the state to prevent:
    // * Bad state: Tried to use PaymentButtonController after `dispose` was called.
    if (mounted) {
      state = newState;
    }
  }
}
