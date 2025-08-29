import 'dart:async';

import 'package:aichat/src/core/config/data/repository/app_config_repository_impl.dart';
import 'package:aichat/src/features/store/data/repositories/products_firestore_repository.dart';
import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:algoliasearch/algoliasearch_lite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_search_repository.g.dart';

/// Class used to search products using the Algolia Dart Client
@Riverpod(keepAlive: true)
class ProductsSearchRepository extends _$ProductsSearchRepository {
  late final SearchClient _searcherClient;

  @override
  ProductsSearchRepository build() {
    final appConfig = ref.watch(appConfigRepositoryProvider);
    _searcherClient = SearchClient(
      appId: appConfig.config.algoliaAppId,
      apiKey: appConfig.config.algoliaSearchKey,
    );
    return this;
  }

  /// Search for the given text an return a list of products
  Future<List<Product>> search(String text) async {
    final queryHits = SearchForHits(
      query: text,
      // * Use the index name that is configured in the Algolia dashboard
      // * https://dashboard.algolia.com/apps/APP_ID/explorer/browse
      indexName: 'products_index',
    );
    final responseHits = await _searcherClient.searchIndex(request: queryHits);
    return responseHits.hits.map((hit) => Product.fromJson(Map.fromEntries(hit.entries))).toList();
  }
}

@riverpod
Future<List<Product>> productsListSearch(Ref ref, String query) async {
  final link = ref.keepAlive();
  // a timer to be used by the callbacks below
  Timer? timer;
  // When the provider is destroyed, cancel the timer
  ref.onDispose(() {
    timer?.cancel();
  });
  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() {
    // start a 30 second timer
    timer = Timer(const Duration(seconds: 30), () {
      // dispose on timeout
      link.close();
    });
  });
  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() {
    timer?.cancel();
  });
  if (query.isNotEmpty) {
    // * if the query is not empty, use the search repository (one-time read)
    final searchRepository = ref.watch(productsSearchRepositoryProvider);
    return searchRepository.search(query);
  } else {
    // * otherwise, use the default stream provider (realtime data)
    return ref.watch(productsListStreamProvider.future);
  }
}
