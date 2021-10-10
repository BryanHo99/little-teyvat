import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/strapi/models/strapi_image_model.dart';

part 'material_model.freezed.dart';
part 'material_model.g.dart';

@freezed
class MaterialModel with _$MaterialModel {
  const factory MaterialModel({
    required int amount,
    required StrapiImageModel image,
  }) = _MaterialModel;

  factory MaterialModel.fromJson(Map<String, dynamic> json) => _$MaterialModelFromJson(json);
}
