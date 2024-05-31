import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: TableCalendar(
          
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2000, 12, 1),
          lastDay: DateTime.utc(2030, 12, 31)),
    );
  }
}
