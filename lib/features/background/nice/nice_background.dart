import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hod_app/features/profile/screens/profile_screen.dart';

// import 'package:hod_app/widgets/background/nice/nice_clipper.dart';
import 'package:hod_app/features/background/nice/nice_clipper_animated.dart';
// import 'package:hod_app/widgets/background/nice/nice_clipper_gyroscope.dart';

class NiceBackground extends StatelessWidget {
  const NiceBackground(
      {super.key,
      this.hasBackArrow = false,
      this.hasProfileIcon = false,
      this.child});

  final bool hasBackArrow;
  final bool hasProfileIcon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const NiceClipperAnimated(),
        if (hasBackArrow)
          Positioned(
            left: 20,
            top: 10 + MediaQuery.of(context).viewPadding.top,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                  size: 35),
            ),
          ),
        if (hasProfileIcon)
          Positioned(
            right: 20,
            top: 10 + MediaQuery.of(context).viewPadding.top,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(ProfileScreen.route());
              },
              icon: const Icon(
                Icons.account_circle_rounded,
                size: 35,
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: child,
        ),
      ],
    );
  }
}
