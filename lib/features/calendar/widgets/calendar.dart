import 'package:flutter/material.dart';
import 'package:hod_app/apis/event_api.dart';
import 'package:hod_app/features/home/view/widgets/event_details_dialog.dart';
import 'package:hod_app/models/event_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key, required this.appointments});

  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
      timeSlotViewSettings: const TimeSlotViewSettings(timeFormat: 'H:mm'),
      allowedViews: const [
        CalendarView.day,
        CalendarView.week,
        CalendarView.month,
      ],
      showNavigationArrow: true,
      dataSource: MeetingDataSource(appointments),
      firstDayOfWeek: 1,
      onTap: (CalendarTapDetails details) async {
        if (details.appointments == null) return;
        final String eventId =
            (details.appointments![0] as Appointment).id.toString();
        final EventModel? event = await EventApi.getEvent(eventId: eventId);
        if (event == null) {
          return;
        }
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => EventDetailsDialog(event: event),
          );
        }
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
