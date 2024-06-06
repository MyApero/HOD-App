import 'package:flutter/material.dart';
import 'package:hod_app/apis/event_api.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/features/auth/controller/auth_api.dart';
import 'package:hod_app/widgets/background/app_scaffold.dart';
import 'package:hod_app/widgets/datetime_form_picker.dart';
import 'package:hod_app/widgets/dropdown_selection.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/hod_form_field.dart';

class CreateEvent extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => CreateEvent());
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final _formKey = GlobalKey<FormState>();

  String? selectedPole;
  DateTime? selectedFirstDate;
  DateTime? selectedEndDate;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Créer un event",
      hasBackArrow: true,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HodFormField(
              label: "Nom",
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ce champ est obligatoire";
                }
                return null;
              },
            ),
            DatetimeFormPicker(
              onChanged: (date) {
                setState(() {
                  selectedFirstDate = date;
                });
              },
              label: "Début",
              validator: (value) {
                if (selectedFirstDate == null || selectedEndDate == null) {
                  return "Ce champ est obligatoire";
                }
                if (selectedFirstDate!.isAfter(selectedEndDate!)) {
                  return "La début doit être avant la fin";
                }
                return null;
              },
            ),
            DatetimeFormPicker(
              onChanged: (date) {
                setState(() {
                  selectedEndDate = date;
                });
              },
              label: "Fin",
              validator: (value) {
                if (selectedFirstDate == null || selectedEndDate == null) {
                  return "Ce champ est obligatoire";
                }
                if (selectedEndDate!.isBefore(selectedFirstDate!)) {
                  return "La fin doit être après le début";
                }
                return null;
              },
            ),
            DropdownSelection(
                onValueChange: (value) {
                  setState(() {
                    selectedPole = value;
                  });
                },
                items: Pole.values.map((e) => e.name).toList(),
                label: "Pole"),
            HodFormField(label: "Lieu", controller: locationController),
            HodFormField(
                label: "Description", controller: descriptionController),
            HodButton(
                label: "Créer",
                onTapped: () {
                  if (_formKey.currentState!.validate()) {
                    EventApi.createEvent(
                      context: context,
                      name: nameController.text,
                      startDate: selectedFirstDate!,
                      endDate: selectedEndDate!,
                      createdBy: AuthApi.currentUser!.uid,
                      pole: selectedPole!,
                      location: locationController.text.isEmpty
                          ? "Epitech"
                          : locationController.text,
                      description: descriptionController.text,
                    );
                    showSnackBar(context, "Event créé avec amour <3");
                    Navigator.of(context).pop();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
