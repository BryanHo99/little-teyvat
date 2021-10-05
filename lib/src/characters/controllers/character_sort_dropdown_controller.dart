import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/characters/characters_constants.dart' as constants;
import 'package:little_teyvat/src/filters/models/sort_dropdown_menu_item.dart';

final AutoDisposeProvider<CharacterSortDropdownController> characterSortDropdownController =
    Provider.autoDispose<CharacterSortDropdownController>(
  (AutoDisposeProviderRefBase ref) => const CharacterSortDropdownController._(),
);

class CharacterSortDropdownController {
  const CharacterSortDropdownController._();

  IList<SortDropdownMenuItem> initDropdownItems(BuildContext context) {
    return <SortDropdownMenuItem>[
      SortDropdownMenuItem(
        itemName: context.tr.name,
        value: constants.name,
      ),
      SortDropdownMenuItem(
        itemName: context.tr.element,
        value: constants.element,
      ),
      SortDropdownMenuItem(
        itemName: context.tr.rarity,
        value: constants.rarity,
      ),
    ].lock;
  }
}
