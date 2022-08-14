import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/helpers/helpers.dart' as helper;
import 'package:little_teyvat/src/shared/controllers/colour_controller.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterSkillImage extends ConsumerWidget {
  final String id;
  final String element;

  const CharacterSkillImage({
    Key? key,
    required this.id,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            ref.watch(colourController).getForegroundColor(element),
            ref.watch(colourController).getBackgroundColor(element),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: AssetImage(helper.getSkillImagePath(id)),
          ),
        ),
      ),
    );
  }
}
