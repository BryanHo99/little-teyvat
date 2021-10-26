import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/character_details_constants.dart' as constants;
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/character_details/views/character_materials_table.dart';
import 'package:little_teyvat/src/character_details/views/character_stats_table.dart';
import 'package:little_teyvat/themes/themes.dart';

class CharacterProfileAscension extends StatelessWidget {
  final CharacterModel character;

  const CharacterProfileAscension({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                context.tr.ascensionStats,
                style: ktHeading2
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              CharacterStatsTable(
                header: <String>[
                  context.tr.level,
                  context.tr.baseHp,
                  context.tr.baseAtk,
                  context.tr.baseDef,
                  character.substat,
                ].lock,
                characterStats: character.ascensionStats,
              ),
            ],
          ),
        ),
        const Divider(
          height: constants.dividerHeight,
          thickness: constants.dividerThickness,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                context.tr.ascensionMaterials,
                style: ktHeading1,
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              CharacterMaterialsTable(
                headerTitles: <String>[
                  context.tr.rank,
                  context.tr.materials,
                ].lock,
                characterMaterials: character.ascensionMaterials,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
