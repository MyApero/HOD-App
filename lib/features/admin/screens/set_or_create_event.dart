import 'package:flutter/material.dart';
import 'package:hod_app/apis/auth_api.dart';
import 'package:hod_app/apis/event_api.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/features/background/app_scaffold.dart';
import 'package:hod_app/models/event_model.dart';
import 'package:hod_app/widgets/datetime_form_picker.dart';
import 'package:hod_app/widgets/dropdown_selection.dart';
import 'package:hod_app/widgets/hod_button.dart';
import 'package:hod_app/widgets/hod_form_field.dart';

class SetOrCreateEvent extends StatefulWidget {
  static route({EventModel? event}) =>
      MaterialPageRoute(builder: (context) => SetOrCreateEvent(event: event));
  const SetOrCreateEvent({super.key, this.event});

  final EventModel? event;

  @override
  State<SetOrCreateEvent> createState() => _SetOrCreateEventState();
}

class _SetOrCreateEventState extends State<SetOrCreateEvent> {
  final _formKey = GlobalKey<FormState>();

  String? selectedPole;
  DateTime? selectedFirstDate;
  DateTime? selectedEndDate;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      selectedPole = widget.event!.pole;
      selectedFirstDate = widget.event!.startDate;
      selectedEndDate = widget.event!.endDate;
      nameController.text = widget.event!.name;
      locationController.text = widget.event!.location;
      descriptionController.text = widget.event!.description ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Créer un event",
      hasBackArrow: true,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              const SizedBox(height: 10),
              DatetimeFormPicker(
                onChanged: (date) {
                  setState(() {
                    selectedFirstDate = date;
                  });
                },
                label: "Début",
                initialValue: selectedFirstDate,
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
              const SizedBox(height: 10),
              DatetimeFormPicker(
                onChanged: (date) {
                  setState(() {
                    selectedEndDate = date;
                  });
                },
                label: "Fin",
                initialValue: selectedEndDate,
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
              const SizedBox(height: 10),
              DropdownSelection(
                  initialSelection: selectedPole,
                  onValueChange: (value) {
                    setState(() {
                      selectedPole = value;
                    });
                  },
                  items: Pole.values.map((e) => e.name).toList(),
                  label: "Pole"),
              const SizedBox(height: 10),
              HodFormField(label: "Lieu", controller: locationController),
              const SizedBox(height: 10),
              HodFormField(
                  label: "Description", controller: descriptionController),
              const SizedBox(height: 10),
              HodButton(
                  label: widget.event == null ? "Créer" : "Modifier",
                  onTapped: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.event == null) {
                        final bool eventCreated = await EventApi.createEvent(
                          context: context,
                          name: nameController.text,
                          startDate: selectedFirstDate!,
                          endDate: selectedEndDate!,
                          createdBy: AuthApi.currentUser!.uid,
                          pole: selectedPole,
                          location: locationController.text.isEmpty
                              ? "Epitech"
                              : locationController.text,
                          description: descriptionController.text,
                        );
                        if (eventCreated && context.mounted) {
                          showSnackBar(context, "Event créé avec amour <3");
                          Navigator.of(context).pop();
                        }
                      } else {
                        print(widget.event!.id);
                        final bool eventModified = await EventApi.modifyEvent(
                          context: context,
                          event: EventModel(
                            id: widget.event!.id,
                            name: nameController.text,
                            startDate: selectedFirstDate!,
                            endDate: selectedEndDate!,
                            createdBy: widget.event!.createdBy,
                            pole: selectedPole,
                            location: locationController.text.isEmpty
                                ? "Epitech"
                                : locationController.text,
                            description: descriptionController.text,
                          ),
                        );
                        if (eventModified && context.mounted) {
                          showSnackBar(context, "Event modifié avec amour <3");
                          Navigator.of(context).pop();
                        }
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
