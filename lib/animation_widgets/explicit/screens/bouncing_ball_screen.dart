import 'package:flutter/material.dart';
import '../bouncing_ball_widget.dart'; // Import your BouncingBallWidget

class BouncingBallScreen extends StatefulWidget {
  @override
  _BouncingBallScreenState createState() => _BouncingBallScreenState();
}

class _BouncingBallScreenState extends State<BouncingBallScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
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
      _controller.repeat(
          reverse: _controller.status == AnimationStatus.reverse);
    }
  }

  void _reverseAnimation() {
    // Simply toggle the direction of the animation
    if (_controller.status == AnimationStatus.forward) {
      _controller.repeat(reverse: true);
    } else if (_controller.status == AnimationStatus.reverse) {
      _controller.repeat(reverse: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bouncing Ball Animation')),
      body: Center(
        child: BouncingBallWidget(animation: _controller),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _toggleAnimation,
            heroTag: 'playPauseButton',
            child: Icon(
              _controller.isAnimating ? Icons.pause : Icons.play_arrow,
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _reverseAnimation,
            heroTag: 'reverseButton',
            child: const Icon(Icons.sync),
          ),
        ],
      ),
    );
  }
}
