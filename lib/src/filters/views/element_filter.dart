import 'package:flutter/material.dart' hide Element;
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/app_asset_paths.dart' as assets;
import 'package:little_teyvat/src/filters/controllers/element_filter_controller.dart';
import 'package:little_teyvat/src/filters/controllers/states/element_filter_state.dart';
import 'package:little_teyvat/src/filters/models/element_filter_model.dart';
import 'package:little_teyvat/src/filters/views/filter_icon_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ElementFilter extends ConsumerWidget {
  final AutoDisposeStateNotifierProvider<ElementFilterController, ElementFilterState> controller;

  const ElementFilter({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ElementFilterModel elementFilter = ref.watch(controller).filter;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(context.tr.element),
        const SizedBox(
          height: 5.0,
        ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          children: <Widget>[
            FilterIconButton(
              iconSize: 30.0,
              imagePath: assets.pyroImagePath,
              isSelected: elementFilter.pyro,
              onPressed: () => ref.read(controller.notifier).togglePyro(),
              tooltip: context.tr.pyro,
            ),
            FilterIconButton(
              iconSize: 30.0,
              imagePath: assets.hydroImagePath,
              isSelected: elementFilter.hydro,
              onPressed: () => ref.read(controller.notifier).toggleHydro(),
              tooltip: context.tr.hydro,
            ),
            FilterIconButton(
              iconSize: 30.0,
              imagePath: assets.electroImagePath,
              isSelected: elementFilter.electro,
              onPressed: () => ref.read(controller.notifier).toggleElectro(),
              tooltip: context.tr.electro,
            ),
            FilterIconButton(
              iconSize: 30.0,
              imagePath: assets.cryoImagePath,
              isSelected: elementFilter.cryo,
              onPressed: () => ref.read(controller.notifier).toggleCryo(),
              tooltip: context.tr.cryo,
            ),
            FilterIconButton(
              iconSize: 30.0,
              imagePath: assets.anemoImagePath,
              isSelected: elementFilter.anemo,
              onPressed: () => ref.read(controller.notifier).toggleAnemo(),
              tooltip: context.tr.anemo,
            ),
            FilterIconButton(
              iconSize: 30.0,
              imagePath: assets.geoImagePath,
              isSelected: elementFilter.geo,
              onPressed: () => ref.read(controller.notifier).toggleGeo(),
              tooltip: context.tr.geo,
            ),
            FilterIconButton(
              iconSize: 30.0,
              imagePath: assets.dendroImagePath,
              isSelected: elementFilter.dendro,
              onPressed: () => ref.read(controller.notifier).toggleDendro(),
              tooltip: context.tr.dendro,
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
