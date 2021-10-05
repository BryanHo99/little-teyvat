import 'package:flutter/material.dart';

class FilterIconButton extends StatelessWidget {
  final double iconSize;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onPressed;
  final String tooltip;

  const FilterIconButton({
    Key? key,
    this.iconSize = 40.0,
    required this.imagePath,
    required this.isSelected,
    required this.onPressed,
    required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Opacity(
        opacity: isSelected ? 1.0 : 0.2,
        child: Image.asset(imagePath),
      ),
      iconSize: iconSize,
      splashRadius: 20.0,
      tooltip: tooltip,
    );
  }
}
