import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:little_teyvat/src/characters/characters_constants.dart' as constants;
import 'package:little_teyvat/src/characters/models/colour_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeProvider<ColourController> colourController =
    Provider.autoDispose<ColourController>((ProviderRef<ColourController> ref) => ColourController._());

class ColourController {
  final IMap<String, ColourModel> colours = <String, ColourModel>{
    constants.anemo: ColourModel(
      foregroundColor: Colors.green.shade800,
      backgroundColor: Colors.green.shade900,
    ),
    constants.cryo: ColourModel(
      foregroundColor: Colors.blue.shade200,
      backgroundColor: Colors.blue.shade300,
    ),
    constants.dendro: ColourModel(
      foregroundColor: Colors.green,
      backgroundColor: Colors.green.shade800,
    ),
    constants.electro: ColourModel(
      foregroundColor: Colors.purple.shade800,
      backgroundColor: Colors.purple.shade900,
    ),
    constants.geo: ColourModel(
      foregroundColor: Colors.orange,
      backgroundColor: Colors.yellow.shade900,
    ),
    constants.hydro: ColourModel(
      foregroundColor: Colors.blueAccent,
      backgroundColor: Colors.blue.shade900,
    ),
    constants.pyro: ColourModel(
      foregroundColor: Colors.red,
      backgroundColor: Colors.red.shade900,
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
