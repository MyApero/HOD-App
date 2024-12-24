import 'package:flutter/material.dart';
import 'package:hod/theme/palette.dart';

enum GameStatus {
  none,
  notstarted,
  ingame,
  topwin,
  botwin,
}

const activeColor = Palette.purple;
const inactiveColor = Palette.whitePurple;
const activeTextColor = Palette.white;
const inactiveTextColor = Palette.black;
const looseColor = Palette.error;
const winColor = Colors.greenAccent;
