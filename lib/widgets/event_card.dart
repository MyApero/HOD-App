import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  EventCard({
    super.key,
    required this.large,
    required this.date,
    required this.name,
    this.pole = "",
    required this.description
  }) : dateParse = DateTime.parse(date.toString());

  final DateTime dateParse;
  final DateTime date;
  final bool large;
  final String name;
  final String pole;
  final String description;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        "${dateParse.day}/${dateParse.month}/${dateParse.year}";
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
          children: [
            Text(
              formattedDate,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Text("[$name]"),
            if (pole.isNotEmpty) Text("Pole $pole"),
            SizedBox(height: 25),
            Text(description),
          ],
        ),
      ),
    );
  }
}
