import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:hod/widgets/simple_text.dart';

class TimerChooseDialog extends StatefulWidget {
  const TimerChooseDialog({super.key, this.defaultValue});

  final int? defaultValue;

  @override
  State<TimerChooseDialog> createState() => _TimerChooseDialogState();
}

class _TimerChooseDialogState extends State<TimerChooseDialog> {
  int minutes = 0;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null && widget.defaultValue! > 0) {
      minutes = widget.defaultValue! ~/ 1000 ~/ 60;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SimpleText(
        "Change le temps (comme dans BTTF)",
        textSize: 17,
      ),
      content: DurationPicker(
        duration: Duration(minutes: minutes),
        onChange: (value) {
          setState(() {
            minutes = value.inMinutes;
          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const SimpleText("Annuler"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(minutes);
          },
          child: const SimpleText("C'est parti Marty !"),
        ),
      ],
    );
  }
}
