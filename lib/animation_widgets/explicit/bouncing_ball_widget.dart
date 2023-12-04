import 'package:flutter/material.dart';

class BouncingBallWidget extends StatelessWidget {
  final Animation<double> animation;

  BouncingBallWidget({required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Container(
        width: 50.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, 300.0 * animation.value),
          child: child,
        );
      },
    );
  }
}
