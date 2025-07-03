import 'package:aichat/domain/model/package_metadata/package_metadata_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offering_metadata_model.freezed.dart';
part 'offering_metadata_model.g.dart';

@freezed
abstract class OfferingMetadataModel with _$OfferingMetadataModel {
  const factory OfferingMetadataModel({@JsonKey(name: 'packages') required List<PackageMetadataModel> packages}) =
      _OfferingMetadataModel;

  factory OfferingMetadataModel.fromJson(Map<String, dynamic> json) => _$OfferingMetadataModelFromJson(json);
}
