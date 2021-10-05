import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_talent_model.freezed.dart';
part 'character_talent_model.g.dart';

@freezed
class CharacterTalentModel with _$CharacterTalentModel {
  const factory CharacterTalentModel({
    required String key,
    required String name,
    required IList<String> description,
  }) = _CharacterTalentModel;

  factory CharacterTalentModel.fromJson(Map<String, dynamic> json) => _$CharacterTalentModelFromJson(json);
}
