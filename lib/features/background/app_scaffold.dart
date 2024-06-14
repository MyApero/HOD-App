import 'package:flutter/material.dart';
import 'package:hod_app/features/background/app_background.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.title,
    this.header = true,
    this.hasBackArrow = false,
    this.hasProfileIcon = false,
    this.child,
  });

  final String? title;
  final bool hasBackArrow;
  final bool hasProfileIcon;
  final bool header;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(title:title, header: header, hasBackArrow: hasBackArrow, child: child),
    );
  }
}
