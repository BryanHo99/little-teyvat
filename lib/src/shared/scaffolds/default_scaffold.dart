import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';
import 'package:little_teyvat/src/app_drawer/app_drawer.dart';

/// Default scaffold to be used by all views in the app that do not require search functionalities.
class DefaultScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool absorbing;

  const DefaultScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.absorbing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        drawer: const AppDrawer(),
        drawerEdgeDragWidth: context.width,
        body: body,
      ),
    );
  }
}
