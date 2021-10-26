import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/character_details_constants.dart' as constants;
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/shared/widgets/flexible_row.dart';
import 'package:little_teyvat/themes/themes.dart';

class CharacterProfileCv extends StatelessWidget {
  final CharacterModel character;

  const CharacterProfileCv({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                context.tr.cv,
                style: ktHeading1,
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              FlexibleRow(
                title: context.tr.english,
                description: character.cv.english,
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              FlexibleRow(
                title: context.tr.chinese,
                description: character.cv.chinese,
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              FlexibleRow(
                title: context.tr.japanese,
                description: character.cv.japanese,
              ),
              const SizedBox(height: constants.sizedBoxHeight),
              FlexibleRow(
                title: context.tr.korean,
                description: character.cv.korean,
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
