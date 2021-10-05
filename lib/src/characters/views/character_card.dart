import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:little_teyvat/routes/arguments/character_details_arguments.dart';
import 'package:little_teyvat/routes/route_constants.dart' as routes;
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/src/app_drawer/controllers/navigation_controller.dart';
import 'package:little_teyvat/src/characters/characters_constants.dart' as constants;
import 'package:little_teyvat/src/characters/controllers/colour_controller.dart';
import 'package:little_teyvat/src/characters/models/character_card_material_model.dart';
import 'package:little_teyvat/src/characters/views/character_card_painter.dart';
import 'package:little_teyvat/src/shared/widgets/rarity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterCard extends StatelessWidget {
  final String characterKey;
  final String characterName;
  final String elementKey;
  final int characterRarity;
  final List<CharacterCardMaterialModel> characterMaterials;

  const CharacterCard({
    Key? key,
    required this.characterKey,
    required this.characterName,
    required this.elementKey,
    required this.characterRarity,
    required this.characterMaterials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String characterCardImagePath = '${assets.characterCardImagesPath}/$characterKey.png';
    final String characterElementPath = '${assets.elementImagesPath}/$elementKey.png';

    return Container(
      constraints: const BoxConstraints(
        maxHeight: constants.characterCardHeight,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Card(
              color: ref.watch(colourController).getBackgroundColor(elementKey),
              clipBehavior: Clip.antiAlias,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: <Widget>[
                  CustomPaint(
                    child: Container(),
                    painter: CharacterCardPainter(
                      color: ref.watch(colourController).getForegroundColor(elementKey),
                    ),
                    willChange: false,
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: AssetImage(characterElementPath),
                      width: constants.elementImageWidth,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.0,
                        child: FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: AssetImage(characterCardImagePath),
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
                                  characterName,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.5,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: constants.sizedBoxHeight),
                            Rarity(rarity: characterRarity),
                            const SizedBox(height: constants.sizedBoxHeight),
                            Wrap(
                              spacing: 3.0,
                              children: <Widget>[
                                ...characterMaterials.map(
                                  (CharacterCardMaterialModel material) {
                                    final String materialImagePath =
                                        '${assets.itemImagesPath}/${material.type}/${material.key}.png';

                                    return FadeInImage(
                                      placeholder: MemoryImage(kTransparentImage),
                                      image: AssetImage(materialImagePath),
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
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              final CharacterDetailsArguments args = CharacterDetailsArguments(
                                characterKey: characterKey,
                                characterName: characterName,
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
