import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/constants/appwrite_constants.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/core/providers.dart';
import 'package:hod_app/data/Event.dart';
import 'package:hod_app/features/auth/controller/auth_controller.dart';
import 'package:hod_app/tests/theme_screen.dart';
import 'package:hod_app/widgets/appwrite_stream_builder.dart';
import 'package:hod_app/widgets/hod_button.dart';

class EventsScreenTest extends ConsumerWidget {
  const EventsScreenTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController eventNameController = TextEditingController();
    final database = ref.read(databaseProvider);
    final realtime = ref.read(realtimeProvider);
    return Column(
      children: [
        TextField(
          controller: eventNameController,
          decoration: const InputDecoration(labelText: 'Event name'),
        ),
        HodButton(
            label: 'Create your event',
            onTapped: () async {
              final document = await database.createDocument(
                  databaseId: AppwriteConstants.databaseId,
                  collectionId: DbConst.events,
                  documentId: ID.unique(),
                  data: Event(
                          name: eventNameController.text,
                          startDate: DateTime.now(),
                          endDate: null,
                          pole: DbConst.poleWerewolf,
                          description: 'This is a test event')
                      .toJson());
              print(document.$permissions);
            }),
        // Expanded(
        //   child: StreamBuilder(
        //     stream: realtime.subscribe(['databases.${AppwriteConstants.databaseId}.collections.${DbConst.events}.documents']).stream,
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const CircularProgressIndicator();
        //       }
        //       if (snapshot.hasError) {
        //         return Text('Error: ${snapshot.error}');
        //       }
        //       if (snapshot.hasData) {
        //         // final List<Event> events = snapshot.data!.
        //         //     .map<Event>((e) => Event.fromJson(e.data))
        //         //     .toList();
        //         print(snapshot.data);
        //         return SingleChildScrollView(
        //           child: Column(
        //             children: []
        //                 .map((e) => ListTile(
        //                       leading: const Icon(Icons.event),
        //                       title: Text(e.name),
        //                       subtitle: Text(e.description ?? ''),
        //                     ))
        //                 .toList(),
        //           ),
        //         );
        //       }
        //       return const Text('No data');
        //     },
        //   ),
        // ), // StreamBuilder
        // Expanded(
        //   child: FutureBuilder<DocumentList>(
        //     future: database.listDocuments(
        //         databaseId: AppwriteConstants.databaseId,
        //         collectionId: DbConst.events),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const CircularProgressIndicator();
        //       }
        //       if (snapshot.hasError) {
        //         return Text('Error: ${snapshot.error}');
        //       }
        //       if (snapshot.hasData) {
        //         final List<Event> events = snapshot.data!.documents
        //             .map<Event>((e) => Event.fromJson(e.data))
        //             .toList();
        //         return SingleChildScrollView(
        //           child: Column(
        //             children: events
        //                 .map((e) => ListTile(
        //                       leading: const Icon(Icons.event),
        //                       title: Text(e.name),
        //                       subtitle: Text(e.description ?? ''),
        //                     ))
        //                 .toList(),
        //           ),
        //         );
        //       }
        //       return const Text('No data');
        //     },
        //   ),
        // ), // FutureBuilder
        // Expanded(
        //   child: AppwriteStreamBuilder(
        //     collectionId: DbConst.users,
        //     // itemBuilder: (jsonItem) => Event.fromJson(jsonItem),
        //     builder: (users) => ListView.builder(
        //       itemBuilder: (context, index) {
        //         final user = users[index];
        //         return ListTile(
        //           leading: const Icon(Icons.event),
        //           title: Text(user['first_name']),
        //           // subtitle: Text(event.description ?? ''),
        //         );
        //       },
        //       itemCount: users.length,
        //     ),
        //   ),
        // ), // AppwriteStreamBuilder
        Expanded(
          child: AppwriteStreamBuilder(
            collectionId: DbConst.events,
            itemBuilder: (jsonItem) => Event.fromJson(jsonItem),
            builder: (events) => ListView.builder(
              itemBuilder: (context, index) {
                Event event = events[index];
                return ListTile(
                  leading: const Icon(Icons.event),
                  title: Text(event.name),
                  subtitle: Text(event.description ?? ''),
                );
              },
              itemCount: events.length,
            ),
          ),
        ), // AppwriteStreamBuilder
        // Expanded(
        //   child: StreamBuilder(
        //       stream: ref.read(realtimeProvider).subscribe([
        //         'database.${AppwriteConstants.databaseId}.collections.${DbConst.events}.documents'
        //       ]).stream,
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.waiting) {
        //           return const CircularProgressIndicator();
        //         }
        //         if (snapshot.hasError) {
        //           return Text('Error: ${snapshot.error}');
        //         }
        //         if (snapshot.hasData) {
        //           final retrievedData = snapshot.data!.payload;
        //           print(retrievedData);
        //           return ThemeCard(
        //               boxColor: Colors.amber, textColor: Colors.black);
        //         }
        //         return const Text('No data');
        //       }),
        // ),
      ],
    );
  }
}
