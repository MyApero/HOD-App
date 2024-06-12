import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/features/poll/view/join_poll.dart';
import 'package:hod_app/models/poll_model.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/simple_text.dart';

class PollList extends StatelessWidget {
  const PollList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(DbConst.polls)
          .orderBy(DbConst.createdAt, descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(
              child: Text("Erreur lors du chargement des sondages"));
        }
        final List<PollModel> polls = snapshot.data!.docs
            .map((e) =>
                PollModel.fromJson(e.data() as Map<String, dynamic>, id: e.id))
            .toList();
        return ListView.builder(
            shrinkWrap: true,
            itemCount: polls.length,
            itemBuilder: (context, index) {
              final poll = polls[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Palette.lightPurple.withAlpha(200),
                  child: ListTile(
                    onFocusChange: (isFocused) {
                      print(isFocused);
                    },
                    splashColor: Palette.softPurple,
                    title: SimpleText(
                      poll.name,
                      textSize: 17,
                    ),
                    subtitle: SimpleText("Par ${poll.username}",
                        textSize: 12, color: Colors.black54),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Supprimer le sondage"),
                              content: const Text(
                                  "Êtes-vous sûr de vouloir supprimer ce sondage ?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Annuler"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection(DbConst.polls)
                                        .doc(poll.id)
                                        .delete();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Supprimer"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return JoinPollScreen(
                            pollName: poll.name,
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            });
      },
    );
  }
}
