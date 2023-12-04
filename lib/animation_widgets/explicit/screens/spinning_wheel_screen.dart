import 'package:flutter/material.dart';

import '../spinning_wheel_widget.dart';

class SpinningWheelScreen extends StatefulWidget {
  @override
  _SpinningWheelScreenState createState() => _SpinningWheelScreenState();
}

class _SpinningWheelScreenState extends State<SpinningWheelScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Define a Tween for continuous rotation
    _animation =
        Tween<double>(begin: 0.0, end: 2 * 3.14159).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    // Start the animation
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
    if (_controller.status == AnimationStatus.forward) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spinning Wheel Animation')),
      body: Center(
        child: SpinningWheelWidget(animation: _animation),
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
}
