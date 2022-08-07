import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/helpers/helpers.dart' as helper;
import 'package:little_teyvat/routes/arguments/character_details_arguments.dart';
import 'package:little_teyvat/routes/route_constants.dart' as routes;
import 'package:little_teyvat/src/app_drawer/controllers/navigation_controller.dart';
import 'package:little_teyvat/src/characters/characters_constants.dart' as constants;
import 'package:little_teyvat/src/characters/views/character_card_painter.dart';
import 'package:little_teyvat/src/shared/controllers/colour_controller.dart';
import 'package:little_teyvat/src/shared/views/rarity.dart';
import 'package:little_teyvat/themes/themes.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterCard extends StatelessWidget {
  final String id;
  final String name;
  final String element;
  final int rarity;
  final IList<String> materials;

  const CharacterCard({
    Key? key,
    required this.id,
    required this.name,
    required this.element,
    required this.rarity,
    required this.materials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: constants.characterCardHeight,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Card(
              color: ref.watch(colourController).getBackgroundColor(element),
              clipBehavior: Clip.antiAlias,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: <Widget>[
                  CustomPaint(
                    painter: CharacterCardPainter(
                      color: ref.watch(colourController).getForegroundColor(element),
                    ),
                    willChange: false,
                    child: Container(),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: AssetImage(helper.getElementPath(element)),
                      width: constants.elementImageWidth,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.0,
                        child: FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: AssetImage(helper.getCharacterIconImagePath(id)),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3.0, 20.0, 10.0, 0.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  name,
                                  textAlign: TextAlign.start,
                                  style: ktHeading2.copyWith(
                                    color: kcWhite,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: constants.sizedBoxHeight),
                            Rarity(rarity: rarity),
                            const SizedBox(height: constants.sizedBoxHeight),
                            Wrap(
                              spacing: 3.0,
                              children: <Widget>[
                                ...materials.map(
                                  (String material) {
                                    return FadeInImage(
                                      placeholder: MemoryImage(kTransparentImage),
                                      image: AssetImage(helper.getItemPath(material)),
                                      width: constants.characterMaterialImageWidth,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return Material(
                          color: kcTransparent,
                          child: InkWell(
                            onTap: () {
                              final CharacterDetailsArguments args = CharacterDetailsArguments(
                                id: id,
                                name: name,
                              );

                              ref.read(navigationController.notifier).navigate(context, routes.characterDetails, args);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
