// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offering_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferingMetadataModelImpl _$$OfferingMetadataModelImplFromJson(
  Map<String, dynamic> json,
) => _$OfferingMetadataModelImpl(
  packages: (json['packages'] as List<dynamic>)
      .map((e) => PackageMetadataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$OfferingMetadataModelImplToJson(
  _$OfferingMetadataModelImpl instance,
) => <String, dynamic>{'packages': instance.packages};
