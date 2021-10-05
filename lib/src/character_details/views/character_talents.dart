import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/extensions/iterable_extension.dart';
import 'package:little_teyvat/src/character_details/character_details_constants.dart' as constants;
import 'package:little_teyvat/src/character_details/controllers/character_talents_controller.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_state.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_talents_state.dart';
import 'package:little_teyvat/src/character_details/models/character_passive_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_model.dart';
import 'package:little_teyvat/src/character_details/views/character_materials_table.dart';
import 'package:little_teyvat/src/character_details/views/character_skill_card.dart';
import 'package:little_teyvat/src/character_details/views/character_talent_card.dart';
import 'package:little_teyvat/src/shared/views/error_view.dart';
import 'package:little_teyvat/src/shared/wrappers/fade_in_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const double _sizedBoxHeight = 10.0;
const double _dividerPadding = 10.0;

class CharacterTalents extends ConsumerWidget {
  final String characterKey;
  final CharacterState characterState;

  const CharacterTalents({
    Key? key,
    required this.characterKey,
    required this.characterState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CharacterTalentsState> characterTalentsState = ref.watch(characterTalentsController(characterState));

    return characterTalentsState.when(
      data: (CharacterTalentsState state) => FadeInWrapper(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  child: Text(
                    context.tr.talents,
                    style: const TextStyle(
                      fontSize: constants.titleFontSize,
                    ),
                  ),
                ),
                const SizedBox(height: _sizedBoxHeight),
                ...state.talents.mapIndex(
                  (CharacterTalentModel talent, int index) => Column(
                    children: <Widget>[
                      CharacterTalentCard(
                        characterKey: characterKey,
                        characterTalent: talent,
                        characterTalentStats: state.characterTalentStats[index],
                      ),
                      const SizedBox(height: _sizedBoxHeight),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: _dividerPadding),
                  child: Divider(
                    height: constants.dividerHeight,
                    thickness: constants.dividerThickness,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 15.0),
                  child: Text(
                    context.tr.talentMaterials,
                    style: const TextStyle(
                      fontSize: constants.titleFontSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CharacterMaterialsTable(
                    headerTitles: <String>[
                      context.tr.level,
                      context.tr.materials,
                    ].lock,
                    characterMaterials: state.characterTalentMaterials,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: _dividerPadding),
                  child: Divider(
                    height: constants.dividerHeight,
                    thickness: constants.dividerThickness,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                  child: Text(
                    context.tr.passives,
                    style: const TextStyle(
                      fontSize: constants.titleFontSize,
                    ),
                  ),
                ),
                ...state.passives.map(
                  (CharacterPassiveModel passive) => Column(
                    children: <Widget>[
                      CharacterSkillCard(
                        characterKey: characterKey,
                        skillKey: passive.key,
                        title: passive.name,
                        description: passive.description,
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
