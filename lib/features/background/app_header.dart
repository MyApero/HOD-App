import 'package:flutter/material.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/hod_logo.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10),
      HodLogo(width: MediaQuery.of(context).size.height * 10 / 100),
      Container(
        // color: Colors.red,
        child: Text(
          textAlign: TextAlign.center,
          title ?? "NO TEXT",
          style: TextStyle(
            height: 0.8,
            fontSize: MediaQuery.of(context).size.height * 5 / 100,
            color: Palette.black,
            fontFamily: "CoolveticaCompressedHv",
          ),
        ),
      ),
      const SizedBox(height: 30)
    ]);
  }
}
