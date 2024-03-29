import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/filters/controllers/filter_sort_controller.dart';
import 'package:little_teyvat/src/filters/models/sort_dropdown_menu_item_model.dart';
import 'package:little_teyvat/themes/themes.dart';

class SortFilter extends StatelessWidget {
  final IList<SortDropdownMenuItemModel> dropdownMenuItems;

  const SortFilter({
    Key? key,
    required this.dropdownMenuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(context.tr.sortBy),
        const SizedBox(
          height: 5.0,
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final String selected = ref.watch(filterSortController).filter.selected;
            final bool isAscendingOrder = ref.watch(filterSortController).filter.isAscendingOrder;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selected,
                    items: <DropdownMenuItem<String>>[
                      ...dropdownMenuItems.map(
                        (SortDropdownMenuItemModel item) => DropdownMenuItem<String>(
                          value: item.value,
                          child: Text(
                            item.itemName,
                            style: ktSubheading,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (String? value) => ref.read(filterSortController.notifier).toggleSortType(value!),
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        isAscendingOrder ? context.tr.ascending : context.tr.descending,
                        style: ktSubheading,
                      ),
                      Switch.adaptive(
                        value: isAscendingOrder,
                        onChanged: (bool value) => ref.read(filterSortController.notifier).toggleSortOrder(value),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
