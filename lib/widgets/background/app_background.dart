import 'package:flutter/material.dart';

import 'package:hod_app/widgets/background/nice_background.dart';
import 'package:hod_app/widgets/background/app_header.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, this.child, this.title});

  final Widget? child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return NiceBackground(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          AppHeader(title: title),
          Expanded(
            child: Container(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
