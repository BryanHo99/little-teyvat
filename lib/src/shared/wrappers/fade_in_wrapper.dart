import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Adds a fade in transition to its child widget.
class FadeInWrapper extends HookWidget {
  final Duration duration;
  final Widget child;

  const FadeInWrapper({
    Key? key,
    this.duration = const Duration(milliseconds: 280),
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationController animationController = useAnimationController(duration: duration)..forward();

    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animationController),
      child: child,
    );
  }
}
