import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/material_model.dart';

part 'materials_model.freezed.dart';
part 'materials_model.g.dart';

@freezed
class MaterialsModel with _$MaterialsModel {
  const factory MaterialsModel({
    required int level,
    required IList<MaterialModel> materials,
  }) = _MaterialsModel;

  factory MaterialsModel.fromJson(Map<String, dynamic> json) => _$MaterialsModelFromJson(json);
}
