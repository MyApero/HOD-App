import 'package:flutter/material.dart';

class WerewolfRoleModel {
  const WerewolfRoleModel({
    required this.name,
    required this.message,
    required this.icon,
  });

  final String name;
  final String message;
  final IconData icon;
}