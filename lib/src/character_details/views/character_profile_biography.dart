import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/character_details_constants.dart' as constants;
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/shared/widgets/flexible_row.dart';
import 'package:little_teyvat/themes/themes.dart';

class CharacterProfileBiography extends StatelessWidget {
  final CharacterModel character;

  const CharacterProfileBiography({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          character.description,
          textAlign: TextAlign.center,
        ),
        const Divider(
          height: constants.dividerHeight,
          thickness: constants.dividerThickness,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    context.tr.biography,
                    style: ktHeading1,
                  ),
                ],
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              FlexibleRow(
                title: context.tr.title,
                description: character.title,
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              FlexibleRow(
                title: context.tr.affiliation,
                description: character.affiliation,
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              FlexibleRow(
                title: context.tr.birthday,
                description: character.birthday,
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              FlexibleRow(
                title: context.tr.constellation,
                description: character.constellation,
              ),
            ],
          ),
        ),
        const Divider(
          height: constants.dividerHeight,
          thickness: constants.dividerThickness,
        ),
      ],
    );
  }
}
