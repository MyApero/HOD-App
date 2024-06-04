import 'package:flutter/material.dart';

// import 'package:hod_app/widgets/background/nice/nice_clipper.dart';
import 'package:hod_app/widgets/background/nice/nice_clipper_animated.dart';
// import 'package:hod_app/widgets/background/nice/nice_clipper_gyroscope.dart';

class NiceBackground extends StatelessWidget {
  const NiceBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const NiceClipperAnimated(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: child,
        ),
      ],
    );
  }
}
