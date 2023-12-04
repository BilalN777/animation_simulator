import 'package:flutter/material.dart';

class RotatingSquareWidget extends StatelessWidget {
  final AnimationController controller;

  RotatingSquareWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Center(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..scale(1.0)
              ..rotateX(3.14 * controller.value)
              ..rotateY(3.14 * controller.value),
            alignment: FractionalOffset.center,
            child: _buildSquareFace(),
          ),
        );
      },
    );
  }

  Widget _buildSquareFace() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          'Square',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
