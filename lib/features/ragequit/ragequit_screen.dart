import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/features/auth/controller/auth_controller.dart';
import 'package:hod_app/widgets/background/app_background.dart';
import 'package:hod_app/widgets/hod_button.dart';

class RagequitScreen extends ConsumerWidget {
  const RagequitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBackground(
        title: "ME DECONNECTER HAHAHAHHAH",
        child: Column(
          children: [
            HodButton(label: 'rage quit', onTapped: () {
              ref.read(authControllerProvider.notifier).logout(context: context);
            }),
          ],
        ));
  }
}
