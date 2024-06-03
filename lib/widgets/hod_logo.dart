import 'package:flutter/material.dart';
import 'package:hod_app/theme/palette.dart';

const double proportion = 1.15779;

class HodLogo extends StatelessWidget {
  const HodLogo({super.key, this.width = 200.0});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Palette.lightBlue,
      child: Image(
        width: width,
        height: width * proportion,
        image: const AssetImage("assets/images/logo_1_heaven_of_dice.png"),
        fit: BoxFit.fill,
      ),
    );
  }
}
