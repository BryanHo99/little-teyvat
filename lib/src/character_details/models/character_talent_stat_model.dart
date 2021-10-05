import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/stat_row_model.dart';
import 'package:sprintf/sprintf.dart';

part 'character_talent_stat_model.freezed.dart';
part 'character_talent_stat_model.g.dart';

@freezed
class CharacterTalentStatModel with _$CharacterTalentStatModel implements StatRowModel {
  const CharacterTalentStatModel._();

  const factory CharacterTalentStatModel({
    required String attribute,
    required String format,
    required IList<IList<num>> stats,
  }) = _CharacterTalentStatModel;

  factory CharacterTalentStatModel.fromJson(Map<String, dynamic> json) => _$CharacterTalentStatModelFromJson(json);

  @override
  IList<String> getStat() {
    final List<String> result = <String>[attribute];

    for (IList<num> stat in stats) {
      stat.isEmpty ? result.add('') : result.add(sprintf(format, stat.unlockView));
    }

    return result.lock;
  }
}
