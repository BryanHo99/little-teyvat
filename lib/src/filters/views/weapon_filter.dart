import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/src/filters/controllers/abstracts/filter_weapon_controller.dart';
import 'package:little_teyvat/src/filters/controllers/states/weapon_filter_state.dart';
import 'package:little_teyvat/src/filters/models/weapon_filter_model.dart';
import 'package:little_teyvat/src/filters/views/filter_icon_button.dart';

class WeaponFilter extends ConsumerWidget {
  final AutoDisposeStateNotifierProvider<FilterWeaponController, WeaponFilterState> controller;

  const WeaponFilter({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WeaponFilterModel weaponFilter = ref.watch(controller).filter;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(context.tr.weaponType),
        const SizedBox(
          height: 5.0,
        ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          children: <Widget>[
            FilterIconButton(
              isSelected: weaponFilter.sword,
              imagePath: assets.swordImagePath,
              onPressed: () => ref.read(controller.notifier).toggleSword(),
              tooltip: context.tr.sword,
            ),
            FilterIconButton(
              isSelected: weaponFilter.claymore,
              imagePath: assets.claymoreImagePath,
              onPressed: () => ref.read(controller.notifier).toggleClaymore(),
              tooltip: context.tr.claymore,
            ),
            FilterIconButton(
              isSelected: weaponFilter.polearm,
              imagePath: assets.polearmImagePath,
              onPressed: () => ref.read(controller.notifier).togglePolearm(),
              tooltip: context.tr.polearm,
            ),
            FilterIconButton(
              isSelected: weaponFilter.catalyst,
              imagePath: assets.catalystImagePath,
              onPressed: () => ref.read(controller.notifier).toggleCatalyst(),
              tooltip: context.tr.catalyst,
            ),
            FilterIconButton(
              isSelected: weaponFilter.bow,
              imagePath: assets.bowImagePath,
              onPressed: () => ref.read(controller.notifier).toggleBow(),
              tooltip: context.tr.bow,
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
