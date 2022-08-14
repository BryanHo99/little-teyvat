import 'package:flutter/material.dart' hide Element;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/filters/controllers/filter_rarity_controller.dart';
import 'package:little_teyvat/src/filters/controllers/states/rarity_filter_state.dart';
import 'package:little_teyvat/themes/themes.dart';

class RarityFilter extends StatelessWidget {
  final AutoDisposeStateNotifierProvider<FilterRarityController, RarityFilterState> controller;
  final double maxRating;
  final double minRating;

  const RarityFilter({
    Key? key,
    this.minRating = 0.0,
    this.maxRating = 5.0,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(context.tr.rarity),
        const SizedBox(
          height: 5.0,
        ),
        Align(
          alignment: Alignment.center,
          child: RepaintBoundary(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final double rarityFilter = ref.watch(controller).filter;

                return RatingBar.builder(
                  initialRating: rarityFilter,
                  minRating: minRating,
                  direction: Axis.horizontal,
                  glow: false,
                  itemCount: maxRating.toInt(),
                  itemBuilder: (BuildContext context, _) => const Icon(
                    Icons.star_rounded,
                    color: kcYellow600,
                  ),
                  onRatingUpdate: (double rating) => ref.read(controller.notifier).toggleRarity(rating),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
