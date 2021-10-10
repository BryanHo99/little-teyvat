import 'package:flutter/material.dart';
import 'package:little_teyvat/extensions/build_context_extension.dart';

/// A simple loading screen to be displayed when asynchronous operations are conducted.
class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.backgroundColor,
      child: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(
            context.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
