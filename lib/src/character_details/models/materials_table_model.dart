import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/src/character_details/models/material_row_model.dart';

abstract class MaterialsTableModel {
  final IList<MaterialRowModel> materials;

  const MaterialsTableModel({
    required this.materials,
  });
}
