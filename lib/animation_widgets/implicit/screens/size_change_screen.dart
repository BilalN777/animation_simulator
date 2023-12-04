import 'package:flutter/material.dart';
import '../size_change_widget.dart';

class SizeChangeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Change Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tap the box to change its size',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16), // Add some spacing
            SizeChangeWidget(),
          ],
        ),
      ),
    );
  }
}
