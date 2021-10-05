import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/character_ascension_stat_model.dart';
import 'package:little_teyvat/src/character_details/models/stats_table_model.dart';

part 'character_ascension_stats_model.freezed.dart';
part 'character_ascension_stats_model.g.dart';

@freezed
class CharacterAscensionStatsModel with _$CharacterAscensionStatsModel implements StatsTableModel {
  const CharacterAscensionStatsModel._();

  const factory CharacterAscensionStatsModel({
    @JsonKey(name: 'ascensionStats') required IList<CharacterAscensionStatModel> stats,
  }) = _CharacterAscensionStatsModel;

  factory CharacterAscensionStatsModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterAscensionStatsModelFromJson(json);

  @override
  IList<IList<String>> getStats() {
    return stats.map((CharacterAscensionStatModel stat) => stat.getStat()).toIList();
  }
}
