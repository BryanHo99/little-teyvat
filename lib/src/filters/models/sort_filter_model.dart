import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_filter_model.freezed.dart';

@freezed
class SortFilterModel with _$SortFilterModel {
  const factory SortFilterModel({
    required String selected,
    @Default(true) bool isAscendingOrder,
  }) = _SortFilterModel;
}
