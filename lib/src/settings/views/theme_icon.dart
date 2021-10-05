import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AnimatedIcon;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:little_teyvat/src/settings/controllers/theme_controller.dart';
import 'package:little_teyvat/src/settings/settings_constants.dart' as constants;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeIcon extends HookConsumerWidget {
  const ThemeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkModeEnabled = ref.watch(themeController).darkModeEnabled;

    final AnimationController animationController = useAnimationController(
      duration: const Duration(milliseconds: constants.themeIconTransitionDuration),
      initialValue: darkModeEnabled ? 1.0 : 0.0,
    );

    ref.watch(themeController.notifier).animate(animationController);
    
    return RotationTransition(
      turns: Tween<double>(begin: 0.0, end: 1.0).animate(animationController),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: constants.themeIconTransitionDuration),
        transitionBuilder: (Widget widget, Animation<double> animation) => ScaleTransition(
          scale: animation,
          child: widget,
        ),
        child: darkModeEnabled
            ? Icon(
                CupertinoIcons.moon_fill,
                key: Key(CupertinoIcons.moon_fill.toString()),
              )
            : Icon(
                Icons.light_mode,
                key: Key(Icons.light_mode.toString()),
              ),
      ),
    );
  }
}
