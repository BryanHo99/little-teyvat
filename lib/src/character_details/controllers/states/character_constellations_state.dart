import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/character_constellation_model.dart';

part 'character_constellations_state.freezed.dart';

@freezed
class CharacterConstellationsState with _$CharacterConstellationsState{
  const factory CharacterConstellationsState({
    required IList<CharacterConstellationModel> constellations,
  }) = _CharacterConstellationsState;
}