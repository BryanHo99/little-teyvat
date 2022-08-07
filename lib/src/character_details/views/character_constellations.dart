import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/character_details/models/character_skill_model.dart';
import 'package:little_teyvat/src/character_details/views/character_skill_card.dart';
import 'package:little_teyvat/themes/themes.dart';

const double _sizedBoxHeight = 10.0;

class CharacterConstellations extends StatelessWidget {
  final CharacterModel character;

  const CharacterConstellations({
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
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
              child: Text(
                context.tr.constellations,
                style: ktHeading1,
              ),
            ),
            ...character.constellations.map(
              (CharacterSkillModel constellation) => Column(
                children: <Widget>[
                  CharacterSkillCard(
                    id: constellation.id,
                    title: constellation.name,
                    description: constellation.description,
                    element: character.element,
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
