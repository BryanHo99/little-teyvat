import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/character_details/models/character_model.dart';
import 'package:little_teyvat/src/character_details/services/character_service.dart';

final AutoDisposeFutureProviderFamily<CharacterModel, String> characterDetailsController = FutureProvider.autoDispose.family((
  AutoDisposeFutureProviderRef<CharacterModel> ref,
  String id,
) async {
  final IMap<String, dynamic> json = await ref.read(characterService).getCharacter(id);
  return CharacterModel.fromJson(json.unlock);
});
