// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageMetadataModel _$PackageMetadataModelFromJson(
  Map<String, dynamic> json,
) => _PackageMetadataModel(
  id: json['id'] as String,
  discount: (json['discount'] as num).toDouble(),
);

Map<String, dynamic> _$PackageMetadataModelToJson(
  _PackageMetadataModel instance,
) => <String, dynamic>{'id': instance.id, 'discount': instance.discount};
