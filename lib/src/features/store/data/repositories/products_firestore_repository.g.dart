// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_firestore_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(productsRepository)
const productsRepositoryProvider = ProductsRepositoryProvider._();

final class ProductsRepositoryProvider
    extends $FunctionalProvider<ProductsRepository, ProductsRepository, ProductsRepository>
    with $Provider<ProductsRepository> {
  const ProductsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductsRepository create(Ref ref) {
    return productsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsRepository>(value),
    );
  }
}

String _$productsRepositoryHash() => r'1f3a9c163a59a13da4af68245c3b084e383a7c3c';

@ProviderFor(productsListStream)
const productsListStreamProvider = ProductsListStreamProvider._();

final class ProductsListStreamProvider
    extends $FunctionalProvider<AsyncValue<List<Product>>, List<Product>, Stream<List<Product>>>
    with $FutureModifier<List<Product>>, $StreamProvider<List<Product>> {
  const ProductsListStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsListStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsListStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Product>> create(Ref ref) {
    return productsListStream(ref);
  }
}

String _$productsListStreamHash() => r'22462209e383d9cb6a76936536ec6a6993ce872a';

@ProviderFor(productsListFuture)
const productsListFutureProvider = ProductsListFutureProvider._();

final class ProductsListFutureProvider
    extends $FunctionalProvider<AsyncValue<List<Product>>, List<Product>, FutureOr<List<Product>>>
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  const ProductsListFutureProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsListFutureProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsListFutureHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return productsListFuture(ref);
  }
}

String _$productsListFutureHash() => r'742610200192d5593bc85a891d018f70898e048a';

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

String _$productsListSearchHash() => r'4b1552756825a19d71d09667f1a7d4ce638d21ce';

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
