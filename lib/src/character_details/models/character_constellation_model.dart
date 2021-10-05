import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_constellation_model.freezed.dart';
part 'character_constellation_model.g.dart';

@freezed
class CharacterConstellationModel with _$CharacterConstellationModel {
  const factory CharacterConstellationModel({
    required String key,
    required String name,
    required String description,
  }) = _CharacterConstellationModel;

  factory CharacterConstellationModel.fromJson(Map<String, dynamic> json) => _$CharacterConstellationModelFromJson(json);
}
