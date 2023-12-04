import 'package:flutter/material.dart';
import 'dart:math' as math;

class RandomPositionWidget extends StatefulWidget {
  @override
  _RandomPositionWidgetState createState() => _RandomPositionWidgetState();
}

class _RandomPositionWidgetState extends State<RandomPositionWidget> {
  Alignment _alignment = Alignment.center;

  void _moveRandomPosition() {
    setState(() {
      // Generate random alignment values
      final random = math.Random();
      _alignment = Alignment(
        random.nextDouble() * 2 - 1, // Random value between -1 and 1
        random.nextDouble() * 2 - 1, // Random value between -1 and 1
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _moveRandomPosition,
      child: Container(
        width: 200.0, // Fixed width of the container
        height: 200.0, // Fixed height of the container
        color: Colors.grey[300],
        child: AnimatedAlign(
          alignment: _alignment,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: Container(
            width: 50.0,
            height: 50.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
