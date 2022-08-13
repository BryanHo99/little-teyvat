import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/characters/characters_constants.dart' as constants;
import 'package:little_teyvat/src/filters/models/sort_dropdown_menu_item_model.dart';

final AutoDisposeProvider<FilterCharactersSortDropdownController> filterCharactersSortDropdownController = Provider.autoDispose<FilterCharactersSortDropdownController>(
    (AutoDisposeProviderRef<FilterCharactersSortDropdownController> ref) => const FilterCharactersSortDropdownController._());

class FilterCharactersSortDropdownController {
  const FilterCharactersSortDropdownController._();

  IList<SortDropdownMenuItemModel> initDropdownItems(BuildContext context) {
    return <SortDropdownMenuItemModel>[
      SortDropdownMenuItemModel(
        itemName: context.tr.name,
        value: constants.name,
      ),
      SortDropdownMenuItemModel(
        itemName: context.tr.element,
        value: constants.element,
      ),
      SortDropdownMenuItemModel(
        itemName: context.tr.rarity,
        value: constants.rarity,
      ),
    ].lock;
  }
}
