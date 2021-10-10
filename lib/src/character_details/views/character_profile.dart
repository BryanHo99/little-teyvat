import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/helpers/asset_helper.dart';
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/character_details/views/character_profile_ascension.dart';
import 'package:little_teyvat/src/character_details/views/character_profile_biography.dart';
import 'package:little_teyvat/src/character_details/views/character_profile_cv.dart';
import 'package:little_teyvat/src/character_details/views/character_profile_painter.dart';
import 'package:little_teyvat/src/shared/widgets/rarity.dart';
import 'package:little_teyvat/src/shared/wrappers/fade_in_wrapper.dart';
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

    return FadeInWrapper(
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: scrollOffset,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: <Color>[
                    Colors.grey.withOpacity(0.0),
                    Colors.black54,
                  ],
                  stops: const <double>[0.0, 1.0],
                ),
              ),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(character.characterImage.imageUrl),
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
                        child: SizedBox(
                          width: context.width,
                          height: _painterHeight,
                        ),
                        painter: CharacterProfilePainter(
                          color: context.theme.backgroundColor,
                        ),
                        willChange: false,
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
                                    image: AssetImage(getRegionPath(character.region)),
                                  ),
                                ),
                                Image.network(character.cardImage.imageUrl),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                              color: context.theme.backgroundColor.withOpacity(0.8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  character.name,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                  ),
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
                                          image: AssetImage(getElementPath(character.element)),
                                          width: 25.0,
                                        ),
                                      ],
                                    ),
                                    FadeInImage(
                                      placeholder: MemoryImage(kTransparentImage),
                                      image: AssetImage(getWeaponTypePath(character.weaponType)),
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
      ),
    );
  }
}
