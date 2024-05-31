import 'package:flutter/material.dart';
import 'package:hod_app/widgets/text_box.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextBox(label: "coucou", isPassword: false)
      ],
      ),
    );
  }
}