import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/constants/appwrite_constants.dart';
import 'package:hod_app/core/providers.dart';
import 'package:hod_app/data/Event.dart';
import 'package:hod_app/widgets/event_card.dart';
import 'package:hod_app/widgets/simple_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.read(databaseProvider);
    final realtime = ref.read(realtimeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [SizedBox(height: 20),
        SimpleText("Mes prochains événements"),
        SizedBox(height: 10),
        FutureBuilder<DocumentList>(
            future: database.listDocuments(
                databaseId: AppwriteConstants.databaseId,
                collectionId: DbConst.events,
                // queries: [Query.contains('subscribedUsers.', database.client)
                // ]
                ),
                
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (snapshot.hasData) {
                final List<Event> events = snapshot.data!.documents
                    .map<Event>((e) => Event.fromJson(e.data))
                    .toList();
                return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: events
                          // .map((e) => ListTile(
                          //       leading: const Icon(Icons.event),
                          //       title: Text(e.name),
                          //       subtitle: Text(e.description ?? ''),
                          //     ))
                          .map((e) => EventCard(
                                large: false,
                                date: e.startDate ?? DateTime.now(),
                                name: e.name,
                                pole: e.pole ?? "",
                                description: e.description ?? "No description",
                              ))
                          .toList(),
                    ),
                );
              }
              return const Text('No data');
            },
          ),
      ],
    );
  }
}