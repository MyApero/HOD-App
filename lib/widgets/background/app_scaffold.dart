import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/app_background.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.title,
    this.hasBackArrow = false,
    this.hasProfileIcon = false,
    this.child,
  });

  final String? title;
  final bool hasBackArrow;
  final bool hasProfileIcon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(title:title, hasBackArrow: hasBackArrow, child: child),
    );
  }
}
