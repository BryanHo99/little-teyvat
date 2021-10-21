import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/strapi/models/strapi_image_model.dart';

part 'character_card_model.freezed.dart';
part 'character_card_model.g.dart';

@freezed
class CharacterCardModel with _$CharacterCardModel {
  const factory CharacterCardModel({
    required String id,
    required String name,
    required int rarity,
    required String element,
    required String weaponType,
    required StrapiImageModel cardImage,
    @JsonKey(name: 'materialsSummary') required IList<StrapiImageModel> materials,
  }) = _CharacterCardModel;

  factory CharacterCardModel.fromJson(Map<String, dynamic> json) => _$CharacterCardModelFromJson(json);
}
