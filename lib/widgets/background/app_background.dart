import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/app_header.dart';
import 'package:hod_app/widgets/background/nice/nice_background.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
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
    return NiceBackground(
      hasBackArrow: hasBackArrow,
      hasProfileIcon: hasProfileIcon,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          AppHeader(title: title),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewPadding.bottom),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
