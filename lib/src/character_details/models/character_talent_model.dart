import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_stats_model.dart';

part 'character_talent_model.freezed.dart';
part 'character_talent_model.g.dart';

@freezed
class CharacterTalentModel with _$CharacterTalentModel {
  const factory CharacterTalentModel({
    required String id,
    required String name,
    required String description,
    required IList<CharacterTalentStatsModel> stats,
  }) = _CharacterTalentModel;

  factory CharacterTalentModel.fromJson(Map<String, dynamic> json) => _$CharacterTalentModelFromJson(json);
}
