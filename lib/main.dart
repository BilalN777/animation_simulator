import 'package:flutter/material.dart';
import 'animation_list.dart';
import 'animation_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.white70,
          fontFamily: 'NotoSans'),
      home: const AnimationSimulator(),
    );
  }
}

class AnimationSimulator extends StatefulWidget {
  const AnimationSimulator({super.key});

  @override
  _AnimationSimulatorState createState() => _AnimationSimulatorState();
}

class _AnimationSimulatorState extends State<AnimationSimulator> {
  String selectedAnimation = '';
  bool isAnimationSelected = false;

  void onSelectAnimation(String animation) {
    setState(() {
      selectedAnimation = animation;
      isAnimationSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Animation Simulator'),
        ),
        body: Row(
          children: <Widget>[
            Expanded(
              flex: isAnimationSelected ? 1 : 4,
              child: AnimationList(onSelectAnimation: onSelectAnimation),
            ),
            Container(
              width: 3.0, // Set the width of the separator
              color: Colors.black, // Set the color of the separator
            ),
            if (isAnimationSelected)
              Expanded(
                flex: 2,
                child: AnimationDisplay(animationName: selectedAnimation),
              ),
          ],
        ));
  }
}
