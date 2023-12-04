import 'package:flutter/material.dart';
import '../color_change_widget.dart';

class ColorChangeScreen extends StatelessWidget {
  const ColorChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Change Animation'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tap the box to change its color',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16), // Add some spacing
            ColorChangeWidget(),
          ],
        ),
      ),
    );
  }
}
