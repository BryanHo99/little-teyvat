import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_dropdown_menu_item.freezed.dart';

@freezed
class SortDropdownMenuItem with _$SortDropdownMenuItem {
  const factory SortDropdownMenuItem({
    required String itemName,
    required String value,
  }) = _SortDropdownMenuItem;
}
