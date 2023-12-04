import 'package:flutter/material.dart';

class SpinningWheelWidget extends StatelessWidget {
  final Animation<double> animation;

  SpinningWheelWidget({required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: child,
        );
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          'Spinning',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
