import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/features/admin/screens/event_list.dart';
import 'package:hod_app/features/admin/screens/set_or_create_event.dart';
import 'package:hod_app/features/admin/screens/manage_users_role.dart';
import 'package:hod_app/features/poll/view/poll_home.dart';
import 'package:hod_app/widgets/select_button.dart';

class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SelectButton(
          label: "Créer un event",
          icon: Icons.arrow_right_alt_rounded,
          onPressed: () {
            Navigator.of(context).push(SetOrCreateEvent.route());
          },
        ),
        const SizedBox(height: 20),
        SelectButton(
          label: "Modifier un event",
          icon: Icons.arrow_right_alt_rounded,
          onPressed: () {
            Navigator.of(context).push(EventListScreen.route());
          },
        ),
        const SizedBox(height: 20),
        SelectButton(
          label: "Sondages",
          icon: Icons.arrow_right_alt_rounded,
          onPressed: () {
            Navigator.of(context).push(PollHomeScreen.route());
          },
        ),
        const SizedBox(height: 20),
        SelectButton(
          label: "Gérer les membres",
          icon: Icons.arrow_right_alt_rounded,
          onPressed: () {
            Navigator.of(context).push(ManageUsersRoleScreen.route());
          },
        ),
      ],
    );
  }
}
