import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/material_model.dart';

part 'material_row_model.freezed.dart';
part 'material_row_model.g.dart';

@freezed
class MaterialRowModel with _$MaterialRowModel {
  const factory MaterialRowModel({
    required int level,
    required IList<MaterialModel> materials,
  }) = _MaterialRowModel;

  factory MaterialRowModel.fromJson(Map<String, dynamic> json) => _$MaterialRowModelFromJson(json);
}
