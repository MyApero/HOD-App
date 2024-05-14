import 'package:flutter/material.dart';
import 'dart:math';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            final waveHeight = size.height / 15;
            final y =
                200 + -x + size.height / 2 + sin(normalizedX) * waveHeight;

            return y;
          },
        ),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top + 50),
            const SizedBox(
              height: 100,
              width: 100,
              child: Image(
                image: AssetImage("assets/images/logo_1_heaven_of_dice.png"),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "cc",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: child,
            ),
          ],
        ),
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
