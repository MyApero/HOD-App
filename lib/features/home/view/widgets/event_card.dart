import 'package:flutter/material.dart';
import 'package:hod_app/constants/pole_const.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/event_model.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/features/home/view/widgets/event_details_dialog.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.large,
    required this.event,
  });

  final bool large;
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE d MMM yyyy', 'fr_FR').format(event.startDate);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          fixedSize: WidgetStatePropertyAll(Size(!large ? 150 : 320, 220)),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => EventDetailsDialog(event: event),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SimpleText(
              formattedDate,
              color: Palette.whitePurple,
              textSize: 14,
            ),
            SimpleText(
              event.name.capitalize(),
              color: Palette.white,
              textSize: 17,
            ),
            SimpleText(
              poleNamesMap.keys.contains(event.pole)
                  ? "Pole ${poleNamesMap[event.pole]}"
                  : "Pole Inconnu",
              color: Palette.whitePurple,
            ),
            SimpleText(
              event.location,
              color: Palette.whitePurple,
            ),
          ],
        ),
      ),
    );
  }
}
