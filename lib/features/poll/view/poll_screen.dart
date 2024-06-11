import 'package:flutter/material.dart';
import 'package:hod_app/apis/poll_api.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/poll_model.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';

class PollScreen extends StatefulWidget {
  static route(String username, PollModel poll) => MaterialPageRoute(
      builder: (ctx) => PollScreen(username: username, poll: poll));
  const PollScreen({super.key, required this.username, required this.poll});

  final String username;
  final PollModel poll;

  @override
  State<PollScreen> createState() => _PollScreenState();
}

class _PollScreenState extends State<PollScreen> {
  int voteIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasBackArrow: true,
      title: widget.poll.name,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("Vote(s) restant : ${poll..length}"),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < widget.poll.options.length; i++)
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              voteIndex == i ? Colors.blue : Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            voteIndex = i;
                          });
                        },
                        child: Text(widget.poll.options[i].name),
                      ),
                  ],
                ),
              ),
            ),
          ),
          HodButton(
            label: "Valider",
            onTapped: () async {
              final bool voted = await PollApi.vote(
                  pollName: widget.poll.name,
                  optionName: widget.poll.options[voteIndex].name,
                  username: widget.username);
              if (!voted) {
                if (context.mounted) {
                  showSnackBar(context, "Le vote n'a pas pu être enregistré");
                }
                return;
              }
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
