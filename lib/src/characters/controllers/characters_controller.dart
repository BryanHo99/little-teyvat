import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/characters/models/character_card_model.dart';
import 'package:little_teyvat/src/characters/services/character_summaries_service.dart';

final AutoDisposeStateNotifierProvider<CharactersController, AsyncValue<IList<CharacterCardModel>>> charactersController =
    StateNotifierProvider.autoDispose<CharactersController, AsyncValue<IList<CharacterCardModel>>>(
  (ProviderRefBase ref) => CharactersController._(ref.read),
);

class CharactersController extends StateNotifier<AsyncValue<IList<CharacterCardModel>>> {
  final Reader read;

  CharactersController._(this.read) : super(const AsyncValue<IList<CharacterCardModel>>.loading()) {
    _initState();
  }

  /// Initializes the character list with all the characters.
  Future<void> _initState() async {
    state = const AsyncValue<IList<CharacterCardModel>>.loading();

    state = await AsyncValue.guard(() async {
      final IList<Map<String, dynamic>> charactersJson = (await read(characterSummariesService).getCharacterSummaries()).lock;
      return charactersJson.map((Map<String, dynamic> json) => CharacterCardModel.fromJson(json)).toIList();
    });
  }
}
