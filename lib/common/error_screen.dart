import 'package:flutter/material.dart';
import 'package:hod_app/widgets/simple_text.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SimpleText("An error occurred"),
            const Text(
              "An error occurred",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SimpleText(errorMessage ?? "Please try again later"),
          ],
        ),
      ),
    );
  }
}
