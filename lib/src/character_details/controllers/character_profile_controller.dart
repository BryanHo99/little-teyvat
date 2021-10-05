import 'package:little_teyvat/src/character_details/controllers/states/character_profile_state.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_state.dart';
import 'package:little_teyvat/src/character_details/models/character_ascension_materials_model.dart';
import 'package:little_teyvat/src/character_details/models/character_ascension_stats_model.dart';
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeStateNotifierProviderFamily<CharacterProfileController, AsyncValue<CharacterProfileState>, CharacterState>
    characterProfileController =
    StateNotifierProvider.autoDispose.family<CharacterProfileController, AsyncValue<CharacterProfileState>, CharacterState>(
  (AutoDisposeProviderRefBase ref, CharacterState characterState) => CharacterProfileController._(characterState),
);

class CharacterProfileController extends StateNotifier<AsyncValue<CharacterProfileState>> {
  final CharacterState characterState;

  CharacterProfileController._(this.characterState) : super(const AsyncValue<CharacterProfileState>.loading()) {
    _initState();
  }

  CharacterModel get _character {
    return CharacterModel.fromJson(characterState.characterJson.unlockView);
  }

  CharacterAscensionMaterialsModel get _characterAscensionMaterials {
    return CharacterAscensionMaterialsModel.fromJson(characterState.statsJson.unlockView);
  }

  CharacterAscensionStatsModel get _characterAscensionStats {
    return CharacterAscensionStatsModel.fromJson(characterState.statsJson.unlockView);
  }

  Future<void> _initState() async {
    state = const AsyncValue<CharacterProfileState>.loading();

    state = await AsyncValue.guard(() async {
      return CharacterProfileState(
        character: _character,
        characterAscensionStats: _characterAscensionStats,
        characterAscensionMaterials: _characterAscensionMaterials,
      );
    });
  }
}
