import 'package:flutter/material.dart';
import 'package:hod_app/widgets/datetime_form_picker.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/simple_text.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(color: Colors.red, child: HodFormField(label: "coucou")),
          const SizedBox(
            width: 20,
            height: 20,
          ),
          Container(
            width: 200,
            color: Colors.blue,
            child: const SimpleText("bonsoir les amiiiiiis :"),
          ),
          const SizedBox(height: 50),
          DatetimeFormPicker(onChanged: (date) {}, label: "start date"),
          // PlayerCard(),
          // PlayerCardItem(fieldKey: "Duree de jeu", fieldValue: "2h",),
          // PlayerCardItem(fieldKey: "Debut de l'aventure", fieldValue: "20/04/2024",)
        ],
      ),
    );
  }
}
