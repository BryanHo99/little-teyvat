import 'package:flutter/material.dart';

/// A star generator for character/weapon rarities.
class Rarity extends StatelessWidget {
  final int rarity;

  const Rarity({
    Key? key,
    required this.rarity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ..._generateRarity(rarity),
      ],
    );
  }

  List<Icon> _generateRarity(int value) {
    const double iconSize = 22.0;

    return List<Icon>.unmodifiable(() sync* {
      for (int i = 0; i < value; i++) {
        yield Icon(
          Icons.star_rounded,
          color: Colors.yellow.shade600,
          size: iconSize,
        );
      }
    }());
  }
}
