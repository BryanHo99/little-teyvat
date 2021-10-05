import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/character_passive_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_materials_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_model.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_stats_model.dart';

part 'character_talents_state.freezed.dart';

@freezed
class CharacterTalentsState with _$CharacterTalentsState {
  const factory CharacterTalentsState({
    required IList<CharacterTalentModel> talents,
    required IList<CharacterPassiveModel> passives,
    required IList<CharacterTalentStatsModel> characterTalentStats,
    required CharacterTalentMaterialsModel characterTalentMaterials,
  }) = _CharacterTalentsState;
}
