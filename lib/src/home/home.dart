import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/shared/scaffolds/basic_scaffold.dart';
import 'package:little_teyvat/themes/themes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: context.tr.home,
      body: Center(
        child: Center(
          child: Text(
            context.tr.appName,
            style: ktHeading1,
          ),
        ),
      ),
    );
  }
}
