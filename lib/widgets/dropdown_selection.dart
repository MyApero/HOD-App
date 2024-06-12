import 'package:flutter/material.dart';

class DropdownSelection extends StatefulWidget {
  const DropdownSelection({
    super.key,
    required this.onValueChange,
    required this.items,
    required this.label,
    this.initialSelection,
    this.isChildEnabled,
  });

  final void Function(String?) onValueChange;
  final List<String> items;
  final String label;
  final String? initialSelection;
  final bool Function(String value)? isChildEnabled;

  @override
  State<DropdownSelection> createState() => _DropdownSelectionState();
}

class _DropdownSelectionState extends State<DropdownSelection> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: widget.initialSelection,
      label: Text(widget.label),
      dropdownMenuEntries:
          widget.items.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          label: value,
          value: value,
          enabled: widget.isChildEnabled != null
              ? widget.isChildEnabled!(value)
              : true,
        );
      }).toList(),
      onSelected: (String? value) {
        setState(() {
          widget.onValueChange(value);
        });
      },
    );
  }
}
