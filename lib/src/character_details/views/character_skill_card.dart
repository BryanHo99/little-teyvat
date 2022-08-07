import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/views/character_skill_image.dart';
import 'package:little_teyvat/themes/themes.dart';

const double _paddingOffset = 15.0;

class CharacterSkillCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String element;

  const CharacterSkillCard({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.element,
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
        padding: const EdgeInsets.all(_paddingOffset),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 55.0),
              child: CharacterSkillImage(
                id: id,
                element: element,
              ),
            ),
            const SizedBox(
              width: _paddingOffset,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: ktHeading3,
                  ),
                  const Divider(
                    height: 20.0,
                    thickness: 0.8,
                  ),
                  MarkdownBody(data: description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
