import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/stats_model.dart';

part 'character_ascension_stats_model.freezed.dart';
part 'character_ascension_stats_model.g.dart';

@freezed
class CharacterAscensionStatsModel with _$CharacterAscensionStatsModel implements StatsModel {
  const CharacterAscensionStatsModel._();

  const factory CharacterAscensionStatsModel({
    required int level,
    required int baseAtk,
    required int baseDef,
    required int baseHp,
    required num bonus,
    required bool isAscension,
  }) = _CharacterAscensionStatModel;

  factory CharacterAscensionStatsModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterAscensionStatsModelFromJson(json);

  @override
  IList<String> getStat() {
    // If it is an ascension, the level will have a '+'.
    // All bonus stats have '%' behind them.
    return isAscension
        ? <String>['$level+', '$baseHp', '$baseAtk', '$baseDef', '$bonus%'].lock
        : <String>['$level', '$baseHp', '$baseAtk', '$baseDef', '$bonus%'].lock;
  }
}
