import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hod/apis/local_api.dart';
import 'package:hod/constants/constants.dart';
import 'package:hod/features/background/app_scaffold.dart';
import 'package:hod/models/user_model.dart';
import 'package:hod/widgets/dropdown_selection.dart';
import 'package:hod/widgets/hod_form_field.dart';
import 'package:hod/widgets/simple_text.dart';

class ManageUsersRoleScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ManageUsersRoleScreen());
  const ManageUsersRoleScreen({super.key});

  @override
  State<ManageUsersRoleScreen> createState() => _ManageUsersRoleScreenState();
}

class _ManageUsersRoleScreenState extends State<ManageUsersRoleScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Gérer les membres",
      hasBackArrow: true,
      child: Column(
        children: [
          HodFormField(
            label: "Recherche...",
            controller: searchController,
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(DbConst.users)
                  .snapshots(),
              builder: (context, snapshots) {
                Role localRole = LocalApi.getCurrentUser()!.role;
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
                    .toList()
                    .where((element) {
                  return element.username
                          .toLowerCase()
                          .contains(searchText.toLowerCase()) ||
                      element.email
                          .toLowerCase()
                          .contains(searchText.toLowerCase());
                }).toList();

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
              },
            ),
          ),
        ],
      ),
    );
  }
}
