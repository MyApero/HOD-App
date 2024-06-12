import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/apis/report_api.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/models/report_model.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/widgets/dropdown_selection.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:hod_app/widgets/simple_text.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({super.key});

  static route() => MaterialPageRoute(builder: (ctx) => ReportScreen());

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedType = "";
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Ecrivez-nous !",
        hasBackArrow: true,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleText("Quel type de rapport souhaitez-vous nous envoyer ?"),
                DropdownSelection(
                    onValueChange: (value) {
                      setState(() {
                        if (value != null) {
                          selectedType = value;
                        }
                      });
                    },
                    items: ReportType.values.map((e) => e.name).toList(),
                    label: "Type"),
                SizedBox(height: 10),
                HodFormField(
                  controller: messageController,
                  label: "Votre rapport...",
                  maxLines: 10,
                  validator: (value) {
                    if (messageController.text.isEmpty) {
                      return "Ecrivez un rapport svpppp :(";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                HodButton(
                    label: "Envoyer",
                    onTapped: () {
                      if (selectedType.isEmpty) {
                        showSnackBar(
                            context, "Veuillez sélectionner un type de rapport");
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        String uid = AuthApi.currentUser!.uid;
                        ReportApi.pushReport(
                            context: context,
                            report: ReportModel(
                                message: messageController.text,
                                createdBy: uid,
                                createdAt: DateTime.now(),
                                type: selectedType));
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
