import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/shared/scaffolds/default_scaffold.dart';
import 'package:little_teyvat/themes/themes.dart';

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
            style: ktHeading1,
          ),
        ),
      ),
    );
  }
}
