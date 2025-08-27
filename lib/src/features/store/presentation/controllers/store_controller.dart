import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:aichat/src/features/store/presentation/controllers/products_search_query_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_controller.g.dart';

@riverpod
class StoreController extends _$StoreController {
  @override
  Future<List<Product>> build() async {
    // Watch search results - will rebuild when query changes
    return ref.watch(productsSearchResultsProvider.future);
  }

  /// Refresh products list - invalidate the search results provider
  Future<void> refreshProducts() async {
    ref.invalidate(productsSearchResultsProvider);
  }
}
