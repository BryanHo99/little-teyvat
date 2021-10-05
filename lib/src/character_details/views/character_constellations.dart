import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/character_details/character_details_constants.dart' as constants;
import 'package:little_teyvat/src/character_details/controllers/character_constellations_controller.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_constellations_state.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_state.dart';
import 'package:little_teyvat/src/character_details/models/character_constellation_model.dart';
import 'package:little_teyvat/src/character_details/views/character_skill_card.dart';
import 'package:little_teyvat/src/shared/views/error_view.dart';
import 'package:little_teyvat/src/shared/wrappers/fade_in_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double _sizedBoxHeight = 10.0;

class CharacterConstellations extends ConsumerWidget {
  final String characterKey;
  final CharacterState characterState;

  const CharacterConstellations({
    Key? key,
    required this.characterKey,
    required this.characterState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CharacterConstellationsState> characterConstellationsState = ref.watch(
      characterConstellationsController(characterState),
    );

    return characterConstellationsState.when(
      data: (CharacterConstellationsState state) => FadeInWrapper(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                  child: Text(
                    context.tr.constellations,
                    style: const TextStyle(
                      fontSize: constants.titleFontSize,
                    ),
                  ),
                ),
                ...state.constellations.map(
                  (CharacterConstellationModel constellation) => Column(
                    children: <Widget>[
                      CharacterSkillCard(
                        characterKey: characterKey,
                        skillKey: constellation.key,
                        title: constellation.name,
                        description: constellation.description,
                      ),
                      const SizedBox(height: _sizedBoxHeight),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      loading: () => const SizedBox(),
      error: (Object error, StackTrace? stack) => ErrorView(
        errorDescription: error.toString(),
        stackTrace: stack.toString(),
      ),
    );
  }
}
