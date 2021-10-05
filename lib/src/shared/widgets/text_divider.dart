import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String title;

  const TextDivider({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1.0,
            indent: 8.0,
            endIndent: 10.0,
          ),
        ),
      ],
    );
  }
}
