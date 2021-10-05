import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_state.freezed.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState({
    required IMap<String, dynamic> characterJson,
    required IMap<String, dynamic> statsJson,
  }) = _CharacterState;
}
