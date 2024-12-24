import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hod/features/poles/rolegame/screens/create_new_character.dart';
import 'package:hod/features/poles/rolegame/screens/role_card_info_screen.dart';
import 'package:hod/features/poles/rolegame/widgets/role_card_game_data.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/widgets/hod_button.dart';
import 'package:hod/widgets/select_button.dart';

class RoleCharacters extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const RoleCharacters());

  const RoleCharacters({super.key});

  @override
  State<RoleCharacters> createState() => _RoleCharactersState();
}

class _RoleCharactersState extends State<RoleCharacters> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Personnages",
      hasBackArrow: true,
      child: RoleCardData(
        builder: (roleCards) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...roleCards.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SelectButton(
                          label: e.name,
                          icon: FontAwesomeIcons.arrowRight,
                          onPressed: () async {
                            await Navigator.of(context).push(
                                RoleCardInfoScreen.route(
                                    name: e.name, id: e.id!));
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              HodButton(
                  label: "Créer un nouveau personnage",
                  onTapped: () async {
                    await showCreateNewCharacter(context);
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
