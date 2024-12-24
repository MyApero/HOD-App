import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod/features/admin/screens/set_or_create_event.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/models/event_model.dart';
import 'package:hod/widgets/simple_text.dart';

class EventListScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EventListScreen());
  const EventListScreen({super.key});

  void _editEvent(BuildContext context, EventModel event) {
    Navigator.of(context).push(SetOrCreateEvent.route(event: event));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      title: "Liste des événements",
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('events').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Text('No events');
          }

          List<EventModel> events =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            return EventModel.fromJson(document.data() as Map<String, dynamic>);
          }).toList();

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final EventModel event = events[index];
              return ListTile(
                title: Text(event.name),
                subtitle: Text(event.pole ?? ""),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: SimpleText(
                            'Supprimer ${event.name}',
                            textSize: 20,
                          ),
                          content: const SimpleText(
                              "Tu veux vraiment faire ça ? le pauvre ;'( "),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const SimpleText('Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('events')
                                    .doc(event.id)
                                    .delete();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Supprimer'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                leading: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _editEvent(context, event);
                  },
                ),
                onTap: () {
                  _editEvent(context, event);
                },
              );
            },
          );
        },
      ),
    );
  }
}
