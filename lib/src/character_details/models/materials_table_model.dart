import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/src/character_details/models/materials_model.dart';

abstract class MaterialsTableModel {
  final IList<MaterialsModel> materials;

  const MaterialsTableModel({
    required this.materials,
  });
}
