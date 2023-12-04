import 'package:flutter/material.dart';

class AnimationList extends StatelessWidget {
  final Function(String) onSelectAnimation;

  AnimationList({super.key, required this.onSelectAnimation});

  final List<String> animations = [
    'Bouncing Ball',
    'Spinning Wheel',
    'Rotating Square',
    'Color Change',
    'Position Change',
    'Size Change',
    // Add more animations here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animations.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(animations[index]), // Set the text
              onTap: () => onSelectAnimation(animations[index]),
            ),
            Container(
              width: double.infinity, // Set the width
              height: 1.0, // Set the height
              color: Colors.black, // Set the color of the separator
            ),
          ],
        );
      },
    );
  }
}
