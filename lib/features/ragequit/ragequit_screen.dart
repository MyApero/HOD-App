import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/widgets/hod_button.dart';

class RagequitScreen extends StatelessWidget {
  const RagequitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HodButton(
            label: 'rage quit',
            onTapped: () {
              AuthApi.signOut();
            }),
        const SizedBox(height: 20),
        if (FirebaseAuth.instance.currentUser != null)
          Text("I am ${FirebaseAuth.instance.currentUser!.email}"),
      ],
    );
  }
}
