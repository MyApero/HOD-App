import 'package:flutter/material.dart';

import 'dart:math';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, this.child, required this.title});

  final Widget? child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top + 50),
                Container(
                  height: 100,
                  width: 100,
                  child: const Image(
                    image: AssetImage("assets/images/logo_1_heaven_of_dice.png"),
                    fit: BoxFit.cover,
                  )
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'MulishSemiBold'
                    )
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewPadding.top + 50),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const TextField(
              decoration: InputDecoration(
                labelText: 'Email', // Placeholder text
                border: OutlineInputBorder(), // Border style
              ),
            ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const TextField(
              decoration: InputDecoration(
                labelText: 'Mot de passe', // Placeholder text
                border: OutlineInputBorder(), // Border style
              ),
            ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: FilledButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(100, 20, 100, 20))
                      // backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.background),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Me connecter",
                      style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'MulishSemiBold',
                      color: Theme.of(context).colorScheme.surface,
                    )
                    ),
                  )
                ),
                const Text(
                      "J'ai oublié mon mot de passe",
                      style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'MulishSemiBold',
                      color: Color(0xFFAEAED7),
                    )
                  ),
                const Text(
                      "M'inscrire",
                      style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'MulishSemiBold',
                      color: Color(0xFFAEAED7),
                    )
                  ),
              ],
            ),
          ),
        ],
      ),
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
