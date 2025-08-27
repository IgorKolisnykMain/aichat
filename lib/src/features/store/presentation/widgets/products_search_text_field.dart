import 'package:aichat/src/features/store/presentation/controllers/products_search_query_notifier.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Search field used to filter products by name
class ProductsSearchTextField extends ConsumerStatefulWidget {
  const ProductsSearchTextField({super.key});

  @override
  ConsumerState<ProductsSearchTextField> createState() => _ProductsSearchTextFieldState();
}

class _ProductsSearchTextFieldState extends ConsumerState<ProductsSearchTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        return TextField(
          controller: _controller,
          style: context.textStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: context.l10n.searchProducts,
            hintStyle: context.textStyles.bodyMedium.copyWithColor(
              context.colors.textSecondary,
            ),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: value.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                      ref.read(productsSearchQueryNotifierProvider.notifier).setQuery('');
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
            filled: true,
            fillColor: context.colors.backgroundAccent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.rr),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.rw,
              vertical: 12.rh,
            ),
          ),
          onChanged: (text) => ref.read(productsSearchQueryNotifierProvider.notifier).setQuery(text),
        );
      },
    );
  }
}
