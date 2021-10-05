import 'package:freezed_annotation/freezed_annotation.dart';

part 'rarity_filter_state.freezed.dart';

@freezed
class RarityFilterState with _$RarityFilterState {
  const factory RarityFilterState({
    @Default(0.0) double filter,
    @Default(0.0) double temp,
  }) = _RarityFilterState;
}
