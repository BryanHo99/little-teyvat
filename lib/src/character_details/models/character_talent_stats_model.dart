import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/character_talent_stat_model.dart';
import 'package:little_teyvat/src/character_details/models/stats_table_model.dart';

part 'character_talent_stats_model.freezed.dart';
part 'character_talent_stats_model.g.dart';

@freezed
class CharacterTalentStatsModel with _$CharacterTalentStatsModel implements StatsTableModel {
  const CharacterTalentStatsModel._();

  const factory CharacterTalentStatsModel({
    required IList<CharacterTalentStatModel> stats,
  }) = _CharacterTalentStatsModel;

  factory CharacterTalentStatsModel.fromJson(Map<String, dynamic> json) => _$CharacterTalentStatsModelFromJson(json);

  @override
  IList<IList<String>> getStats() {
    return stats.map((CharacterTalentStatModel stat) => stat.getStat()).toIList();
  }
}