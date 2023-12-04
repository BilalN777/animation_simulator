import 'package:flutter/material.dart';

import '../position_change_widget.dart';

class RandomPositionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Position Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Click the box',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 16), // Add some spacing
          RandomPositionWidget(),
        ],
      ),
    );
  }
}
