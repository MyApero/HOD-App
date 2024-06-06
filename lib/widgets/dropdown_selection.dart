import 'package:flutter/material.dart';

class DropdownSelection extends StatefulWidget {
  const DropdownSelection({
    super.key,
    required this.onValueChange,
    required this.items,
    required this.label,
  });

  final void Function(String?) onValueChange;
  final List<String> items;
  final String label;

  @override
  State<DropdownSelection> createState() => _DropdownSelectionState();
}

class _DropdownSelectionState extends State<DropdownSelection> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      label: Text(widget.label),
      dropdownMenuEntries:
          widget.items.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          label: value,
          value: value,
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
