import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/core/providers.dart';
import 'package:hod_app/data/Event.dart';

class EventData extends ConsumerWidget {
  const EventData({super.key, required this.builder});

  final Widget Function(List<Event> event) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    return FutureBuilder<DocumentList>(
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
                return builder(events);
              }
              return const Text('No data');
            },
          );
  }
}