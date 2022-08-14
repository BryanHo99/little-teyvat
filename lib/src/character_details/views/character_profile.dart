import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/helpers/helpers.dart' as helper;
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/character_details/views/character_profile_ascension.dart';
import 'package:little_teyvat/src/character_details/views/character_profile_biography.dart';
import 'package:little_teyvat/src/character_details/views/character_profile_cv.dart';
import 'package:little_teyvat/src/character_details/views/character_profile_painter.dart';
import 'package:little_teyvat/src/shared/views/rarity.dart';
import 'package:little_teyvat/themes/themes.dart';
import 'package:transparent_image/transparent_image.dart';

const double _sizedBoxHeight = 5.0;
const double _painterHeight = 150.0;
const double _characterCardHeight = 140.0;

class CharacterProfile extends HookWidget {
  final CharacterModel character;

  const CharacterProfile({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double characterImageHeight = context.height / 2;
    final ValueNotifier<double> scrollOffset = useValueNotifier(0.0);
    final ValueNotifier<Offset> translateOffset = useValueNotifier(const Offset(0.0, 0.0));
    final ScrollController scrollController = useScrollController();

    scrollController.addListener(() {
      scrollOffset.value = -0.25 * scrollController.offset;
      translateOffset.value = Offset(0.0, scrollOffset.value);
    });

    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: scrollOffset,
          child: Container(
            decoration: BoxDecoration(
              color: kcWhite,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: <Color>[
                  kcGrey.withOpacity(0.0),
                  kcBlack54,
                ],
                stops: const <double>[0.0, 1.0],
              ),
            ),
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(helper.getCharacterImagePath(character.id)),
              height: characterImageHeight,
              width: context.width,
              fit: BoxFit.fitHeight,
            ),
          ),
          builder: (BuildContext context, Widget? child) {
            return Transform.translate(
              offset: translateOffset.value,
              child: child,
            );
          },
        ),
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: <Widget>[
              SizedBox(height: characterImageHeight / 1.5),
              Stack(
                children: <Widget>[
                  RepaintBoundary(
                    child: CustomPaint(
                      painter: CharacterProfilePainter(
                        color: context.theme.backgroundColor,
                      ),
                      willChange: false,
                      child: SizedBox(
                        width: context.width,
                        height: _painterHeight,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        height: _characterCardHeight,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: context.theme.backgroundColor,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: 0.55,
                                child: FadeInImage(
                                  placeholder: MemoryImage(kTransparentImage),
                                  image: AssetImage(helper.getRegionImagePath(character.region)),
                                ),
                              ),
                              FadeInImage(
                                placeholder: MemoryImage(kTransparentImage),
                                image: AssetImage(helper.getCharacterIconImagePath(character.id)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: kcTransparent),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            color: context.theme.backgroundColor.withOpacity(0.8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                character.name,
                                style: ktHeading1,
                              ),
                              const SizedBox(height: _sizedBoxHeight),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Rarity(rarity: character.rarity),
                                      const SizedBox(height: _sizedBoxHeight),
                                      FadeInImage(
                                        placeholder: MemoryImage(kTransparentImage),
                                        image: AssetImage(helper.getElementImagePath(character.element)),
                                        width: 25.0,
                                      ),
                                    ],
                                  ),
                                  FadeInImage(
                                    placeholder: MemoryImage(kTransparentImage),
                                    image: AssetImage(helper.getWeaponTypeImagePath(character.weaponType)),
                                    width: 40.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              RepaintBoundary(
                child: Container(
                  color: context.theme.backgroundColor,
                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CharacterProfileBiography(character: character),
                      CharacterProfileCv(character: character),
                      CharacterProfileAscension(character: character),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
