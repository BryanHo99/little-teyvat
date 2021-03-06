import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_details_arguments.freezed.dart';

@freezed
class CharacterDetailsArguments with _$CharacterDetailsArguments {
  const factory CharacterDetailsArguments({
    required String id,
    required String name,
  }) = _CharacterDetailsArguments;
}