import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hod_app/features/poles/reflexiongame/widgets/timer_text.dart';
import 'package:hod_app/features/poles/reflexiongame/widgets/timer_utils.dart';

class TimerSide extends StatelessWidget {
  const TimerSide({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.time,
    this.isActive = true,
    this.onTap,
    this.onLongPress,
    required this.isTopSide,
    required this.gameStatus,
  });

  final Color backgroundColor;
  final Color textColor;
  final String time;
  final bool isActive;
  final void Function()? onLongPress;
  final void Function()? onTap;
  final bool isTopSide;
  final GameStatus gameStatus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: isActive ? onTap : null,
        onLongPress: onLongPress,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: backgroundColor,
          child: Center(
            child: Transform.rotate(
              angle: isTopSide ? pi : 0,
              child: TimerText(
                time: time,
                color: textColor,
                isActive: isActive,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
