import 'dart:async';

import 'package:aichat/src/features/store/data/repositories/products_search_repository.dart';
import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'products_search_query_notifier.g.dart';

/// A simple notifier class to keep track of the search query
@riverpod
class ProductsSearchQueryNotifier extends _$ProductsSearchQueryNotifier {
  /// Used to debounce the input queries
  final _searchQueryController = StreamController<String>();
  late final StreamSubscription<String> _subscription;
  @override
  String build() {
    // debounce the inputs
    _subscription = _searchQueryController.stream.debounceTime(const Duration(milliseconds: 200)).listen(_updateState);
    ref.onDispose(() {
      _searchQueryController.close();
      _subscription.cancel();
    });
    return '';
  }

  void _updateState(String query) => state = query;

  void setQuery(String query) {
    _searchQueryController.sink.add(query);
  }
}

@riverpod
Future<List<Product>> productsSearchResults(Ref ref) {
  final searchQuery = ref.watch(productsSearchQueryNotifierProvider);
  return ref.watch(productsListSearchProvider(searchQuery).future);
}
