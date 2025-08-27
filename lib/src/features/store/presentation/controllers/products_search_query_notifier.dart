import 'package:aichat/src/features/store/data/repositories/products_firestore_repository.dart';
import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_search_query_notifier.g.dart';

/// A simple notifier class to keep track of the search query
@riverpod
class ProductsSearchQueryNotifier extends _$ProductsSearchQueryNotifier {
  /// By default, return an empty query
  @override
  String build() => '';

  void setQuery(String query) {
    state = query;
  }
}

/// A provider that returns the search results for the current search query
@riverpod
Future<List<Product>> productsSearchResults(Ref ref) {
  final searchQuery = ref.watch(productsSearchQueryNotifierProvider);
  if (searchQuery.isEmpty) {
    // Return all products if no search query
    return ref.watch(productsListFutureProvider.future);
  }
  return ref.watch(productsListSearchProvider(searchQuery).future);
}
