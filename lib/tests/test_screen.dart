import 'package:flutter/material.dart';
import 'package:hod_app/widgets/calendar.dart';
import 'package:hod_app/widgets/card.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';
import 'package:hod_app/widgets/text_box.dart';

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
              child: TextBox(label: "coucou", isPassword: false)),
          SizedBox(
            width: 20,
            height: 20,
          ),
          Container(
              width: 200,
              color: Colors.blue,
              child: SimpleText(text: "bonsoir les amiiiiiis :")),
          Row(
              children: [
                EventCard(large: false, date: DateTime.utc(2024, 12, 12), name: "manger des chips", pole: "Bouffeur"),
                EventCard(large: false, date: DateTime.now(), name: "aller se faire foutre", pole: "Oui"),
              ],
            ),
          SelectButton(label: "bouton test", icon: Icons.view_agenda),
        ],
      ),
    );
  }
}
