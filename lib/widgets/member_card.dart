import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hod_app/apis/local_api.dart';
import 'package:hod_app/models/user_model.dart';
import 'package:hod_app/theme/palette.dart';
import 'package:hod_app/widgets/player_card_item.dart';

class MemberCard extends StatefulWidget {
  const MemberCard({super.key});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  UserModel user = LocalApi.getCurrentUser();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        Navigator.of(context).pop();
      },
      child: Container(
        color: Palette.purple,
        child: Column(
          children: [
            Text(
              "Carte de Membre",
              style: TextStyle(
                fontSize: 15,
                color: Palette.white,
              ),
            ),
            const SizedBox(height: 15),
            // PlayerCardItem(fieldKey: "ID", fieldValue: user.memberCard.id),
            // PlayerCardItem(fieldKey: "Status", fieldValue: user.role.name),
            // PlayerCardItem(fieldKey: "Nom", fieldValue: user.lastName),
            // PlayerCardItem(fieldKey: "Prénom", fieldValue: user.firstName),
            // PlayerCardItem(
            //     fieldKey: "Date de péremption",
            //     fieldValue: user.memberCard.peremptionDate.toString()),
          ],
        ),
      ),
    );
  }
}
