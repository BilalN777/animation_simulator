import 'package:flutter/material.dart';
import 'animation_widgets/explicit/screens/bouncing_ball_screen.dart';
import 'animation_widgets/explicit/screens/rotating_square_screen.dart';
import 'animation_widgets/explicit/screens/spinning_wheel_screen.dart';
import 'animation_widgets/implicit/screens/color_change_screen.dart';
import 'animation_widgets/implicit/screens/position_change_screen.dart';
import 'animation_widgets/implicit/screens/size_change_screen.dart';

class AnimationDisplay extends StatefulWidget {
  final String animationName;

  const AnimationDisplay({super.key, required this.animationName});

  @override
  _AnimationDisplayState createState() => _AnimationDisplayState();
}

class _AnimationDisplayState extends State<AnimationDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: getAnimationWidget(widget.animationName),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ],
    );
  }

  Widget getAnimationWidget(String animationName) {
    switch (animationName) {
      case 'Bouncing Ball':
        return BouncingBallScreen();
      case 'Spinning Wheel':
        return SpinningWheelScreen();
      case 'Rotating Square':
        return RotatingSquareScreen();
      case 'Color Change':
        return ColorChangeScreen();
      case 'Position Change':
        return RandomPositionScreen();
      case 'Size Change':
        return SizeChangeScreen();
      default:
        return const Center(child: Text('Select an animation'));
    }
  }
}
