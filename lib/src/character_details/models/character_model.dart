import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/character_voice_model.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required String key,
    required String name,
    required String title,
    required String affiliation,
    required String region,
    required int rarity,
    required String substat,
    required String weaponType,
    required String element,
    required String birthday,
    required String constellation,
    required String description,
    required CharacterVoiceModel cv,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
}
