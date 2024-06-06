import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hod_app/core/utils.dart';
import 'package:hod_app/widgets/hod_form_field.dart';
import 'package:intl/intl.dart';
import 'package:hod_app/widgets/ios_datetime_picker.dart';
import 'package:intl/date_symbol_data_local.dart';

class DatetimeFormPicker extends StatefulWidget {
  const DatetimeFormPicker({
    super.key,
    required this.onChanged,
    this.label = "DATE",
    this.validator,
  });

  final void Function(DateTime) onChanged;
  final String label;
  final String? Function(String?)? validator;

  @override
  State<DatetimeFormPicker> createState() => _DatetimeFormPickerState();
}

class _DatetimeFormPickerState extends State<DatetimeFormPicker> {
  final TextEditingController controller = TextEditingController();
  late DateFormat dateformat;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? date;
    if (context.mounted) {
      date = Platform.isIOS
          ? await showIosDatetimePicker(context)
          : await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );
    }
    if (date != null && context.mounted && !Platform.isIOS) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        date = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
      }
    }

    if (date != null) {
      setState(() {
        controller.text =
            "${DateFormat.MMMMEEEEd('fr_FR').format(date!)} à ${DateFormat.Hm('fr_FR').format(date)}"
                .capitalize();
      });
      widget.onChanged(date);
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return HodFormField(
      validator: widget.validator,
      label: widget.label,
      controller: controller,
      onTap: () {
        _selectDate(context);
      },
      readOnly: true,
      suffixIcon: const Icon(Icons.calendar_today),
      // decoration: InputDecoration(
      //   labelText: widget.label,
      //   filled: true,
      //   prefixIcon: const Icon(Icons.calendar_today),
      // ),
    );
  }
}
