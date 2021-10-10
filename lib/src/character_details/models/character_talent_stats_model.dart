import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/stats_model.dart';
import 'package:sprintf/sprintf.dart';

part 'character_talent_stats_model.freezed.dart';
part 'character_talent_stats_model.g.dart';

@freezed
class CharacterTalentStatsModel with _$CharacterTalentStatsModel implements StatsModel {
  const CharacterTalentStatsModel._();

  const factory CharacterTalentStatsModel({
    required String attribute,
    required String textFormat,
    required IList<IList<num>> stats,
  }) = _CharacterTalentStatsModel;

  factory CharacterTalentStatsModel.fromJson(Map<String, dynamic> json) => _$CharacterTalentStatsModelFromJson(json);

  @override
  IList<String> getStat() {
    final List<String> result = <String>[attribute];

    for (IList<num> stat in stats) {
      stat.isEmpty
          ? result.add('')
          : result.add(
              sprintf(
                textFormat,
                <String>[...stat.unlockView.map((num data) => data.toString())],
              ),
            );
    }

    return result.lock;
  }
}
