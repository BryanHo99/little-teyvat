import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:little_teyvat/src/character_details/controllers/states/character_state.dart';
import 'package:little_teyvat/src/character_details/services/character_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeStateNotifierProviderFamily<CharacterDetailsController, AsyncValue<CharacterState>, String>
    characterDetailsController = StateNotifierProvider.autoDispose.family(
  (AutoDisposeProviderRefBase ref, String characterKey) => CharacterDetailsController._(ref.read, characterKey),
);

class CharacterDetailsController extends StateNotifier<AsyncValue<CharacterState>> {
  final String characterKey;
  final Reader read;

  CharacterDetailsController._(this.read, this.characterKey) : super(const AsyncValue<CharacterState>.loading()) {
    _initState();
  }

  /// Initializes the character's details.
  Future<void> _initState() async {
    state = const AsyncValue<CharacterState>.loading();

    state = await AsyncValue.guard(() async {
      final IMap<String, dynamic> characterJson = await read(characterService).getCharacterInfo(characterKey);
      final IMap<String, dynamic> statsJson = await read(characterService).getCharacterStats(characterKey);

      return CharacterState(
        characterJson: characterJson,
        statsJson: statsJson,
      );
    });
  }
}
