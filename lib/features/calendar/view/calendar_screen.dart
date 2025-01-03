import 'package:flutter/material.dart';
import 'package:hod/models/event_model.dart';
import 'package:hod/features/calendar/widgets/calendar.dart';
import 'package:hod/features/home/view/widgets/event_data.dart';
import 'package:hod/theme/palette.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  List<Appointment> getAppointments(List<EventModel> events) {
    return events
        .map(
          (e) => Appointment(
            startTime: e.startDate,
            endTime: e.endDate,
            subject: e.name,
            color: Palette.purple,
            id: e.id,
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
