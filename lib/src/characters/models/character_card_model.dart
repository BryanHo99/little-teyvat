import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/characters/models/character_card_material_model.dart';

part 'character_card_model.freezed.dart';
part 'character_card_model.g.dart';

@freezed
class CharacterCardModel with _$CharacterCardModel {
  const factory CharacterCardModel({
    required String key,
    required String name,
    required int rarity,
    required String element,
    required String weaponType,
    required List<CharacterCardMaterialModel> materials,
  }) = _CharacterCardModel;

  factory CharacterCardModel.fromJson(Map<String, dynamic> json) => _$CharacterCardModelFromJson(json);
}
