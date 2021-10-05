import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/extensions/iterable_extension.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_state.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_talents_state.dart';
import 'package:little_teyvat/src/character_details/models/character_passive_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_materials_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_stat_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_stats_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeStateNotifierProviderFamily<CharacterTalentsController, AsyncValue<CharacterTalentsState>, CharacterState>
    characterTalentsController =
    StateNotifierProvider.autoDispose.family<CharacterTalentsController, AsyncValue<CharacterTalentsState>, CharacterState>(
  (AutoDisposeProviderRefBase ref, CharacterState characterState) => CharacterTalentsController._(characterState),
);

class CharacterTalentsController extends StateNotifier<AsyncValue<CharacterTalentsState>> {
  final CharacterState characterState;

  CharacterTalentsController._(this.characterState) : super(const AsyncValue<CharacterTalentsState>.loading()) {
    _initState();
  }

  CharacterTalentMaterialsModel get _characterTalentMaterials {
    return CharacterTalentMaterialsModel.fromJson(characterState.statsJson.unlockView);
  }

  IList<CharacterTalentStatsModel> get _characterTalentStats {
    return IList<CharacterTalentStatsModel>(
      (characterState.statsJson['talentStats'] as List<dynamic>).lock.mapIndex(
        (dynamic talentStat, int i) {
          return CharacterTalentStatsModel(
            stats: (talentStat as List<dynamic>).mapIndex(
              (dynamic talent, int j) {
                final IMap<String, dynamic> json = <String, dynamic>{
                  ...(talent as Map<String, dynamic>),
                  ...(characterState.characterJson['talentFormats'][i][j] as Map<String, dynamic>),
                }.lock;
                return CharacterTalentStatModel.fromJson(json.unlockView);
              },
            ).toIList(),
          );
        },
      ),
    );
  }

  IList<CharacterPassiveModel> get _passives {
    return (characterState.characterJson['passives'] as List<dynamic>)
        .map((dynamic json) => CharacterPassiveModel.fromJson(json as Map<String, dynamic>))
        .toIList();
  }

  IList<CharacterTalentModel> get _talents {
    return (characterState.characterJson['talents'] as List<dynamic>)
        .map((dynamic json) => CharacterTalentModel.fromJson(json as Map<String, dynamic>))
        .toIList();
  }

  Future<void> _initState() async {
    state = const AsyncValue<CharacterTalentsState>.loading();

    state = await AsyncValue.guard(() async {
      return CharacterTalentsState(
        talents: _talents,
        passives: _passives,
        characterTalentStats: _characterTalentStats,
        characterTalentMaterials: _characterTalentMaterials,
      );
    });
  }
}
