import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/character_details_constants.dart' as constants;
import 'package:little_teyvat/src/character_details/models/character_talent_model.dart';
import 'package:little_teyvat/src/character_details/views/character_skill_image.dart';
import 'package:little_teyvat/src/character_details/views/character_stats_table.dart';

class CharacterTalentCard extends StatelessWidget {
  final String element;
  final CharacterTalentModel talent;

  const CharacterTalentCard({
    Key? key,
    required this.element,
    required this.talent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: context.theme.canvasColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              leading: CharacterSkillImage(
                id: talent.id,
                element: element,
              ),
              title: Text(talent.name),
            ),
            const Divider(
              height: constants.dividerHeight,
              thickness: constants.dividerThickness,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: MarkdownBody(
                data: talent.description,
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            ExpansionTile(
              collapsedIconColor: context.theme.primaryColor,
              collapsedTextColor: context.theme.primaryColor,
              iconColor: context.theme.primaryColor,
              textColor: context.theme.primaryColor,
              tilePadding: const EdgeInsets.symmetric(horizontal: 6.0),
              childrenPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              title: Text(context.tr.talentStats),
              children: <Widget>[
                CharacterStatsTable(
                  header: <String>[
                    context.tr.level,
                    for (int i = 1; i <= talent.rowCount(); i++) i.toString(),
                  ].lock,
                  characterStats: talent.stats,
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
