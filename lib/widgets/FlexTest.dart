import 'package:flutter/material.dart';

class FlexTest extends StatelessWidget {
  const FlexTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              // height: 100,
              color: Colors.red,
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ]
      ),
    );
  }
}
