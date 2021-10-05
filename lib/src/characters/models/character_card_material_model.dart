import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_card_material_model.freezed.dart';
part 'character_card_material_model.g.dart';

@freezed
class CharacterCardMaterialModel with _$CharacterCardMaterialModel{
  const factory CharacterCardMaterialModel({
    required String key,
    required String type,
  }) = _CharacterCardMaterialModel;

  factory CharacterCardMaterialModel.fromJson(Map<String, dynamic> json) => _$CharacterCardMaterialModelFromJson(json);
}
