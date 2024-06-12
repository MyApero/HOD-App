import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key, required this.appointments});

  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
      timeSlotViewSettings: const TimeSlotViewSettings(
     timeFormat: 'H:mm'),
      allowedViews: const [
        CalendarView.day,
        CalendarView.week,
        CalendarView.month,
      ],
      showNavigationArrow: true,
      dataSource: MeetingDataSource(appointments),
      onTap: (CalendarTapDetails details) {
        print(details.appointments);
      },
    );
  }

  // TODO: fonction à changer plus tard pour récupérer les vraies events du joueur
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
