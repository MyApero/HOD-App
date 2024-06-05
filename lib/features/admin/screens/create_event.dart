import 'package:flutter/material.dart';
import 'package:hod_app/widgets/auth_field.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/datetime_picker.dart';
import 'package:hod_app/widgets/dropdown_selection.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

List<String> poles = ["WEREWOLF", "TOUDOULELOU"];

class CreateEvent extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => CreateEvent());
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final TextEditingController _startDateController = TextEditingController();

  final TextEditingController _endDateController = TextEditingController();

  String? selectedPole = "";

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Créer un event",
      hasBackArrow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SimpleText("Informations de l'event"),
          AuthField(label: "Nom"),
          DateTimePicker(controller: _startDateController, label: "START DATE"),
          DateTimePicker(controller: _endDateController, label: "END DATE"),
          DropdownSelection(
              onValueChange: (value) {
                setState(() {
                  selectedPole = value;
                });
              },
              items: poles,
              label: "Pole"),
          AuthField(label: "Lieu"),
          AuthField(label: "Description"),
          HodButton(label: "Créer", onTapped: () {}),
        ],
      ),
    );
  }
}
