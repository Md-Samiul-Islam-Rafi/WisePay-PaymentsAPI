import 'package:flutter/material.dart';

class LabelDropdownCard extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;
  final String hintText;

  const LabelDropdownCard({
    super.key,
    required this.label,
    required this.items,
    this.value,
    required this.onChanged,
    this.hintText = "Select option",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),

        // Dropdown field
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F5F7),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 0.53,
                color: Color(0xFFE6E6E6),
              ),
            ),
          ),
          hint: Text(
            hintText,
            style: const TextStyle(fontSize: 13, color: Color(0xFFB5B5BE)),
          ),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
