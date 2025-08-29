import 'package:aichat/src/common_widgets/custom_image.dart';
import 'package:aichat/src/constants/app_sizes.dart';
import 'package:aichat/src/features/checkout/presentation/payment_button.dart';
import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:aichat/src/utils/currency_formatter.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceFormatted = ref.watch(currencyFormatterProvider).format(product.price);
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomImage(imageUrl: product.imageUrl),
              gapH8,
              const Divider(),
              gapH8,
              Text(product.title, style: Theme.of(context).textTheme.titleLarge),
              gapH8,
              Text(product.description, style: Theme.of(context).textTheme.bodyMedium),
              gapH8,
              Text(priceFormatted, style: Theme.of(context).textTheme.headlineSmall),
              gapH4,
              Text(
                product.availableQuantity <= 0
                    ? context.l10n.outOfStock
                    : context.l10n.quantity(product.availableQuantity),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              gapH8,
              PaymentButton(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
