import 'package:flutter/material.dart';

/// A widget that allows the child widget to overcome the horizontal padding of its parent.
///
/// Useful in cases such as a list of widgets in a column, and horizontal padding is needed on all
/// except the top widget.
///
/// Specify the [width] to take out the given amount of pixels for both left and right.
class ExpandWidth extends StatelessWidget {
  final double width;
  final Widget child;

  const ExpandWidth({
    Key? key,
    required this.child,
    this.width = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return IntrinsicHeight(
          child: OverflowBox(
            maxWidth: constraints.maxWidth + width * 2,
            child: child,
          ),
        );
      },
    );
  }
}
