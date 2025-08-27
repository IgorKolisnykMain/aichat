import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

typedef ProductID = String;

@freezed
abstract class Product with _$Product {
  const factory Product({
    required ProductID id,
    required String title,
    required String description,
    required double price,
    String? imageUrl,
    @Default(0) int availableQuantity,
    @Default(0.0) double avgRating,
    @Default(0) int numRatings,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
