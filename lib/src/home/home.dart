import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/shared/scaffolds/default_scaffold.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: context.tr.home,
      body: const Center(
        child: Center(
          child: Text(
            'Little Teyvat',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
