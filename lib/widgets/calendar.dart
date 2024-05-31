import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
      dataSource: MeetingDataSource(
        getAppointments()
      ),
    );
  }


  // TODO: fonction à changer plus tard pour récupérer les vraies events du joueur
  List<Appointment> getAppointments() {
    List<Appointment> appointments = <Appointment>[];

    appointments.add(Appointment(
        startTime: DateTime.utc(2024, 6, 3, 9, 0, 0),
        endTime: DateTime.utc(2024, 6, 3, 10, 30, 0),
        subject: 'PCP',
        color: Colors.blue));

    return appointments;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
