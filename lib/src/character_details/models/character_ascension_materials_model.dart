import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/material_row_model.dart';
import 'package:little_teyvat/src/character_details/models/materials_table_model.dart';

part 'character_ascension_materials_model.freezed.dart';
part 'character_ascension_materials_model.g.dart';

@freezed
class CharacterAscensionMaterialsModel with _$CharacterAscensionMaterialsModel implements MaterialsTableModel {
  const factory CharacterAscensionMaterialsModel({
    @JsonKey(name: 'ascensionMaterials') required IList<MaterialRowModel> materials,
  }) = _CharacterAscensionMaterialsModel;

  factory CharacterAscensionMaterialsModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterAscensionMaterialsModelFromJson(json);
}
