import 'package:flutter/material.dart';
import 'package:hod_app/widgets/auth_field.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/simple_text.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => CreateEvent()
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        hasBackArrow: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleText("Informations de l'event"),
                AuthField(label: "Nom de l'event"),
                AuthField(label: "Description de l'event"),
              ],
        ),
      title: "Créer un event",
      ),
    );
  }
}
