import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/src/character_details/models/material_row_model.dart';
import 'package:little_teyvat/src/character_details/models/material_model.dart';
import 'package:little_teyvat/src/character_details/models/materials_table_model.dart';

class CharacterMaterialsTable extends StatelessWidget {
  final IList<String> headerTitles;
  final MaterialsTableModel characterMaterials;

  const CharacterMaterialsTable({
    Key? key,
    required this.headerTitles,
    required this.characterMaterials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IgnorePointer(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.minWidth),
            child: DataTable(
              headingRowHeight: 30.0,
              horizontalMargin: 0.0,
              columnSpacing: 30.0,
              columns: <DataColumn>[
                ...headerTitles.map(
                  (String headerTitle) => DataColumn(
                    label: Text(
                      headerTitle,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                ...characterMaterials.materials.map(
                  (MaterialRowModel row) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(row.level.toString())),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ...row.materials.map((MaterialModel material) {
                              final String materialImagePath = '${assets.itemImagesPath}/${material.type}/${material.key}.png';

                              return Row(
                                children: <Widget>[
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(maxWidth: 40),
                                    child: Image.asset(materialImagePath),
                                  ),
                                  Text('x${material.amount}'),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
