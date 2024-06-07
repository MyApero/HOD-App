import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/apis/event_api.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/models/event_model.dart';

class EventData extends StatelessWidget {
  const EventData({super.key, required this.builder, this.poleFilter});

  final Widget Function(List<EventModel> event) builder;
  final String? poleFilter;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: EventApi.getEvents(poleFilter: poleFilter),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          final List<EventModel> events = snapshot.data!.docs
              .map<EventModel>((e) => EventModel.fromJson(e.data()))
              .toList();
          return builder(events);
        }
        return const Text('No data');
      },
    );
  }
}
