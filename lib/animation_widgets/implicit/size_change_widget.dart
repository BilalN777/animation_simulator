import 'package:flutter/material.dart';

class SizeChangeWidget extends StatefulWidget {
  @override
  _SizeChangeWidgetState createState() => _SizeChangeWidgetState();
}

class _SizeChangeWidgetState extends State<SizeChangeWidget> {
  double _width = 100;
  double _height = 100;

  void _toggleSize() {
    setState(() {
      // Toggle between two sizes
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSize,
      child: AnimatedContainer(
        width: _width,
        height: _height,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          'Tap me!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
