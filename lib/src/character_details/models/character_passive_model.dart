import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_passive_model.freezed.dart';
part 'character_passive_model.g.dart';

@freezed
class CharacterPassiveModel with _$CharacterPassiveModel {
  const factory CharacterPassiveModel({
    required String key,
    required String name,
    required String description,
  }) = _CharacterPassiveModel;

  factory CharacterPassiveModel.fromJson(Map<String, dynamic> json) => _$CharacterPassiveModelFromJson(json);
}