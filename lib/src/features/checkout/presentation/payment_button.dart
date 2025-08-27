import 'package:aichat/src/common_widgets/buttons/app_primary_button.dart';
import 'package:aichat/src/features/payment/presentation/payment_button_controller.dart';
import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:aichat/src/utils/async_value_ui.dart';
// * a conditional import is required here since on mobile we can't use dart:html
import 'package:aichat/src/utils/html_window_url/html_window_url_stub.dart'
    if (dart.library.html) 'package:aichat/src/utils/html_window_url/html_window_url_web.dart'
    if (dart.library.io) 'package:aichat/src/utils/html_window_url/html_window_url_non_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Button used to initiate the payment flow.
class PaymentButton extends ConsumerWidget {
  const PaymentButton({super.key, required this.product});

  final Product product;

  Future<void> _pay(BuildContext context, WidgetRef ref) async {
    // * the current window URL will be used to generate the redirect path
    // * for Stripe checkout (web only)
    final windowUrl = getHtmlWindowUrl();
    // * start the payment process
    // * note that this won't work with the Firebase Local Emulator since the
    // * Firebase Stripe extension can only write to the real Firestore backend
    await ref
        .read(paymentButtonControllerProvider.notifier)
        .pay(
          isWeb: kIsWeb,
          windowUrl: windowUrl,
          webUrlCallback: setHtmlWindowUrl,
          product: product,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      paymentButtonControllerProvider,
      (_, state) => state.showSnackBarOnError(context),
    );
    final state = ref.watch(paymentButtonControllerProvider);
    return AppPrimaryButton.infinity(
      text: 'Buy in one click',
      isLoading: state.isLoading,
      onPressed: () => _pay(context, ref),
    );
  }
}
