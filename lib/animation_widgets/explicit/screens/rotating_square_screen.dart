import 'package:flutter/material.dart';
import '../rotating_square_widget.dart';

class RotatingSquareScreen extends StatefulWidget {
  @override
  _RotatingSquareScreenState createState() => _RotatingSquareScreenState();
}

class _RotatingSquareScreenState extends State<RotatingSquareScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _tween = Tween<double>(begin: 0, end: 2 * 3.14159); // One full rotation

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
  }

  void _reverseAnimation() {
    // Toggle the direction of the tween
    if (_tween.begin == 0) {
      _tween = Tween<double>(begin: 2 * 3.14159, end: 0);
    } else {
      _tween = Tween<double>(begin: 0, end: 2 * 3.14159);
    }

    // Restart the controller with the new tween
    _controller
      ..reset()
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotating Square Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final angle = _tween.evaluate(_controller);
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateX(angle)
                ..rotateY(angle),
              alignment: FractionalOffset.center,
              child: _buildSquareFace(),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _toggleAnimation,
            child: Icon(
              _controller.isAnimating ? Icons.pause : Icons.play_arrow,
            ),
            heroTag: 'playPauseButton',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _reverseAnimation,
            child: Icon(Icons.sync),
            heroTag: 'reverseButton',
          ),
        ],
      ),
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
