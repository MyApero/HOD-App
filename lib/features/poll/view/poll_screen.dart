import 'package:flutter/material.dart';
import 'package:hod_app/apis/poll_api.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/features/poll/widgets/selectable_field.dart';
import 'package:hod_app/models/poll_model.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

class PollScreen extends StatefulWidget {
  static route(String username, PollModel poll) => MaterialPageRoute(
      builder: (ctx) => PollScreen(username: username, poll: poll));

  const PollScreen({
    super.key,
    required this.username,
    required this.poll,
  });

  final String username;
  final PollModel poll;

  @override
  State<PollScreen> createState() => _PollScreenState();
}

class _PollScreenState extends State<PollScreen> {
  List<int> voteIndexes = [];
  bool hasVoted = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.poll.options.length; i++) {
      if (widget.poll.options[i].voters.contains(widget.username)) {
        voteIndexes.add(i);
        hasVoted = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int optionsLength = widget.poll.options.length;
    return AppScaffold(
      hasBackArrow: true,
      title: widget.poll.name,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SimpleText("Nombre de votes : ${widget.poll.votesCount}"),
          Expanded(
            child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: optionsLength,
                itemBuilder: (context, index) {
                  int i = optionsLength -
                      index -
                      1; // so that reverse keeps the right order
                  return SelectablePollField(
                    text: widget.poll.options[i].name,
                    isSelected: voteIndexes.contains(i),
                    hasVoted: hasVoted,
                    voteCount: widget.poll.options[i].voters.length,
                    votePercentage: widget.poll.votesCount == 0
                        ? 0
                        : (widget.poll.options[i].voters.length /
                            widget.poll.votesCount),
                    onPressed: hasVoted
                        ? null
                        : () {
                            setState(() {
                              if (!widget.poll.multipleChoice) {
                                voteIndexes.clear();
                                voteIndexes.add(i);
                                return;
                              } else {
                                if (voteIndexes.contains(i)) {
                                  voteIndexes.remove(i);
                                } else {
                                  voteIndexes.add(i);
                                }
                              }
                            });
                          },
                  );
                }),
          ),
          if (!hasVoted)
            HodButton(
              label: "Valider",
              onTapped: () async {
                final bool voted = await PollApi.vote(
                    poll: widget.poll,
                    voteIndexes: voteIndexes,
                    username: widget.username);
                if (!voted) {
                  if (context.mounted) {
                    showSnackBar(context, "Le vote n'a pas pu être enregistré");
                  }
                  return;
                }
                setState(() {
                  for (int voteIndex in voteIndexes) {
                    widget.poll.options[voteIndex].voters.add(widget.username);
                  }

                  hasVoted = true;
                });
              },
            ),
        ],
      ),
    );
  }
}
