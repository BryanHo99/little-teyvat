import 'package:flutter/material.dart';

/// A [Hero] widget wrapped over a transparent [Material] child to fix glitches found when animating texts.
class HeroWidget extends StatelessWidget {
  final String tag;
  final Widget child;

  const HeroWidget({
    Key? key,
    required this.tag,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
