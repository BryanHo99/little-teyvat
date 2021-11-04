import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Adds a fade transition for the children of an [IndexedStack].
class FadeIndexedStackWrapper extends HookWidget {
  final List<Widget> children;
  final Duration duration;
  final int index;

  const FadeIndexedStackWrapper({
    Key? key,
    required this.index,
    required this.children,
    this.duration = const Duration(milliseconds: 400),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationController animationController = useAnimationController(duration: duration);

    // Hook that calls the fade transition every time the current index changes.
    useEffect(() {
      animationController.forward(from: 0.0);
    }, <int>[index]);

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animationController),
      child: IndexedStack(
        index: index,
        children: children,
      ),
    );
  }
}
