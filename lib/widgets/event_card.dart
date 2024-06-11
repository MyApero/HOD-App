import 'package:flutter/material.dart';
import 'package:hod_app/constants/pole_const.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  EventCard(
      {super.key,
      required this.large,
      required this.date,
      required this.name,
      required this.location,
      this.pole = "",
      required this.description})
      : dateParse = DateTime.parse(date.toString());

  final DateTime dateParse;
  final DateTime date;
  final bool large;
  final String name;
  final String location;
  final String pole;
  final String description;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE d MMM yyyy', 'fr_FR').format(date);
    return Container(
      margin: EdgeInsets.only(right: 50),
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.fromLTRB(0, 30, 0, 20),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(!large ? 150 : 320, 220),
          ),
        ),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              formattedDate,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("[$name]"),
            Text(
              textAlign: TextAlign.center,
              poleNamesMap.keys.contains(pole)
                ? "Pole ${poleNamesMap[pole]}"
                : "Pole Inconnu"),
            Text(
              textAlign: TextAlign.center,
              location),
          ],
        ),
      ),
    );
  }
}
