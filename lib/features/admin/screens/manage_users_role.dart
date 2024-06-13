import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/common/async_waiting.dart';
import 'package:hod_app/constants/constants.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/models/user_model.dart';
import 'package:hod_app/widgets/dropdown_selection.dart';
import 'package:hod_app/widgets/simple_text.dart';

class ManageUsersRoleScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ManageUsersRoleScreen());
  const ManageUsersRoleScreen({super.key});

  Future<Role> getLocalRole() async {
    UserModel? localUser = await AuthApi.getUser();
    return localUser!.role;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Gérer les membres",
      hasBackArrow: true,
      child: FutureBuilder<Role>(
        future: getLocalRole(),
        builder: (context, snapshot) {
          Widget? wait = getAsyncWaitingWidget(snapshot);
          if (wait != null) return wait;

          Role localRole = snapshot.data!;
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(DbConst.users)
                  .snapshots(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshots.hasError) {
                  return const Center(
                    child: Text("Erreur lors du chargement des membres"),
                  );
                }
                if (!snapshots.hasData) {
                  return const Center(
                    child: Text("Aucun membre trouvé"),
                  );
                }
                final usersQuery = snapshots.data!.docs;
                List<UserModel> users = usersQuery
                    .map((e) => UserModel.fromJson(e.data()))
                    .toList();

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      title: SimpleText(
                          "${user.firstName} ${user.lastName} (${user.username})"),
                      subtitle: Text(user.email),
                      trailing: DropdownSelection(
                        initialSelection: user.role.name,
                        onValueChange: (value) {
                          usersQuery[index].reference.update({
                            "role": value,
                          });
                        },
                        items: Role.values.map((e) => e.name).toList(),
                        label: "Role",
                        isChildEnabled: (value) {
                          final bool notStaff = localRole == Role.user ||
                              localRole == Role.member;
                          final bool staffNotAllowed =
                              localRole == Role.staff &&
                                  (user.role == Role.staff ||
                                      user.role == Role.admin ||
                                      (value == "admin" || value == "staff"));

                          return !(notStaff || staffNotAllowed);
                        },
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
