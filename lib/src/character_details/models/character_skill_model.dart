import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/strapi/models/strapi_image_model.dart';

part 'character_skill_model.freezed.dart';
part 'character_skill_model.g.dart';

@freezed
class CharacterSkillModel with _$CharacterSkillModel {
  const factory CharacterSkillModel({
    required String name,
    required String description,
    required StrapiImageModel image,
  }) = _CharacterSkillModel;

  factory CharacterSkillModel.fromJson(Map<String, dynamic> json) => _$CharacterSkillModelFromJson(json);
}