import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/characters/models/character_card_model.dart';
import 'package:little_teyvat/src/characters/services/characters_service.dart';

final AutoDisposeFutureProvider<IList<CharacterCardModel>> charactersController = FutureProvider.autoDispose((
  AutoDisposeFutureProviderRef<IList<CharacterCardModel>> ref,
) async {
  final IList<Map<String, dynamic>> charactersJson = (await ref.read(charactersService).getCharacters());
  return charactersJson.map((Map<String, dynamic> json) => CharacterCardModel.fromJson(json)).toIList();
});
