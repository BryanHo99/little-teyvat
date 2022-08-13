import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/characters/models/character_card_model.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_element_controller.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_rarity_controller.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_sort_controller.dart';
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_weapon_controller.dart';
import 'package:little_teyvat/src/filters/controllers/filter_characters_controller.dart';
import 'package:little_teyvat/src/filters/controllers/filter_characters_sort_dropdown_controller.dart';
import 'package:little_teyvat/src/filters/filter_bottom_sheet.dart';
import 'package:little_teyvat/src/filters/models/sort_dropdown_menu_item_model.dart';
import 'package:little_teyvat/src/filters/views/element_filter.dart';
import 'package:little_teyvat/src/filters/views/rarity_filter.dart';
import 'package:little_teyvat/src/filters/views/sort_filter.dart';
import 'package:little_teyvat/src/filters/views/weapon_filter.dart';

class CharacterFilterBottomSheet extends ConsumerWidget {
  final IList<CharacterCardModel> characters;

  const CharacterFilterBottomSheet({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FilterCharactersController filterController = ref.watch(filterCharactersController(characters).notifier);
    final IList<SortDropdownMenuItemModel> dropdownMenuItems = ref.watch(filterCharactersSortDropdownController).initDropdownItems(context);

    return FilterBottomSheet(
      controllers: <AutoDisposeStateNotifierProvider<FilterController<Object>, Object>>[
        filterRarityController,
        filterElementController,
        filterWeaponController,
        filterSortController,
      ].lock,
      onSubmit: () => filterController.onSubmit(),
      children: <Widget>[
        RarityFilter(controller: filterRarityController),
        ElementFilter(controller: filterElementController),
        WeaponFilter(controller: filterWeaponController),
        SortFilter(
          dropdownMenuItems: dropdownMenuItems,
          controller: filterSortController,
        ),
      ],
    );
  }
}
