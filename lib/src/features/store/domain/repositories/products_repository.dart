import 'package:aichat/src/features/store/domain/models/product.dart';

abstract interface class ProductsRepository {
  /// Fetch all products from the data source
  Future<List<Product>> fetchProductsList();

  /// Watch all products from the data source as a stream
  Stream<List<Product>> watchProductsList();

  /// Fetch a specific product by ID
  Future<Product?> fetchProduct(ProductID id);

  /// Watch a specific product by ID as a stream
  Stream<Product?> watchProduct(ProductID id);

  /// Search products by query (title contains query)
  Future<List<Product>> searchProducts(String query);
}
