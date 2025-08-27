import 'package:aichat/src/features/store/domain/models/product.dart';
import 'package:aichat/src/features/store/domain/repositories/products_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_firestore_repository.g.dart';

class ProductsFirestoreRepository implements ProductsRepository {
  const ProductsFirestoreRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String productsPath() => 'products';
  static String productPath(ProductID id) => 'products/$id';

  @override
  Future<List<Product>> fetchProductsList() async {
    final ref = _productsRef();
    final snapshot = await ref.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  @override
  Stream<List<Product>> watchProductsList() {
    final ref = _productsRef();
    return ref.snapshots().map((snapshot) => snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList());
  }

  @override
  Future<Product?> fetchProduct(ProductID id) async {
    final ref = _productRef(id);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  @override
  Stream<Product?> watchProduct(ProductID id) {
    final ref = _productRef(id);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    // Get all products from Firestore
    final productsList = await fetchProductsList();
    // Perform client-side filtering
    return productsList.where((product) => product.title.toLowerCase().contains(query.toLowerCase())).toList();
  }

  DocumentReference<Product> _productRef(ProductID id) => _firestore
      .doc(productPath(id))
      .withConverter(
        fromFirestore: (doc, _) => Product.fromJson(doc.data()!),
        toFirestore: (Product product, options) => product.toJson(),
      );

  Query<Product> _productsRef() => _firestore
      .collection(productsPath())
      .withConverter(
        fromFirestore: (doc, _) => Product.fromJson(doc.data()!),
        toFirestore: (Product product, options) => product.toJson(),
      )
      .orderBy('title');
}

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(Ref ref) {
  return ProductsFirestoreRepository(FirebaseFirestore.instance);
}

// Stream provider for products
@riverpod
Stream<List<Product>> productsListStream(Ref ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProductsList();
}

// Future provider for products
@riverpod
Future<List<Product>> productsListFuture(Ref ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductsList();
}

// Search provider with caching
@riverpod
Future<List<Product>> productsListSearch(Ref ref, String query) {
  final link = ref.keepAlive();
  // When the provider is destroyed, cancel the timer
  ref.onDispose(() {
    // Nothing to dispose for now
  });
  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() {
    Future.delayed(const Duration(seconds: 30), () {
      link.close();
    });
  });
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.searchProducts(query);
}
