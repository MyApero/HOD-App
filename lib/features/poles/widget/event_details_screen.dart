import 'package:flutter/material.dart';
import 'package:hod/features/home/view/widgets/event_data.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/features/home/view/widgets/event_card.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.title, this.pole});

  static route({required String title, String? pole}) => MaterialPageRoute(
      builder: (ctx) => EventDetailsScreen(title: title, pole: pole));

  final String? pole;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        hasBackArrow: true,
        title: title,
        child: EventData(
          poleFilter: pole,
          builder: (events) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: events
                  .map((event) => EventCard(
                        large: true,
                        event: event,
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
