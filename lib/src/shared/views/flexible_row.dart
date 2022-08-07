import 'package:flutter/material.dart';

class FlexibleRow extends StatelessWidget {
  final String title;
  final String description;

  const FlexibleRow({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(child: Text(title)),
        Flexible(
          child: Text(
            description,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
