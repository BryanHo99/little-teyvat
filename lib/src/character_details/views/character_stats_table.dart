import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/src/character_details/models/stats_model.dart';
import 'package:little_teyvat/themes/themes.dart';

class CharacterStatsTable extends StatelessWidget {
  final IList<String> header;
  final IList<StatsModel> characterStats;

  const CharacterStatsTable({
    Key? key,
    required this.header,
    required this.characterStats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IgnorePointer(
        child: DataTable(
          headingRowHeight: 30.0,
          dataRowHeight: 30.0,
          horizontalMargin: 0.0,
          columnSpacing: 30.0,
          columns: <DataColumn>[
            ...header.map(
              (String headerTitle) => DataColumn(
                label: Text(
                  headerTitle,
                  style: ktBody,
                ),
              ),
            )
          ],
          rows: <DataRow>[
            ...characterStats.map(
              (StatsModel row) => DataRow(
                cells: <DataCell>[
                  ...row.getStat().map(
                        (String stat) => DataCell(Text(stat)),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
