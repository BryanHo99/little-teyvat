import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/character_ascension_stats_model.dart';
import 'package:little_teyvat/src/character_details/models/character_skill_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_model.dart';
import 'package:little_teyvat/src/character_details/models/character_voice_model.dart';
import 'package:little_teyvat/src/character_details/models/materials_model.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required String id,
    required String name,
    required String title,
    required String affiliation,
    required String region,
    required int rarity,
    required String weaponType,
    required String substat,
    required String element,
    required String birthday,
    required String constellation,
    required String description,
    required CharacterVoiceModel cv,
    required IList<CharacterAscensionStatsModel> ascensionStats,
    required IList<MaterialsModel> ascensionMaterials,
    required IList<CharacterTalentModel> talents,
    required IList<MaterialsModel> talentMaterials,
    required IList<CharacterSkillModel> passives,
    required IList<CharacterSkillModel> constellations,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
}
