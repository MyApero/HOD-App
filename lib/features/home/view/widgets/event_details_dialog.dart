import 'package:flutter/material.dart';
import 'package:hod_app/models/event_model.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:intl/intl.dart';

class EventDetailsDialog extends StatelessWidget {
  const EventDetailsDialog({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE d MMM yyyy', 'fr_FR').format(event.startDate);
    return AlertDialog(
      backgroundColor: Palette.purple,
      title: SimpleText(
        event.name,
        textSize: 20,
        color: Palette.white,
      ),
      content: Container(
        // padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            SimpleText(
              formattedDate,
              textSize: 16,
              color: Palette.white,
            ),
            const SizedBox(height: 10),
            if (event.pole != null)
              SimpleText(
                "Pole ${event.pole}",
                textSize: 16,
                color: Palette.whitePurple,
              ),
            const SizedBox(height: 10),
            SimpleText(
              event.location,
              textSize: 16,
              color: Palette.whitePurple,
            ),
            if (event.description != null)
              SimpleText(
                event.description!,
                textSize: 16,
                color: Palette.white,
              ),
          ],
        ),
      ),
    );
  }
}
