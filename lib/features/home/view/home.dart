import 'package:flutter/material.dart';
import 'package:hod_app/features/home/view/widgets/event_card.dart';
import 'package:hod_app/features/home/view/widgets/event_data.dart';
import 'package:hod_app/models/event_model.dart';
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
          EventData(
            builder: (events) {
          events.sort((a,b) {
    var adate = a.startDate;
     var bdate = b.startDate;
     return adate.compareTo(bdate);
  });
;
              return Expanded(
                child: GridView.builder(
                  itemCount: events.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return EventCard(
                      large: false,
                      event: events[index],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
