// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_search_query_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// A simple notifier class to keep track of the search query
@ProviderFor(ProductsSearchQueryNotifier)
const productsSearchQueryNotifierProvider =
    ProductsSearchQueryNotifierProvider._();

/// A simple notifier class to keep track of the search query
final class ProductsSearchQueryNotifierProvider
    extends $NotifierProvider<ProductsSearchQueryNotifier, String> {
  /// A simple notifier class to keep track of the search query
  const ProductsSearchQueryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsSearchQueryNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsSearchQueryNotifierHash();

  @$internal
  @override
  ProductsSearchQueryNotifier create() => ProductsSearchQueryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$productsSearchQueryNotifierHash() =>
    r'f152b788f3f9d4df44092e1b9ffd8ed4dd878d87';

abstract class _$ProductsSearchQueryNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(productsSearchResults)
const productsSearchResultsProvider = ProductsSearchResultsProvider._();

final class ProductsSearchResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  const ProductsSearchResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsSearchResultsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsSearchResultsHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return productsSearchResults(ref);
  }
}

String _$productsSearchResultsHash() =>
    r'd6270ebf410842b4e50182c87a49e1c9fe7037b6';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
