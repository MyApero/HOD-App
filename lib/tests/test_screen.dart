import 'package:flutter/material.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:hod_app/widgets/text_box.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Colors.red,
              child: TextBox(label: "coucou", isPassword: false)),
          SizedBox(
            width: 20,
            height: 20,
          ),
          Container(
              width: 200,
              color: Colors.blue,
              child: SimpleText(text: "bonsoir les amiiiiiis :")),
        ],
      ),
    );
  }
}
