import 'package:flutter/material.dart';
import 'package:hod_app/widgets/calendar.dart';
import 'package:hod_app/widgets/event_data.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hod_app/data/event.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  List<Appointment> getAppointments(List<Event> events) {
    return events
        .map(
          (e) => Appointment(
            startTime: e.startDate,
            endTime: e.endDate,
            subject: e.name,
            color: Colors.red,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return EventData(
      builder: (events) {
        return Calendar(
          appointments: getAppointments(events),
        );
      },
    );
  }
}
