import 'package:flutter/material.dart';

// import 'package:hod_app/widgets/background/nice/nice_clipper.dart';
import 'package:hod_app/widgets/background/nice/nice_clipper_animated.dart';
// import 'package:hod_app/widgets/background/nice/nice_clipper_gyroscope.dart';

class NiceBackground extends StatelessWidget {
  const NiceBackground({super.key, this.hasBackArrow = false, this.child});

  final bool hasBackArrow;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const NiceClipperAnimated(),
        if (hasBackArrow)
          Positioned(
            left: 10,
            top: MediaQuery.of(context).viewPadding.top,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: child,
        ),
      ],
    );
  }
}
