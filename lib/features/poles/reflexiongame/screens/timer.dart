import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/theme/palette.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
    required this.time,
    required this.color,
    this.isActive = true,
  });

  // final String time;
  final TimeOfDay time;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Text(
      time.format(context),
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

class TimerSide extends StatelessWidget {
  const TimerSide({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.time,
    this.isActive = true,
    this.onTap,
    this.onLongPress,
  });

  final Color backgroundColor;
  final Color textColor;
  // final String time;
  final TimeOfDay time;
  final bool isActive;
  final void Function()? onLongPress;
  final void Function()? onTap;

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
            child: Container(
              // color: Colors.amber,
              // width: 230,
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

class TimerScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const TimerScreen());
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

const activeColor = Palette.purple;
const inactiveColor = Palette.whitePurple;
const activeTextColor = Palette.white;
const inactiveTextColor = Palette.black;

class _TimerScreenState extends State<TimerScreen> {
  bool isTopActive = true;
  Color topColor = activeColor;
  Color bottomColor = inactiveColor;

  Color topTextColor = activeTextColor;
  Color bottomTextColor = inactiveTextColor;

  TimeOfDay topTime = TimeOfDay.now();
  TimeOfDay bottomTime = TimeOfDay.now();

  int topTenMiliSec = 6000;
  int bottomTenMiliSec = 6000;

  late Timer timer;

  void flipSide() {
    setState(() {
      isTopActive = !isTopActive;
      topColor = isTopActive ? activeColor : inactiveColor;
      bottomColor = isTopActive ? inactiveColor : activeColor;

      topTextColor = isTopActive ? activeTextColor : inactiveTextColor;
      bottomTextColor = isTopActive ? inactiveTextColor : activeTextColor;
    });
  }

  String formatToTimer(int number) {
    String numberString = number.toString().padLeft(4, '0');
    return '${numberString.substring(0, 2)}:${numberString.substring(2, 4)}';
  }

  Future<int?> changeTime(BuildContext context, int localTime) async {
    TextEditingController controller =
        TextEditingController(text: ((localTime / 100).round()).toString());
    int? newTime = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Change Time"),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(int.parse(controller.text));
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
    if (newTime == null) return null;
    return newTime * 100;
  }

  @override
  void initState() {
    super.initState();
    isTopActive = Random().nextBool();
    flipSide();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (isTopActive) {
            // topTenMiliSec--;
            // topTime = TimeOfDay(hour: topTenMiliSec ~/ 100, minute: topTenMiliSec % 100);
            topTime.replacing(hour: topTime.minute - 1);
          } else {
            // bottomTenMiliSec--;
            // bottomTime = TimeOfDay(hour: bottomTenMiliSec ~/ 100, minute: bottomTenMiliSec % 100);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TimerSide(
            backgroundColor: topColor,
            textColor: topTextColor,
            // time: "00:00",
            // time: formatToTimer(topTenMiliSec),
            time: topTime,
            isActive: isTopActive,
            onTap: flipSide,
          ),
          TimerSide(
            backgroundColor: bottomColor,
            textColor: bottomTextColor,
            // time: formatToTimer(bottomTenMiliSec),
            // time: "00:00",
            time: bottomTime,
            isActive: !isTopActive,
            onLongPress: () async {
              int? newTime = await changeTime(context, bottomTenMiliSec);
              if (newTime != null) {
                setState(() {
                  bottomTenMiliSec = newTime;
                });
              }
            },
            onTap: flipSide,
          ),
        ],
      ),
    );
  }
}
