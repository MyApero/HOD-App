import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hod_app/features/poles/reflexiongame/widgets/timer_choose_dialog.dart';
import 'package:hod_app/features/poles/reflexiongame/widgets/timer_side.dart';
import 'package:hod_app/features/poles/reflexiongame/widgets/timer_utils.dart';
import 'package:hod_app/theme/palette.dart';

class TimerScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const TimerScreen());
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  bool isTopActive = true;
  Color topColor = activeColor;
  Color bottomColor = inactiveColor;

  Color topTextColor = activeTextColor;
  Color bottomTextColor = inactiveTextColor;

  int topMiliSec = 30 * 60 * 1000;
  int bottomMiliSec = 30 * 60 * 1000;

  GameStatus gameStatus = GameStatus.none;

  Timer? timer;

  void flipSide() {
    if (gameStatus == GameStatus.notstarted) {
      timer = Timer.periodic(
        const Duration(milliseconds: 1),
        (t) {
          setState(() {
            if (topMiliSec < 0) {
              timer!.cancel();
              gameStatus = GameStatus.botwin;
              topColor = looseColor;
              bottomColor = winColor;
              topMiliSec = 0;
              return;
            }
            if (bottomMiliSec < 0) {
              timer!.cancel();
              gameStatus = GameStatus.topwin;
              bottomColor = looseColor;
              topColor = winColor;
              bottomMiliSec = 0;
              return;
            }
            if (isTopActive) {
              topMiliSec--;
            } else {
              bottomMiliSec--;
            }
          });
        },
      );
      gameStatus = GameStatus.ingame;
    }
    setState(() {
      isTopActive = !isTopActive;
      topColor = isTopActive ? activeColor : inactiveColor;
      bottomColor = isTopActive ? inactiveColor : activeColor;

      topTextColor = isTopActive ? activeTextColor : inactiveTextColor;
      bottomTextColor = isTopActive ? inactiveTextColor : activeTextColor;
    });
  }

  String formatToTimer(int totalMilliseconds) {
    int totalSeconds = totalMilliseconds ~/ 1000;
    int milliseconds = totalMilliseconds % 1000;
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;

    if (minutes > 1) {
      String minutesStr = minutes.toString().padLeft(2, '0');
      String secondsStr = seconds.toString().padLeft(2, '0');
      return '$minutesStr:$secondsStr';
    } else {
      String secondsStr = seconds.toString();
      String millisecondsStr = (milliseconds / 100).round().toString();
      return '$secondsStr.$millisecondsStr';
    }
  }

  Future<int?> changeTime(BuildContext context, int localTime) async {
    int? newTime = await showDialog(
      context: context,
      builder: (context) {
        return TimerChooseDialog(defaultValue: localTime);
      },
    );
    if (newTime == null) return null;
    return newTime * 60 * 1000;
  }

  @override
  void initState() {
    super.initState();
    isTopActive = Random().nextBool();
    flipSide();
    setState(() {
      gameStatus = GameStatus.notstarted;
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null && timer!.isActive) timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              TimerSide(
                backgroundColor: topColor,
                textColor: topTextColor,
                time: formatToTimer(topMiliSec),
                isActive: isTopActive,
                onLongPress: () async {
                  int? newTime = await changeTime(context, topMiliSec);
                  if (newTime != null) {
                    setState(() {
                      topMiliSec = newTime;
                    });
                  }
                },
                onTap: flipSide,
                isTopSide: true,
                gameStatus: gameStatus,
              ),
              TimerSide(
                backgroundColor: bottomColor,
                textColor: bottomTextColor,
                time: formatToTimer(bottomMiliSec),
                isActive: !isTopActive,
                onLongPress: () async {
                  int? newTime = await changeTime(context, bottomMiliSec);
                  if (newTime != null) {
                    setState(() {
                      bottomMiliSec = newTime;
                    });
                  }
                },
                onTap: flipSide,
                isTopSide: false,
                gameStatus: gameStatus,
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  size: 35,
                  color: Palette.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
