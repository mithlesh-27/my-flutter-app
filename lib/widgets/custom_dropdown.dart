import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String hint;
  final ValueChanged<String?> onChanged;

  CustomDropdown({
    required this.value,
    required this.items,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
      ),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      isExpanded: true,
    );
  }
}
