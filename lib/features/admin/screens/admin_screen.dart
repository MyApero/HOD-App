import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/features/admin/screens/create_event.dart';
import 'package:hod_app/widgets/select_button.dart';

class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key});

  // final void Function(int) onChangedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SelectButton(
          label: "Créer un event",
          icon: Icons.arrow_circle_right_outlined,
          onPressed: () {
            Navigator.of(context).push(CreateEvent.route());
          },
        ),
        const SizedBox(height: 20),
        const SelectButton(
            label: "Modifier un event",
            icon: Icons.arrow_circle_right_outlined),
        const SizedBox(height: 20),
        const SelectButton(label: "Vote", icon: Icons.arrow_circle_right_outlined),
        const SizedBox(height: 20),
        const SelectButton(
            label: "Gérer les membres",
            icon: Icons.arrow_circle_right_outlined),
      ],
    );
  }
}
