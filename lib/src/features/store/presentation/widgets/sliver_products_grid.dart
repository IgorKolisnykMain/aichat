import 'dart:math';

import 'package:aichat/src/common_widgets/loading/async_value_widget.dart';
import 'package:aichat/src/constants/app_sizes.dart';
import 'package:aichat/src/constants/breakpoints.dart';
import 'package:aichat/src/features/store/data/repositories/products_firestore_repository.dart';
import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:aichat/src/features/store/presentation/widgets/product_card.dart';
import 'package:aichat/src/utils/extensions/build_context_extensions.dart';
import 'package:aichat/src/utils/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SliverProductsGrid extends ConsumerWidget {
  const SliverProductsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: restore search functionality
    // final productsListValue = ref.watch(productsSearchResultsProvider);
    final productsListValue = ref.watch(productsListStreamProvider);
    return AsyncValueSliverWidget<List<Product>>(
      value: productsListValue,
      data: (products) => SliverProductsAlignedGrid(
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return ProductCard(
            product: product,
          );
        },
      ),
    );
  }
}

class SliverProductsAlignedGrid extends StatelessWidget {
  const SliverProductsAlignedGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  /// Total number of items to display.
  final int itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            context.l10n.noProductsFound,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      );
    }
    // use a LayoutBuilder to determine the crossAxisCount
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        // width of the screen
        final width = constraints.crossAxisExtent;
        // max width allowed for the sliver
        final maxWidth = min(width, Breakpoint.desktop);
        // use 1 column for width < 500px
        // then add one more column for each 250px
        final crossAxisCount = max(1, maxWidth ~/ 250);
        // calculate a "responsive" padding that increases
        // when the width is greater than the desktop breakpoint
        // this is used to center the content horizontally on large screens
        final padding = width > Breakpoint.desktop + Sizes.p32.rw ? (width - Breakpoint.desktop) / 2 : Sizes.p16.rw;
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: Sizes.p16.rh),
          sliver: SliverAlignedGrid.count(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: Sizes.p24,
            crossAxisSpacing: Sizes.p24,
            itemBuilder: itemBuilder,
            itemCount: itemCount,
          ),
        );
      },
    );
  }
}
