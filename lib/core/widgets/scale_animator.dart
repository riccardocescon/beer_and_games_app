import 'package:flutter/material.dart';

class ScaleAnimator extends StatefulWidget {
  const ScaleAnimator({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.delay = const Duration(milliseconds: 100),
  });

  final Widget child;
  final Duration duration;
  final Duration delay;

  @override
  State<ScaleAnimator> createState() => _ScaleAnimatorState();
}

class _ScaleAnimatorState extends State<ScaleAnimator> {
  bool _animate = false;

  @override
  void initState() {
    Future.delayed(widget.delay, () {
      setState(() {
        _animate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: _animate ? widget.child : null,
    );
  }
}
