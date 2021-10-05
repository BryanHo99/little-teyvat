import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/character_details/models/stat_row_model.dart';

part 'character_ascension_stat_model.freezed.dart';
part 'character_ascension_stat_model.g.dart';

@freezed
class CharacterAscensionStatModel with _$CharacterAscensionStatModel implements StatRowModel {
  const CharacterAscensionStatModel._();

  const factory CharacterAscensionStatModel({
    required int level,
    required int baseAtk,
    required int baseDef,
    required int baseHp,
    required num bonus,
    required bool isAscension,
  }) = _CharacterAscensionStatModel;

  factory CharacterAscensionStatModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterAscensionStatModelFromJson(json);

  @override
  IList<String> getStat() {
    // If it is an ascension, the level will have a '+'.
    // All bonus stats have '%' behind them.
    return isAscension
        ? <String>['$level+', '$baseHp', '$baseAtk', '$baseDef', '$bonus%'].lock
        : <String>['$level', '$baseHp', '$baseAtk', '$baseDef', '$bonus%'].lock;
  }
}
