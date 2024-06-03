import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedNiceBackground extends StatefulWidget {
  const AnimatedNiceBackground({super.key, this.child});

  final Widget? child;

  @override
  State<AnimatedNiceBackground> createState() => _AnimatedNiceBackgroundState();
}

class _AnimatedNiceBackgroundState extends State<AnimatedNiceBackground>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  double value = 200;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // animation = Tween<double>(begin: 5, end: 30).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       value = animation.value;
    //     });
    //   });
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addListener(
        () {
          setState(() {
            value = animation.value * 20 + 10;
          });
        },
      );
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClippedPartsWidget(
          top: Container(
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
          bottom: Container(
            color: Theme.of(context).colorScheme.surface,
          ),
          splitFunction: (Size size, double x) {
            // normalizing x to make it exactly one wave
            final normalizedX = x / size.width * 2 * pi;
            final waveHeight = size.height / value; // value = 15 by default
            final y =
                200 + -x + size.height / 2 + sin(normalizedX) * waveHeight;

            return y;
          },
        ),
        Container(padding: const EdgeInsets.all(20), child: widget.child),
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