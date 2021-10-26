import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/character_details_constants.dart' as constants;
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/character_details/models/character_skill_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_model.dart';
import 'package:little_teyvat/src/character_details/views/character_materials_table.dart';
import 'package:little_teyvat/src/character_details/views/character_skill_card.dart';
import 'package:little_teyvat/src/character_details/views/character_talent_card.dart';
import 'package:little_teyvat/themes/themes.dart';

const double _sizedBoxHeight = 10.0;
const double _dividerPadding = 10.0;

class CharacterTalents extends StatelessWidget {
  final CharacterModel character;

  const CharacterTalents({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              child: Text(
                context.tr.talents,
                style: ktHeading1,
              ),
            ),
            const SizedBox(height: _sizedBoxHeight),
            ...character.talents.map(
              (CharacterTalentModel talent) => Column(
                children: <Widget>[
                  CharacterTalentCard(talent: talent),
                  const SizedBox(height: _sizedBoxHeight),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: _dividerPadding),
              child: Divider(
                height: constants.dividerHeight,
                thickness: constants.dividerThickness,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 15.0),
              child: Text(
                context.tr.talentMaterials,
                style: ktHeading1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CharacterMaterialsTable(
                headerTitles: <String>[
                  context.tr.level,
                  context.tr.materials,
                ].lock,
                characterMaterials: character.talentMaterials,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: _dividerPadding),
              child: Divider(
                height: constants.dividerHeight,
                thickness: constants.dividerThickness,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
              child: Text(
                context.tr.passives,
                style: ktHeading1,
              ),
            ),
            ...character.passives.map(
              (CharacterSkillModel passive) => Column(
                children: <Widget>[
                  CharacterSkillCard(
                    title: passive.name,
                    description: passive.description,
                    imageUrl: passive.image.imageUrl,
                  ),
                  const SizedBox(height: _sizedBoxHeight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
