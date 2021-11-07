import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/helpers/helpers.dart' as helper;
import 'package:little_teyvat/src/character_details/models/material_model.dart';
import 'package:little_teyvat/src/character_details/models/materials_model.dart';
import 'package:little_teyvat/themes/themes.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterMaterialsTable extends StatelessWidget {
  final IList<String> headerTitles;
  final IList<MaterialsModel> characterMaterials;

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
                      style: ktBody,
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                ...characterMaterials.map(
                  (MaterialsModel row) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(row.level.toString())),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ...row.materials.map(
                              (MaterialModel material) => Row(
                                children: <Widget>[
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(maxWidth: 40),
                                    child: FadeInImage(
                                      placeholder: MemoryImage(kTransparentImage),
                                      image: AssetImage(helper.getItemPath(material.image)),
                                    ),
                                  ),
                                  Text('x${material.amount}'),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                ],
                              ),
                            ),
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
