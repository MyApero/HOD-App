import 'package:appwrite/models.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hod_app/features/auth/controller/auth_controller.dart';
import 'package:hod_app/widgets/hod_button.dart';

class RagequitScreen extends ConsumerWidget {
  const RagequitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? currentUser = ref.watch(currentUserProvider).value;
    return Column(
      children: [
        HodButton(
            label: 'rage quit',
            onTapped: () {
              ref
                  .read(authControllerProvider.notifier)
                  .logout(context: context);
            }),
        Text(
          "Hello ${ref.watch(currentUserProvider).when(data: (user) {
            if (user != null) {
              return user.email;
            }
            return "f";
          }, error: (e, stacktrace) {
            return e;
          }, loading: () {
            return "loading";
          })}",
        ),
        const SizedBox(height: 20),
        if (currentUser != null)
          Text("I am ${currentUser.emailVerification}"),
        HodButton(label: "Send verification mail", onTapped: () {
          ref.read(authControllerProvider.notifier).sendVerificationMail(context: context);
        })
      ],
    );
  }
}
