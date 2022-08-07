import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:little_teyvat/src/characters/characters_constants.dart' as constants;
import 'package:little_teyvat/src/characters/models/colour_model.dart';
import 'package:little_teyvat/themes/themes.dart';

final AutoDisposeProvider<ColourController> colourController = Provider.autoDispose<ColourController>((ProviderRef<ColourController> ref) => ColourController._());

class ColourController {
  final IMap<String, ColourModel> colours = <String, ColourModel>{
    constants.anemo: const ColourModel(
      foregroundColor: kcGreen800,
      backgroundColor: kcGreen900,
    ),
    constants.cryo: const ColourModel(
      foregroundColor: kcBlue200,
      backgroundColor: kcBlue300,
    ),
    constants.dendro: const ColourModel(
      foregroundColor: kcGreen,
      backgroundColor: kcGreen800,
    ),
    constants.electro: const ColourModel(
      foregroundColor: kcPurple800,
      backgroundColor: kcPurple900,
    ),
    constants.geo: const ColourModel(
      foregroundColor: kcGold,
      backgroundColor: kcGold900,
    ),
    constants.hydro: const ColourModel(
      foregroundColor: kcBlue700,
      backgroundColor: kcBlue900,
    ),
    constants.pyro: const ColourModel(
      foregroundColor: kcRed,
      backgroundColor: kcRed900,
    ),
  }.lock;

  ColourController._();

  Color getBackgroundColor(String key) {
    return colours[key]?.backgroundColor ?? colours.values.first.backgroundColor;
  }

  Color getForegroundColor(String key) {
    return colours[key]?.foregroundColor ?? colours.values.first.foregroundColor;
  }
}
