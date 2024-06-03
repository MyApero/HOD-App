import 'package:flutter/material.dart';
import 'package:hod_app/theme/palette.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
        // valueColor: AlwaysStoppedAnimation<Color>(
        // Palette.white,
        // ),
        );
  }
}