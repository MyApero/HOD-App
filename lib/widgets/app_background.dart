import 'package:flutter/material.dart';

import 'package:hod_app/widgets/nice_background.dart';
import 'package:hod_app/widgets/app_header.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, this.child, this.title});

  final Widget? child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return NiceBackground(header: AppHeader(title: title), child: child);
  }
}
