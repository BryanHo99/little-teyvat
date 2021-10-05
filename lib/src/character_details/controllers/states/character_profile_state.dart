import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/character_ascension_materials_model.dart';
import 'package:little_teyvat/src/character_details/models/character_ascension_stats_model.dart';
import 'package:little_teyvat/src/character_details/models/character_model.dart';

part 'character_profile_state.freezed.dart';

@freezed
class CharacterProfileState with _$CharacterProfileState{
  const factory CharacterProfileState({
    required CharacterModel character,
    required CharacterAscensionStatsModel characterAscensionStats,
    required CharacterAscensionMaterialsModel characterAscensionMaterials,
  }) = _CharacterProfileState;
}