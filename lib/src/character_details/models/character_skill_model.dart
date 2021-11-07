import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_skill_model.freezed.dart';
part 'character_skill_model.g.dart';

@freezed
class CharacterSkillModel with _$CharacterSkillModel {
  const factory CharacterSkillModel({
    required String id,
    required String name,
    required String description,
  }) = _CharacterSkillModel;

  factory CharacterSkillModel.fromJson(Map<String, dynamic> json) => _$CharacterSkillModelFromJson(json);
}