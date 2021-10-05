import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_dropdown_menu_item_model.freezed.dart';

@freezed
class SortDropdownMenuItemModel with _$SortDropdownMenuItemModel {
  const factory SortDropdownMenuItemModel({
    required String itemName,
    required String value,
  }) = _SortDropdownMenuItemModel;
}
