// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Class used to search products using the Algolia Dart Client
@ProviderFor(ProductsSearchRepository)
const productsSearchRepositoryProvider = ProductsSearchRepositoryProvider._();

/// Class used to search products using the Algolia Dart Client
final class ProductsSearchRepositoryProvider
    extends $NotifierProvider<ProductsSearchRepository, ProductsSearchRepository> {
  /// Class used to search products using the Algolia Dart Client
  const ProductsSearchRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsSearchRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsSearchRepositoryHash();

  @$internal
  @override
  ProductsSearchRepository create() => ProductsSearchRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsSearchRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsSearchRepository>(value),
    );
  }
}

String _$productsSearchRepositoryHash() => r'510fcbe1665aca5357dd801b2530b234aa72842d';

abstract class _$ProductsSearchRepository extends $Notifier<ProductsSearchRepository> {
  ProductsSearchRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProductsSearchRepository, ProductsSearchRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductsSearchRepository, ProductsSearchRepository>,
              ProductsSearchRepository,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(productsListSearch)
const productsListSearchProvider = ProductsListSearchFamily._();

final class ProductsListSearchProvider
    extends $FunctionalProvider<AsyncValue<List<Product>>, List<Product>, FutureOr<List<Product>>>
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  const ProductsListSearchProvider._({
    required ProductsListSearchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productsListSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productsListSearchHash();

  @override
  String toString() {
    return r'productsListSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    final argument = this.argument as String;
    return productsListSearch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsListSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productsListSearchHash() => r'4708fcdee14196b7c62f8bfe42f69ead79bffdcc';

final class ProductsListSearchFamily extends $Family with $FunctionalFamilyOverride<FutureOr<List<Product>>, String> {
  const ProductsListSearchFamily._()
    : super(
        retry: null,
        name: r'productsListSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductsListSearchProvider call(String query) => ProductsListSearchProvider._(argument: query, from: this);

  @override
  String toString() => r'productsListSearchProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
