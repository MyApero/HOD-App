import 'package:flutter/material.dart';

const double proportion = 1.15779;

class HodLogo extends StatelessWidget {
  const HodLogo({super.key, this.width = 200.0});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: width * proportion,
      image: const AssetImage("assets/images/logo_hod.png"),
      fit: BoxFit.fill,
    );
  }
}
