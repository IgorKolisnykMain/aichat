// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  imageUrl: json['imageUrl'] as String?,
  availableQuantity: (json['availableQuantity'] as num?)?.toInt() ?? 0,
  avgRating: (json['avgRating'] as num?)?.toDouble() ?? 0.0,
  numRatings: (json['numRatings'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'price': instance.price,
  'imageUrl': instance.imageUrl,
  'availableQuantity': instance.availableQuantity,
  'avgRating': instance.avgRating,
  'numRatings': instance.numRatings,
};
