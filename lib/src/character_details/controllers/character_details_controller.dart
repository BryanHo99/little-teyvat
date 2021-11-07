import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/character_details/services/character_service.dart';

final AutoDisposeStateNotifierProviderFamily<CharacterDetailsController, AsyncValue<CharacterModel>, String>
    characterDetailsController = StateNotifierProvider.autoDispose.family(
  (
    AutoDisposeStateNotifierProviderRef<CharacterDetailsController, AsyncValue<CharacterModel>> ref,
    String id,
  ) =>
      CharacterDetailsController._(ref.read, id),
);

class CharacterDetailsController extends StateNotifier<AsyncValue<CharacterModel>> {
  final String id;
  final Reader read;

  CharacterDetailsController._(this.read, this.id) : super(const AsyncValue<CharacterModel>.loading()) {
    _initState();
  }

  /// Initializes the character's details.
  Future<void> _initState() async {
    state = const AsyncValue<CharacterModel>.loading();

    state = await AsyncValue.guard(() async {
      final IMap<String, dynamic> json = await read(characterService).getCharacter(id);
      return CharacterModel.fromJson(json.unlock);
    });
  }
}
