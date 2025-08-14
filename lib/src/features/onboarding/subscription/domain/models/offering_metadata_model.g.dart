// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offering_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferingMetadataModel _$OfferingMetadataModelFromJson(
  Map<String, dynamic> json,
) => _OfferingMetadataModel(
  packages: (json['packages'] as List<dynamic>)
      .map((e) => PackageMetadataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OfferingMetadataModelToJson(
  _OfferingMetadataModel instance,
) => <String, dynamic>{'packages': instance.packages};
