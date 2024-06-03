import 'package:flutter/material.dart';
import 'package:hod_app/widgets/background/nice/nice_background_decoration.dart';

import 'package:sensors_plus/sensors_plus.dart';

class GyroNiceBackground extends StatelessWidget {
  const GyroNiceBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        StreamBuilder<Object>(
          stream: gyroscopeEventStream(samplingPeriod: const Duration(milliseconds: 10)),
          builder: (context, snapshots) {
            GyroscopeEvent? gyr = snapshots.data as GyroscopeEvent?;

            if (gyr == null) return const NiceBackgroundDecoration();
            double value = 15 + (gyr.x + gyr.y + gyr.z) * 2;
            if (value < 1) value = 1;
            return NiceBackgroundDecoration(value: value);
          }
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: child),
      ],
    );
  }
}

class ClippedPartsWidget extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final double Function(Size, double) splitFunction;

  const ClippedPartsWidget({
    super.key,
    required this.top,
    required this.bottom,
    required this.splitFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // I'm putting unmodified top widget to back. I wont cut it.
        // Instead I'll overlay it with clipped bottom widget.
        top,
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: FunctionClipper(splitFunction: splitFunction),
            child: bottom,
          ),
        ),
      ],
    );
  }
}

class FunctionClipper extends CustomClipper<Path> {
  final double Function(Size, double) splitFunction;

  FunctionClipper({required this.splitFunction});

  @override
  Path getClip(Size size) {
    final path = Path();

    // move to split line starting point
    path.moveTo(0, splitFunction(size, 0));

    // draw split line
    for (double x = 1; x <= size.width; x++) {
      path.lineTo(x, splitFunction(size, x));
    }

    // close bottom part of screen
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // I'm returning fixed 'true' value here for simplicity, it's not the part of actual question
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}
