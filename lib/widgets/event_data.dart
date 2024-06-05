import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/data/Event.dart';

class EventData extends StatelessWidget {
  const EventData({super.key, required this.builder});

  final Widget Function(List<Event> event) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(DbConst.events).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          final List<Event> events = snapshot.data!.docs
              .map<Event>((e) => Event.fromJson(e.data()))
              .toList();
          return builder(events);
        }
        return const Text('No data');
      },
    );
  }
}
