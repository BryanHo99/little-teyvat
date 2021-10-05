import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_voice_model.freezed.dart';
part 'character_voice_model.g.dart';

@freezed
class CharacterVoiceModel with _$CharacterVoiceModel {
  const factory CharacterVoiceModel({
    required String english,
    required String chinese,
    required String japanese,
    required String korean,
  }) = _CharacterVoiceModel;

  factory CharacterVoiceModel.fromJson(Map<String, dynamic> json) => _$CharacterVoiceModelFromJson(json);
}
