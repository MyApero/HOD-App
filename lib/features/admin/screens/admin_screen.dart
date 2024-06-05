import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/features/admin/screens/create_event.dart';
import 'package:hod_app/widgets/select_button.dart';
import 'package:hod_app/widgets/simple_text.dart';

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
            print("hello");
            Navigator.of(context).push(CreateEvent.route());
            // ref.read(adminIndexProvider.notifier).changeIndex(1);
          },
        ),
        SizedBox(height: 20),
        SelectButton(
            label: "Modifier un event",
            icon: Icons.arrow_circle_right_outlined),
        SizedBox(height: 20),
        SelectButton(label: "Vote", icon: Icons.arrow_circle_right_outlined),
        SizedBox(height: 20),
        SelectButton(
            label: "Gérer les membres",
            icon: Icons.arrow_circle_right_outlined),
      ],
    );
  }
}
