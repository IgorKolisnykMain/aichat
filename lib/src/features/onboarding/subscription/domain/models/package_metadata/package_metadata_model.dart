import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_metadata_model.freezed.dart';
part 'package_metadata_model.g.dart';

@freezed
abstract class PackageMetadataModel with _$PackageMetadataModel {
  const factory PackageMetadataModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'discount') required double discount,
  }) = _PackageMetadataModel;

  factory PackageMetadataModel.fromJson(Map<String, dynamic> json) => _$PackageMetadataModelFromJson(json);
}
