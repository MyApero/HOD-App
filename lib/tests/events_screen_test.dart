import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/constants/appwrite_constants.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/core/providers.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/data/Event.dart';
import 'package:hod_app/features/auth/controller/auth_controller.dart';
import 'package:hod_app/widgets/event_card.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class EventsScreenTest extends ConsumerWidget {
  const EventsScreenTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController eventNameController = TextEditingController();
    final database = ref.read(databaseProvider);
    final realtime = ref.read(realtimeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: eventNameController,
          decoration: const InputDecoration(labelText: 'Event name'),
        ),
        SizedBox(height: 10),
        HodButton(
            label: 'Create your event',
            onTapped: () async {
              try {
                final document = await database.createDocument(
                    databaseId: AppwriteConstants.databaseId,
                    collectionId: DbConst.events,
                    documentId: ID.unique(),
                    data: Event(
                            name: eventNameController.text,
                            startDate: DateTime.now(),
                            endDate: DateTime.now(),
                            pole: DbConst.poleWerewolf,
                            description: 'This is a test event')
                        .toJson());
                print(document.$permissions);
                showSnackBar(context, "event created suiiii");
              } on AppwriteException catch (e, stackTrace) {
                showSnackBar(context, e.message ?? "Unexpected error");
              }
            }),
      ],
    );
    // child: StreamBuilder(
    //   stream: realtime.subscribe(['databases.${AppwriteConstants.databaseId}.collections.${DbConst.events}.documents']).stream,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const CircularProgressIndicator();
    //     }
    //     if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     }
    //     if (snapshot.hasData) {
    //       // final List<Event> events = snapshot.data.events
    //       //     .map<Event>((e) => Event.fromJson(e.data))
    //       //     .toList();
    //       print(snapshot.data!.payload);
    //       return SingleChildScrollView(
    //         child: Column(
    //           children: []
    //               .map((e) => ListTile(
    //                     leading: const Icon(Icons.event),
    //                     title: Text(e.name),
    //                     subtitle: Text(e.description ?? ''),
    //                   ))
    //               .toList(),
    //         ),
    //       );
    //     }
    //     return const Text('No data');
    //   },
    // ),

    // SizedBox(height: 20),
    // SimpleText("Mes prochains événements"),
    // SizedBox(height: 10),
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
    //             scrollDirection: Axis.horizontal,
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: events
    //                   // .map((e) => ListTile(
    //                   //       leading: const Icon(Icons.event),
    //                   //       title: Text(e.name),
    //                   //       subtitle: Text(e.description ?? ''),
    //                   //     ))
    //                   .map((e) => EventCard(
    //                         large: false,
    //                         date: e.startDate ?? DateTime.now(),
    //                         name: e.name,
    //                         pole: e.pole ?? "",
    //                         description: e.description ?? "No description",
    //                       ))
    //                   .toList(),
    //             ),
    //         );
    //       }
    //       return const Text('No data');
    //     },
    //   ),
    // ),
  }
}
