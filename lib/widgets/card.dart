import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class EventCard extends StatelessWidget {
  EventCard({super.key, required this.large, required this.date, required this.name, this.pole = ""})
      : dateParse = DateTime.parse(date.toString());
  DateTime date;
  final bool large;
  final String name;
  final String pole;
  DateTime dateParse;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        "${dateParse.day}/${dateParse.month}/${dateParse.year}";
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 15, 10),
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primary),
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
            if (pole.isNotEmpty)
              Text("Pole $pole"),
          ],
        ),
      ),
    );
  }
}
