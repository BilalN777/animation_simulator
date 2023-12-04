import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangeWidget extends StatefulWidget {
  const ColorChangeWidget({super.key});

  @override
  _ColorChangeWidgetState createState() => _ColorChangeWidgetState();
}

class _ColorChangeWidgetState extends State<ColorChangeWidget> {
  // Initialize with a default color
  Color _currentColor = Colors.blue;

  // List of rainbow colors
  final List<Color> _rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
  ];

  void _changeColor() {
    setState(() {
      // Randomly select a color from the rainbow colors list
      _currentColor = _rainbowColors[Random().nextInt(_rainbowColors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _currentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
