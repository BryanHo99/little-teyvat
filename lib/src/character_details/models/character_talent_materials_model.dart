import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/material_row_model.dart';
import 'package:little_teyvat/src/character_details/models/materials_table_model.dart';

part 'character_talent_materials_model.freezed.dart';
part 'character_talent_materials_model.g.dart';

@freezed
class CharacterTalentMaterialsModel with _$CharacterTalentMaterialsModel implements MaterialsTableModel {
  const factory CharacterTalentMaterialsModel({
    @JsonKey(name: 'talentMaterials') required IList<MaterialRowModel> materials,
  }) = _CharacterTalentMaterialsModel;

  factory CharacterTalentMaterialsModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterTalentMaterialsModelFromJson(json);
}
