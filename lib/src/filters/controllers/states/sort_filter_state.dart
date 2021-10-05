import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_teyvat/src/filters/models/sort_filter_model.dart';

part 'sort_filter_state.freezed.dart';

@freezed
class SortFilterState with _$SortFilterState {
  const factory SortFilterState({
    required SortFilterModel filter,
    required SortFilterModel temp,
  }) = _SortFilterState;
}
