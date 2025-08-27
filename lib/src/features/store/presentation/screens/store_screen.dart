import 'package:aichat/src/common_widgets/responsive_UI/responsive_center.dart';
import 'package:aichat/src/constants/app_sizes.dart' show Sizes;
import 'package:aichat/src/features/store/presentation/widgets/app_bar/store_app_bar.dart';
import 'package:aichat/src/features/store/presentation/widgets/products_search_text_field.dart';
import 'package:aichat/src/features/store/presentation/widgets/sliver_products_grid.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreScreen extends ConsumerStatefulWidget {
  const StoreScreen({super.key});

  @override
  ConsumerState<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends ConsumerState<StoreScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_dismissOnScreenKeyboard);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_dismissOnScreenKeyboard);
    super.dispose();
  }

  // When the search text field gets the focus, the keyboard appears on mobile.
  // This method is used to dismiss the keyboard when the user scrolls.
  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Search Field
          ResponsiveSliverCenter(
            padding: EdgeInsets.all(Sizes.p16.rsp),
            child: const ProductsSearchTextField(),
          ),

          // Products Grid
          const SliverProductsGrid(),
        ],
      ),
    );
  }
}
