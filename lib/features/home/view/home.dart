import 'package:flutter/material.dart';
import 'package:hod_app/widgets/event_card.dart';
import 'package:hod_app/widgets/event_data.dart';
import 'package:hod_app/widgets/simple_text.dart';

class HomeScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeScreen());
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const SimpleText("Les prochains événements"),
          const SizedBox(height: 10),
          EventData(
            builder: (events) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: events
                      .map((e) => EventCard(
                            large: false,
                            date: e.startDate,
                            name: e.name,
                            pole: e.pole ?? "",
                            description: e.description ?? "No description",
                          ))
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
