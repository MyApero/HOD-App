import 'package:hod/constants/constants.dart';
import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
    required this.time,
    required this.color,
    this.isActive = true,
  });

  final String time;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      textAlign: isActive ? TextAlign.start : TextAlign.end,
      style: TextStyle(
        fontSize: 100,
        fontFeatures: const [FontFeature.tabularFigures()],
        fontFamily: HodFonts.coolvetica,
        color: color,
      ),
    );
  }
}
