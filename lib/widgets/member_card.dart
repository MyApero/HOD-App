import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hod/apis/local_api.dart';
import 'package:hod/models/user_model.dart';
import 'package:hod/theme/palette.dart';

class MemberCard extends StatefulWidget {
  const MemberCard({super.key});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  UserModel user = LocalApi.getCurrentUser()!;

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
        child: const Column(
          children: [
            Text(
              "Carte de Membre",
              style: TextStyle(
                fontSize: 15,
                color: Palette.white,
              ),
            ),
            SizedBox(height: 15),
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
