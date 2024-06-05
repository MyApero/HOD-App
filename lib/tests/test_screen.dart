import 'package:flutter/material.dart';
import 'package:hod_app/widgets/calendar.dart';
import 'package:hod_app/widgets/event_card.dart';
import 'package:hod_app/widgets/player_card.dart';
import 'package:hod_app/widgets/player_card_item.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:hod_app/widgets/auth_field.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Colors.red,
              child: AuthField(label: "coucou")),
          const SizedBox(
            width: 20,
            height: 20,
          ),
          Container(
            width: 200,
            color: Colors.blue,
            child: const SimpleText("bonsoir les amiiiiiis :"),
          ),
          SizedBox(height: 50),
          Calendar(appointments: [],),
          // PlayerCard(),
          // PlayerCardItem(fieldKey: "Duree de jeu", fieldValue: "2h",),
          // PlayerCardItem(fieldKey: "Debut de l'aventure", fieldValue: "20/04/2024",)
        ],
      ),
    );
  }
}
