import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  DateTimePicker({super.key, required this.controller, this.label = "DATE"});

  final TextEditingController controller;
  final String label;

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onTap: () {
        _selectDate(context);
      },
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.label,
        filled: true,
        prefixIcon: Icon(Icons.calendar_today),
      ),
    );
  }

   Future<void> _selectDate(BuildContext context) async {
    DateTime ?date = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2034, 31, 12));

    if (date != null) {
       setState(() {
      widget.controller.text = date!.toIso8601String();
    });
    }
  }
}