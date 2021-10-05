import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/shared/scaffolds/default_scaffold.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: context.tr.home,
      body: Center(
        child: Center(
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: const AssetImage('assets/images/characters/ganyu.png'),
          ),
        ),
      ),
    );
  }
}
